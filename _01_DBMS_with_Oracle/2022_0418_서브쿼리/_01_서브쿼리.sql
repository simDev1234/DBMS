-- 사원 테이블에서 최고 급여자를 추출
SELECT * FROM SAWON
  WHERE SAPAY = (SELECT MAX(SAPAY) FROM SAWON);
  
-- 사원 테이블에서 각 부서별 최고 급여자 추출

-- >> 아래 코드의 경우, 부서가 증가하거나, 부서번호가 변경되면 일일히 수정해야한다.
SELECT * FROM SAWON
  WHERE SAPAY = (SELECT MAX(SAPAY) FROM SAWON WHERE DEPTNO = 10) and DEPTNO = 10
        OR
        SAPAY = (SELECT MAX(SAPAY) FROM SAWON WHERE DEPTNO = 20) and DEPTNO = 20
        OR
        SAPAY = (SELECT MAX(SAPAY) FROM SAWON WHERE DEPTNO = 30) and DEPTNO = 30
        OR
        SAPAY = (SELECT MAX(SAPAY) FROM SAWON WHERE DEPTNO = 40) and DEPTNO = 40
  ORDER BY DEPTNO ASC;  -- 부서번호별 오름차순

-- 위의 SQL문의 문제점 해결 
-- >> 상관쿼리 : 주쿼리의 정보를 서브쿼리가 이용해서 추출된 결과를 주쿼리를 선택하는데 이용한다. 
SELECT * FROM SAWON S1
  WHERE SAPAY = (SELECT MAX(SAPAY) FROM SAWON WHERE DEPTNO = S1.DEPTNO)
  ORDER BY S1.DEPTNO ASC; 
