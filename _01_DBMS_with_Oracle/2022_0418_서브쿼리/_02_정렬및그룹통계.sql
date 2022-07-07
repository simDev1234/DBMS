/*
 
  정렬 (SORT) *asc 오름차순, desc 내림차순 (생략시 디폴트 asc)
  : ORDER BY 필드 [asc | desc]   
             -- 1차 정렬          2차 정렬 
  : ORDER BY 필드1 [asc | desc], 필드2 [asc | desc]
  
  SELECT * FROM SAWON
    ORDER BY DEPTNO asc, SASEX asc;
  
  
  그룹통계
  : GROUP BY 필드  *필드 = 그룹화 시킬 칼럼
  ** SELECT ~ FROM에 들어올 수 있는 항목, GROUP BY 컬럼, 통계함수(COUTN,SUM,AGV,MIN,MAX..)
  
  --부서별 인원 수 
  SELECT  
    DEPTNO AS 부서번호,       --[4]
    COUNT(*) AS 인원수       
  FROM SAWON               --[1] 실행순서
  WHERE 1 = 1              --[2]
  GROUP BY DEPTNO          --[3]
  ORDER BY DEPTNO          --[5]
  
  --GROUP BY를 쓸 경우, SELECT 밑에는 해당 그룹 또는 집계함수가 들어갈 수 있다.
  
   --부서별 인원 수, 급여합계
  SELECT  
    DEPTNO AS 부서번호,       --[4]
    COUNT(*) AS 인원수,
    SUM(SAPAY) AS 급여합계,
    AVG(SAPAY) AS 급여평균,
    MAX(SAPAY) AS 최대급여,
    MIN(SAPAY) AS 최소급여,
    MIN(SAHIRE) AS 최초입사일자,
    MAX(SAHIRE) AS 최근입사일자       
  FROM SAWON               --[1] 실행순서
  WHERE 1 = 1              --[2]
  GROUP BY DEPTNO          --[3]
  ORDER BY DEPTNO          --[5]

  
  --부서별 성별 인원 수
  SELECT 
    DEPTNO AS 부서명,
    SASEX AS 성별,
    COUNT(*) AS 인원수 
  FROM SAWON
  GROUP BY DEPTNO, SASEX
  ORDER BY DEPTNO, SASEX
  
  
  --직급별 인원 수
  SELECT 
   SAJOB AS 직급,
   COUNT(*) AS "직급 별 인원수"
  FROM SAWON
  GROUP BY SAJOB
  ORDER BY SAJOB
  
  
  --사원테이블에서 입사연도별 인원 수 조회
  SELECT
    TO_CHAR(SAHIRE, 'YYYY') AS 입사년도,
    COUNT(*) AS 인원수
  FROM SAWON
  GROUP BY TO_CHAR(SAHIRE, 'YYYY')
  ORDER BY TO_CHAR(SAHIRE, 'YYYY')
  
  
  --사원테이블에서 입사월별 인원 수
  SELECT
    TO_CHAR(SAHIRE,'MM') AS 입사월,
    COUNT(*) AS 인원수
  FROM SAWON
  GROUP BY TO_CHAR(SAHIRE, 'MM')
  ORDER BY TO_CHAR(SAHIRE, 'MM')
  
  
  --사원테이블에서 입사년대별 인원수 (1980년대, 90년대..)
  SELECT
     TRUNC(TO_NUMBER(TO_CHAR(SAHIRE,'YYYY')), -1) AS 입사년대,
     COUNT(*)
  FROM SAWON
  GROUP BY TRUNC(TO_NUMBER(TO_CHAR(SAHIRE,'YYYY')), -1)
  ORDER BY TRUNC(TO_NUMBER(TO_CHAR(SAHIRE,'YYYY')), -1)
  
  -- >> 함수를 적게 사용해서 성능을 높이기
  SELECT
     SUBSTR(TO_CHAR(SAHIRE,'YYYY'),1,3) || '0년대' AS 입사년대,
     COUNT(*)
  FROM SAWON
  GROUP BY SUBSTR(TO_CHAR(SAHIRE,'YYYY'),1,3)
  ORDER BY SUBSTR(TO_CHAR(SAHIRE,'YYYY'),1,3)
  
  -- 고객테이블에서 지역별(시/도 기준) 인원수 구하라
  SELECT 
    SUBSTR(GOADDR, 1, 2) AS 지역,
    COUNT(*) AS 인원수
  FROM GOGEK
  GROUP BY SUBSTR(GOADDR, 1, 2)
  ORDER BY SUBSTR(GOADDR, 1, 2)   --가나다순
  
  -- 고객테이블에서 출생 계절별 인원수 구하라
  SELECT 
    CASE FLOOR(TO_NUMBER(SUBSTR(GOJUMIN, 3,2)) / 3)
             WHEN 1 THEN '봄'
             WHEN 2 THEN '여름'
             WHEN 3 THEN '가을'
             ELSE '겨울'
    END AS 계절, 
    COUNT(*) AS "계절별 인원수" 
  FROM GOGEK
  GROUP BY CASE FLOOR(TO_NUMBER(SUBSTR(GOJUMIN, 3,2)) / 3)
             WHEN 1 THEN '봄'
             WHEN 2 THEN '여름'
             WHEN 3 THEN '가을'
             ELSE '겨울'
    	   END 

  --> 인라인 뷰.. (차후에 배울 예정)  
  SELECT 
    SEASON 계절,
    COUNT(*) 인원수
  FROM (SELECT
         CASE FLOOR(TO_NUMBER(SUBSTR(GOJUMIN, 3,2)) / 3)
             WHEN 1 THEN '봄'
             WHEN 2 THEN '여름'
             WHEN 3 THEN '가을'
             ELSE '겨울'
    	 END SEASON
        FROM GOGEK)
  GROUP BY SEASON
  ORDER BY 인원수
  
  
  -- GROUP BY의 HAVING절 : GROUP BY 결과에 대한 조건절
  
  --예시. 부서별 인원수 결과에서 5명 이상인 부서의 인원수 출력
  SELECT                 ---[4]
    DEPTNO,
    COUNT(*)
  FROM SAWON             ---[1]
  GROUP BY DEPTNO        ---[2]
  HAVING COUNT(*) >= 5   ---[3]
  
  --급여 평균이 3000보다 작은 부서
  SELECT 
    DEPTNO,
    AVG(SAPAY)
  FROM SAWON
  GROUP BY DEPTNO
  HAVING AVG(SAPAY) < 3000
  
  SELECT                ---[5]     
    DEPTNO,
    AVG(SAPAY)
  FROM SAWON            ---[1]
  WHERE DEPTNO <> 20    ---[2]
  GROUP BY DEPTNO       ---[3] 
  HAVING AVG(SAPAY) BETWEEN 3000 AND 3200  --[4]
  
  
            
 */

