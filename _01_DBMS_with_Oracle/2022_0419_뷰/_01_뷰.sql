/*
 
 정형화된 데이터 https://kingofbackend.tistory.com/11
 
 뷰(View)
 https://coding-factory.tistory.com/224
  
 1. 가상의 테이블 : 테이블처럼 사용 가능
 2. 뷰의 사용 목적 :
   [1] 편리성 : 복잡한 명령/수식 등을 간결하게 사용 가능
   [2] 보안성 : 중요 데이터를 외부로 제한적으로 제공 (특정사용자에게 VIEW만 조회할 수 있는 권한만 제공하면 전체 데이터를 볼 수 없음)
 3. 뷰의 실제 형태 : 내부에 실행할 수 있는 SQL문을 저장 
 4. 뷰를 이용하려면 권한을 부여받아야 한다. (권한 : create view)
 grant create view to 계정 
 5. 형식
 CREATE OR REPLACE VIEW이름
 AS 
   SQL문장
 

 -- 사원테이블에서 남자 직원만 조회하는 뷰를 생성
 
 CREATE VIEW SAWON_VIEW_GENDER_MALE
 AS
   SELECT * FROM SAWON WHERE SASEX = '남자';
   
 **생성 후에 변경하고 싶을 때에는 CREATE OR REPLACE
 CREATE OR REPLACE VIEW SAWON_VIEW_GENDER_MALE
 AS
   SELECT * FROM SAWON WHERE SASEX = '남자';
 
     
 -- 뷰사용 (마치 테이블처럼 사용)
 
 SELECT * FROM SAWON_VIEW_GENDER_MALE;
 
 -- 사원 테이블에서 입사연도/입사월/입사일을 구하는 뷰
 * 조회 SELECT문을 먼저 만들고 뷰를 만들기
 
 CREATE OR REPLACE VIEW SAWON_VIEW
 AS
	 SELECT 
	   SABUN, SANAME, SASEX, DEPTNO, SAJOB, SAHIRE, SAMGR, SAPAY,
	   TO_NUMBER(TO_CHAR(SAHIRE, 'YYYY')) AS HIRE_YEAR,
	   TO_NUMBER(TO_CHAR(SAHIRE, 'MM')) AS HIRE_MONTH,
	   TO_NUMBER(TO_CHAR(SAHIRE, 'DD')) AS HIRE_DAY
	 FROM SAWON;
	 
 SELECT * FROM SAWON_VIEW;
 
 
 -- 입사연도별 인원수 구하기
 SELECT 
   HIRE_YEAR,  
   COUNT(*) 인원수
 FROM SAWON_VIEW
 GROUP BY HIRE_YEAR
 ORDER BY HIRE_YEAR; 
 
 [[[[ DESC SAWON_VIEW ]]]] 를 CMD에 입력하면 해당 뷰를 테이블처럼 확인 가능

 -- 기본 뷰 + 입사 계절    
 **인라인 뷰를 사용해서 조회할 도메인을 요약할 수 있다.
 **뷰를 통해 또 다른 뷰를 만들 수 있음
 
 << 에러 나는 코드 >>
 
 SELECT
   *,                  --- 에러! 오라클에서는 이처럼 사용 불가. (다른 MYSQL등은 사용 가능)
   HIRE_MONTH / 3
 FROM SAWON_VIEW 
 
 << 인라인 뷰 >>
 
 SELECT 
   SV.*,
   CASE FLOOR(HIRE_MONTH / 3)
     WHEN 1 THEN '봄'
     WHEN 2 THEN '여름'
     WHEN 3 THEN '가을'
     ELSE '겨울'
   END AS 입사계절
 FROM (SELECT * FROM SAWON_VIEW) SV         --- 뷰 테이블에 SV라고 임시 이름을 지정 *이때, 기존 SAWON_VIEW는 사용x
        
        
 << 기존 뷰에서 뷰를 또 만들기 >>
 CREATE OR REPLACE VIEW SAWON_VIEW2
 AS
	 SELECT 
	   SV.*,
	   CASE FLOOR(HIRE_MONTH / 3)
	     WHEN 1 THEN '봄'
	     WHEN 2 THEN '여름'
	     WHEN 3 THEN '가을'
	     ELSE '겨울'
	   END AS HIRE_SEASON
	 FROM (SELECT * FROM SAWON_VIEW) SV      
	 
 Q1. 사원 테이블에서 입사계절별 인원수
 
 SELECT 
   HIRE_SEASON,
   COUNT(*)
 FROM SAWON_VIEW2 
 GROUP BY HIRE_SEASON
 
 << 뷰의 보안성 이해 >>
 SELECT * FROM GOGEK; -- 주민번호는 민감한 개인정보. 앞의 6글자만 노출, 나머지는 *처리 필요
 
 SELECT 
   GOBUN, GONAME, GOADDR,
   SUBSTR(GOJUMIN, 1, 7) || '*******' AS GOJUMIN,
   ( 
     TO_NUMBER(SUBSTR(GOJUMIN,1,2)) +
     CASE
       WHEN TO_NUMBER(SUBSTR(GOJUMIN,8,1)) IN (1,2,5,6) THEN 1900
       WHEN TO_NUMBER(SUBSTR(GOJUMIN,8,1)) IN (3,4,7,8) THEN 2000
       ELSE 1800
     END 
   ) AS BIRTH_YEAR,
   GODAM
 FROM GOGEK 
 
 CREATE OR REPLACE VIEW GOGEK_VIEW
 AS
	 SELECT 
	   GOBUN, GONAME, GOADDR,
	   SUBSTR(GOJUMIN, 1, 7) || '*******' AS GOJUMIN,
	   ( 
	     TO_NUMBER(SUBSTR(GOJUMIN,1,2)) +
	     CASE
	       WHEN TO_NUMBER(SUBSTR(GOJUMIN,8,1)) IN (1,2,5,6) THEN 1900
	       WHEN TO_NUMBER(SUBSTR(GOJUMIN,8,1)) IN (3,4,7,8) THEN 2000
	       ELSE 1800
	     END 
	   ) AS BIRTH_YEAR,
	   GODAM
	 FROM GOGEK
     ORDER BY GOBUN
     
  SELECT * FROM GOGEK_VIEW;
  
  >> DBO 는 최고 관리자, DBA는 백단 제한 관리자(보안 등급 낮은사람) OR 실사용자가 될 수 있음 
  >> 특정 DBA에게 CONNECT권한만 부여하고 VIEW 테이블만 볼 수 있게 권한 부여 하면 제한된 엑세스만 가능하다.
  
  [[ DBO가 새로운 DBA에게 권한을 부여 -- 보안성의 확인 ]]
  
  << SYSTEM 계정으로 TEST7 계정을 생성 (권한은 CONNECT만) >>
  -- 위의 CONNECTION NAME을 ORACLE_SYSTEM으로 변경하고 작업
  
  CREATE USER TEST7 IDENTIFIED BY TEST7
  GRANT CONNECT TO TEST7
  
  << GOGEK_VIEW의 조회(SELECT)권한을 TEST7에게 준다 --- 소유주 TEST1 >>
  * 해당 개체(ENTITY, 테이블 또는 뷰)에 대한 권한은 소유주(DBO)가 부여한다.
  -- 위의 CONNECTION NAME을 ORACLE_TEST1으로 변경하고 작업
  
  GRANT SELECT ON GOGEK_VIEW TO TEST7
  
  << TEST7 계정으로 할 수 있는 일은 GOGEK_VIEW를 SELECT하는 것 뿐이다. >>
  SELECT * FROM GOGEK_VIEW   -- 에러! 누구의 뷰인지 알 수 없기 때문 (자기 자신에게 없음)
                             -- -- 위의 CONNECTION NAME을 ORACLE_SYSTEM으로 변경하고 작업
  SELECT * FROM TEST1.GOGEK_VIEW; 
  
  -- >> 전체 데이터의 일부만 노출   
  
                                                                                                    
  -- gogek_view를 이용해서 추가 필드(칼럼) 넣어본다   
  1. 기본 칼럼은 그대로 넣고 추가 (나이/띠)
  2. 뷰이름 : gogek_view2
  
  -- 나이와 띠 구하기
  -- 나이 : 현재 일자 - 생년월일 + 1
  -- 띠 : 
  
  CREATE OR REPLACE VIEW GOGEK_VIEW2
  AS
	  SELECT 
	    GV.*,
	    TO_NUMBER(TO_CHAR(SYSDATE,'YYYY')) - BIRTH_YEAR + 1 AS AGE,
	    CASE MOD(BIRTH_YEAR, 12)
	        WHEN 0 THEN '원숭이'
	        when  1   then '닭'
		    when  2   then '개'
		    when  3   then '돼지'
		    when  4   then '쥐'
		    when  5   then '소'
		    when  6   then '호랑이'
		    when  7   then '토끼'
		    when  8   then '용'
		    when  9   then '뱀'
		    when  10  then '말'
		    else '양'
	    END || '띠' as 띠,
	    
	    (
	    CASE MOD(BIRTH_YEAR, 10)
	        when  0   then '경'
		    when  1   then '신'
		    when  2   then '임'
		    when  3   then '계'
	        WHEN  4   THEN '갑'
	        when  5   then '을'
		    when  6   then '병'
		    when  7   then '정'
		    when  8   then '무'
		    when  9   then '기' 
	    END
	    ||
	    CASE MOD(BIRTH_YEAR, 12)
	        WHEN  0   THEN '신'
	        when  1   then '유'
		    when  2   then '술'
		    when  3   then '해'
		    when  4   then '자'
		    when  5   then '축'
		    when  6   then '인'
		    when  7   then '묘'
		    when  8   then '진'
		    when  9   then '사'
		    when  10  then '오'
		    when  11  then '미'
	    END
	    )as 간지
	  FROM (SELECT * FROM GOGEK_VIEW) GV

  
                                                                                                                                                                                                                                                                                                                                                                                                      
  
 
 */