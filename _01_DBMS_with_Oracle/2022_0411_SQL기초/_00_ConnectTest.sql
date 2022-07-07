/*
  범위 주석
*/

-- xxx.sql화일 내에서 1줄 주석은 : --
-- 범위 주석은 : /* */

-- hr계정에서 사용함
-- 사원 정보 조회
select * from EMPLOYEES
-- 마지막에 세미콜론은 선택사항/ 한줄 드래그하여 Alt+x하면 실행됨

-- 부서 정보 조회
select * from DEPARTMENTS;

-- AWS 계정 
select * from TEST:

--scott 계정
/*
주석 처리한 상태로도 실행 가능
select * from emp;
*/

/*
-- dept 테이블과 emp 테이블을 조인하는 예제
SELECT e.empno, e.ename, d.dname
  FROM dept d, empe
WHERE d.deptno = e.deptno;

--오라클 접속이 안되면 -> 검색 -> 서비스
  1. OracleServiceXE
  2. OracleXETNSListener
  실행확인 
  3. ojdbc14.jar이 제위치에 있는지 확인
  
-- 오라클 접속 안될때 CMD창에서 확인 하는 법
-- cmd창에서 리스터가 작동하는지 확인하고, 미작동시 start로 작동
   c:\>lsnrctl
   LSNRCTL>status    -- 리스너 상태 확인
   LSNRCTL>start     -- 리스너 시작
   LSNRCTL>stop      -- 리스터 중지
     
SELECT * FROM dept;

select * from sawon

select * from gogek_view2

SELECT 
  v2.*,
  TO_NUMBER(SUBSTR(GOJUMIN,3,2)) as birth_month,
  TO_NUMBER(SUBSTR(GOJUMIN,5,2)) as birth_day
FROM gogek_view v2 

SELECT
  TO_NUMBER(SUBSTR(GOJUMIN,3,2)) as birth_month,
  TO_NUMBER(SUBSTR(GOJUMIN,5,2)) as birth_day
FROM sawon s LEFT OUTER JOIN gogek_view2 v2 ON s.sabun = v2.godam 



    
*/

/*
  create user test1 identified by test1
  
*/
