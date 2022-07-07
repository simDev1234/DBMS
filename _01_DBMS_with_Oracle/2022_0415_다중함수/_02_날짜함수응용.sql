-- 사원테이블에서 각 직원들의 근무 연수, 근무 월수 조회
SELECT 
  SABUN, SANAME, SAHIRE,
  FLOOR(MONTHS_BETWEEN(SYSDATE, SAHIRE)/12) AS 근무연수,
  FLOOR(MOD(MONTHS_BETWEEN(SYSDATE,SAHIRE),12)) AS 잔여월수,
  FLOOR(MONTHS_BETWEEN(SYSDATE,SAHIRE)) AS 총근무월수,
  10000 AS 퇴직금,
  FLOOR(SAPAY/13) AS 월급
FROM SAWON;


-- 연봉제 퇴직금 계산법 (연봉에 퇴직금이 포함된 경우)
-- 월급 = 연봉 / 13 
-- 퇴직금 = 월급 * 근무연수 + 월급 * 잔여월수/12
--      = 월급 * 총 근무월수 / 12
--      = 월급 / 12 * 총 근무월수
SELECT
  SABUN, SANAME, SAHIRE,
  ROUND(SAPAY/13) AS 월급,
  ROUND((SAPAY/13) / 12 * MONTHS_BETWEEN(SYSDATE,SAHIRE)) AS 퇴직금
FROM SAWON;