/*
   Subquery
   : subquery(하위쿼리)의 실행결과를 이용해서 Mainquery(주쿼리)를 수행하는 쿼리문
   
   -- 사원 테이블에서 최불암과 동일한 부서 직원 추출
   1. 최불암의 부서 정보를 먼저 구한다.
   SELECT depno FROM sawon WHERE saname = '최불암'; 
   2. 10번 부서 직원 추출
   SELECT * FROM sawon WHERE depto = 10;
   
   -- 서브 쿼리 사용
   SELECT * FROM sawon 
     WHERE deptno = (SELECT deptno FROM sawon WHERE saname = '최불암')

   -- 사원 테이블에서 이미자보다 급여를 많이 받는 직원
   SELECT * FROM sawon
     WHERE sapay > (SELECT sapay FROM sawon WHERE saname = '이미자')
     
   -- 사원 테이블에서 이미자와 직급 같은 직원 추출
   SELECT * FROM sawon
     WHERE sajob = (SELECT sajob FROM sawon WHERE saname = '이미자')

   -- 사원 테이블에서 차범근과 동일한 연도에 입사한 직원 추출
   1.
   SELECT TO_CHAR(sahire,'YYYY') FROM sawon WHERE saname = '차범근'
   2.
   SELECT * FROM sawon
     WHERE TO_CHAR(sahire, 'YYYY') = '2005';
   
   SELECT * FROM sawon
     WHERE TO_CHAR(sahire, 'YYYY') = (SELECT TO_CHAR(sahire,'YYYY') FROM sawon WHERE saname = '차범근');
   
   -- Q1. 사원 테이블에서 장동건과 동일한 달(month)에 입사한 직원 추출
   SELECT * FROM sawon
     WHERE TO_CHAR(sahire, 'MM') = (SELECT TO_CHAR(sahire,'MM') FROM sawon WHERE saname = '장동건');   

   -- Q2. 사원 테이블에서 이미자와 동일한 계절에 입사한 직원 추출
   ▼ 뷰를 만들면 아래의 코드가 훨씬 간결해질 수 있다. 
   SELECT * FROM sawon
     	WHERE FLOOR(TO_NUMBER(TO_CHAR(sahire,'MM'))/3) = (SELECT FLOOR(TO_NUMBER(TO_CHAR(sahire,'MM'))/3) FROM sawon WHERE saname = '이미자')

   -- Q3. 사원 테이블에서 총 급여 평균 보다 더 급여를 많이 받는 직원 추출
   SELECT * FROM sawon
        WHERE sapay > (SELECT AVG(sapay) FROM sawon); 

   -- Q4. 사원 테이블에서 최초 입사한 직원을 추출
   SELECT MIN(sahire) FROM sawon
   
   SELECT * FROM sawon
     WHERE sahire = (SELECT MIN(sahire) FROM sawon)
     
   -- Q5. 사원 테이블에서 가장 최근 입사한 직원을 추출  
   SELECT * FROM sawon
     WHERE sahire = (SELECT MAX(sahire) FROM sawon)
     
   -- Q6. 사원 테이블에서 일자를 기준으로 최초입사자, 최근입사자를 모두 추출
   
   SELECT * FROM sawon
     WHERE sahire = (SELECT MIN(sahire) FROM sawon) 
           or 
           sahire = (SELECT MAX(sahire) FROM sawon)
   
   >> 같은 날짜에 입사한 사람 중 시간이 달라서 제외되는 경우 발생 
   
   ※ 문자도 SORTING이 된다 (A,B,C,D,.... 숫자면 1, 2, 3, 4....)
   SELECT * FROM sawon
     WHERE TO_CHAR(sahire,'YYYY-MM-DD') = (SELECT MIN(TO_CHAR(sahire,'YYYY-MM-DD')) FROM sawon) 
   
   INSERT INTO sawon VALUES(21,'최불암','남자',20,'과장',TO_DATE('1984-7-25 13:00:00','YYYY-MM-DD HH24:MI:SS'),2,3800);
   
   
*/