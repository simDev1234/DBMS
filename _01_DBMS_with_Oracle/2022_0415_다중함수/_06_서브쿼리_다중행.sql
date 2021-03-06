/*
  http://www.gurubee.net/lecture/1503
   
   -- 사원 테이블에서 최불암과 동일한 부서 직원 추출
   SELECT * FROM sawon 
     WHERE deptno = (SELECT deptno FROM sawon WHERE saname = '최불암')
   
   >> 단일 행 결과 나옴 (= , >= , <= , != 모두 단일행 찾을 때 사용)
   
   INSERT INTO sawon VALUES(21,'최불암','남자',20,'과장',TO_DATE('1984-7-25 13:00:00','YYYY-MM-DD HH24:MI:SS'),2,3800);
   
   >> 오류 발생 (단일 행이 아님으로 나타남)
   
   **** 해결 : in (  ) 을 사용
   ** IN은 같냐를 바꾼 것
   SELECT * FROM sawon
     WHERE deptno IN (SELECT deptno FROM sawon WHERE saname = '최불암')
   
   
   **ANY를 붙이면 다중행 있을 때,
   3000이상 받는지 OR 3500이상 받는지
   -- (이미자가 둘 이상 있을 떄) 사원 테이블에서 이미자와 같거나 더 큰 급여를 받는 직원 추출
   SELECT * FROM sawon
     WHERE sajob >= ANY (SELECT sajob FROM sawon WHERE saname = '이미자')
   
   **ALL를 붙이면 다중행 있을 때.
   3000이상이면서 35000이상이어야한다. 
   -- (이미자가 둘 이상 있을 떄) 사원 테이블에서 이미자와 같거나 더 큰 급여를 받는 직원 추출
   SELECT * FROM sawon
     WHERE sajob >= ALL (SELECT sajob FROM sawon WHERE saname = '이미자')
   
   **DISTINCT하면 도메인 내 중복값 제거
   SELECT DISTINCT deptno FROM sawon
     ORDER BY deptno
   
   
*/