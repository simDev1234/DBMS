/*

  집(통)계 함수
  1. COUNT(필드) : 도메인의 갯수를 구한다. (null은 포함하지 않는다.)
     COUNT(*)   : 전체레코드 수 구하기
  
  SELECT COUNT(*), COUNT(samgr) FROM sawon;

  2. SUM(), AVG(), MAX(), MIN()
  (1) SUM(숫자) : 도메인의 합
  SELECT 
     SUM(sapay) AS "전체 급여 합계" 
  FROM sawon;
  
  (2) AVG(숫자) : 도메인의 평균
  SELECT
     AVG(sapay) AS "전체 급여 평균"
  FROM sawon;
  
  (3) MAX(숫자 또는 날짜) : 도메인 내의 최대값
  * DATE형의 최대값은 가장 최신 날짜
  SELECT
     MAX(sapay) AS "최대 급여액",
     MAX(sahire) AS "가장 최근 입사자 일자"
  FROM sawon;
  
  (4) MIN(숫자 또는 날짜) : 도메인 내의 최소값
  * DATE형의 최대값은 가장 이전 날짜
  SELECT
     MIN(sapay) AS "최소 급여액",
     MIN(sahire) AS "가장 최초 입사자 일자"
  FROM sawon;

*/