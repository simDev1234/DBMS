/*
 
  Q1. 사원 테이블에서 성씨별 인원수
  SELECT
    SUBSTR(SANAME, 1, 1) 성씨,
    COUNT(*) 인원수
  FROM SAWON
  GROUP BY SUBSTR(SANAME, 1, 1)
  ORDER BY SUBSTR(SANAME, 1, 1)
  
  Q2. 사원 테이블에서 입사계절별 인원수
  SELECT
    CASE FLOOR(TO_NUMBER(TO_CHAR(SAHIRE, 'MM'))/3) 
      WHEN 1 THEN '봄'
      WHEN 2 THEN '여름'
      WHEN 3 THEN '가을'
      ELSE '겨울'
    END AS 계절,
    COUNT(*) 인원수
  FROM SAWON
  GROUP BY CASE FLOOR(TO_NUMBER(TO_CHAR(SAHIRE, 'MM'))/3) 
		      WHEN 1 THEN '봄'
		      WHEN 2 THEN '여름'
		      WHEN 3 THEN '가을'
		      ELSE '겨울'
		    END
  
  Q3. 고객테이블에서 다음과 같은 데이터를 추출하세요.
  : GOBUN, GONAME, GOJUMIN, BIRTH_YEAR
  -- BIRTH_YEAR : 90년대, 2000년대에 따라 계산방식 다름
  -- 2000년대 ) 주민 앞의 두글자가 3,4,7,8일때 + 2000
  -- 1900년대 ) 주민 앞의 두갈자가 1,2,5,6일때 + 1900
  -- 1800년대 ) 주민 앞의 두글자가 9,0일때 + 1800
  
  SELECT
    GOBUN, GONAME, GOJUMIN,
    CASE 
      WHEN SUBSTR(GOJUMIN, 8, 1) IN ('1', '2' ,'5', '6') THEN TO_NUMBER(SUBSTR(GOJUMIN, 1, 2)) + 1900
      WHEN SUBSTR(GOJUMIN, 8, 1) IN ('9', '0') THEN TO_NUMBER(SUBSTR(GOJUMIN, 1, 2)) + 1800
      ELSE TO_NUMBER(SUBSTR(GOJUMIN, 1, 2)) + 2000
    END AS BIRTH_YEAR
  FROM GOGEK
  
  
  Q4. 고객테이블에서 다음과 같은 데이터를 추출하세요.
  : GOBUN, GONAME, GOJUMIN, LOCAL(출생지역)
  -- 출생지역 : 9-10자리 
  
  SELECT
    GOBUN, GONAME, GOJUMIN,
    CASE 
      WHEN SUBSTR(GOJUMIN, 9, 2) BETWEEN '00' AND '08' THEN '서울'
      WHEN SUBSTR(GOJUMIN, 9, 2) BETWEEN '09' AND '12' THEN '부산'
      WHEN SUBSTR(GOJUMIN, 9, 2) BETWEEN '13' AND '15' THEN '인천'
      WHEN SUBSTR(GOJUMIN, 9, 2) BETWEEN '16' AND '25' THEN '경기도'
      WHEN SUBSTR(GOJUMIN, 9, 2) BETWEEN '26' AND '34' THEN '강원도'   
      ELSE '기타'
    END AS LOCAL
  FROM GOGEK
  
  
  UPDATE GOGEK SET GOJUMIN = '660215-1123456' WHERE GOBUN = 1;
  UPDATE GOGEK SET GOJUMIN = '660215-1523456' WHERE GOBUN = 2;
  COMMIT
  
  
 */