/*
 SELECT * FROM DEPT;
  
   DEPTNO DNAME LOC
 ------ ----- ---
     10 총무부   101
     20 영업부   202
     30 전산실   303
     40 관리부   404
     50 경리부   505


  1. DECODE 
     형식 : DECODE(필드(연산식), 비교값1, 결과값1,
                            비교값2, 결과값2,
                            비교값3, 결과값3,
                            기본값)
  
  SELECT 
     SABUN,
     SANAME,
     DEPTNO,
     DECODE(DEPTNO, 10, '총무부', 
                    20, '영업부', 
                    30, '전산실', 
                    40, '관리부', '경리부') AS DNAME
  FROM SAWON      

    
  2. CASE ~ END
     형식 1 : 하나의 조건에 대한 값을 비교하여 결과를 얻는다.
        CASE 필드(연산식)
          WHEN 비교값1 THEN 결과값1
          WHEN 비교값2 THEN 결과값2
          WHEN 비교값3 THEN 결과값3
          ELSE 기본값
        END
        
  --CASE ~END문 이용해서 부서명 출력
        
  SELECT 
     SABUN,
     SANAME,
     DEPTNO,
     CASE DEPTNO
       WHEN 10 THEN '총무부'
       WHEN 20 THEN '영업부'
       WHEN 30 THEN '전산실'
       WHEN 40 THEN '관리부'
       ELSE '경리부'
     END AS DNAME
  FROM SAWON
 
     형식2 : 각각의 조건에 대한 별개의 결과를 얻는다.
       CASE 
         WHEN 조건1 THEN 결과값1
         WHEN 조건2 THEN 결과값2
         ELSE 기본값
       END

  --CASE ~END 문 이용해서 성별 추출
  SELECT
    GOBUN,
    GONAME,
    GOJUMIN,
    CASE
      WHEN SUBSTR(GOJUMIN,8,1) IN ('1', '3', '5', '7', '9') THEN '남자'
      WHEN SUBSTR(GOJUMIN,8,1) IN ('2', '4', '6', '8', '0') THEN '여자'
    END AS GENDER
  FROM GOGEK;
  
  SELECT
    GOBUN,
    GONAME,
    GOJUMIN,
    CASE
      WHEN TO_NUMBER(SUBSTR(GOJUMIN,8,1)) IN (1,3,5,7,9) THEN '남자'
      WHEN TO_NUMBER(SUBSTR(GOJUMIN,8,1)) IN (2,4,6,8,0) THEN '여자'
    END AS GENDER
  FROM GOGEK;
  
  
  Q1. 사원테이블에서 사번, 이름, 입사시즌(입사계절)을 추출
  SELECT
    SABUN AS 사번,
    SANAME AS 이름,
    CASE FLOOR(TO_NUMBER(TO_CHAR(SAHIRE,'MM'))/3)
      WHEN 1 THEN '봄'
      WHEN 2 THEN '여름'
      WHEN 3 THEN '가을'
      ELSE '겨울'
    END AS 입사시즌
  FROM SAWON
  
  Q2. 고객테이블에서 고객번호, 고객이름, 고객의 출생 계절 추출
  
  -- [형식1]
  SELECT
    GOBUN,
    GONAME,
    CASE FLOOR(TO_NUMBER(SUBSTR(GOJUMIN,3,2))/3)
      WHEN 1 THEN '봄'
      WHEN 2 THEN '여름'
      WHEN 3 THEN '가을'
      ELSE '겨울'
    END AS 출생계절
  FROM GOGEK;
  
  -- [형식2]
  SELECT
    GOBUN,
    GONAME,
    GOJUMIN,
    CASE 
      WHEN SUBSTR(GOJUMIN,3,2) IN ('03','04','05') THEN '봄'
      WHEN SUBSTR(GOJUMIN,3,2) IN ('06','07','08') THEN '여름'
      WHEN SUBSTR(GOJUMIN,3,2) IN ('09','10','11') THEN '가을'
      ELSE '겨울'
    END 출생계절
  FROM GOGEK
  
  
  3. NVL(필드, 대체값)       : NULL이면 대체값 대입 (NULL이 아니면 그대로 사용)
     NVL2(필드, 참값 ,거짓값) : NULL이 아니면 참값, NULL이면 거짓값
  *NVL = NULL VALUE
  *대체값의 자료형 타입은 기존 칼럼과 동일하게 맞춰야한다.
          
  SELECT 
    SABUN, SANAME, SAMGR, NVL(SAMGR, 0) AS SAMGR2, NVL2(SAMGR, 1, 0) AS SAMGR3
  FROM SAWON
  
  INSERT INTO SAWON(SABUN) VALUES(21)
  
  SELECT 
    SABUN, SANAME, NVL(SANAME,'알수없음')
  FROM SAWON
  
  
  
  

*/