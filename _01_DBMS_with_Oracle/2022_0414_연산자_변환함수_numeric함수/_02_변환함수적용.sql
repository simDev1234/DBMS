/*

-- 사원테이블에서 입사년도, 입사월, 입사일 별도 추출
select 
   sabun,saname,sahire,                 -- 기본필드
   -- to_char(sahire,'YYYY') as 입사년도   -- 연산필드
   to_number(to_char(sahire,'YYYY')) as 입사년도,
   to_number(to_char(sahire,'MM')) as 입사월,
   to_number(to_char(sahire,'DD')) as 입사일
from sawon

-- 사원테이블에서 1900년대에 입사한 직원 추출

select * from sawon
  where to_number(to_char(sahire,'YYYY')) < 2000

-- Q1. 사원테이블에서 7월에 입사한 직원 추출
select * from sawon
  where to_number(to_char(sahire,'MM')) = 7

-- Q2. 사원테이블에서 봄에 입사한 직원 추출
select * from sawon
  where to_number(to_char(sahire,'MM')) in (3, 4, 5)

-- 고객 테이블에서 서울 사는 고객만 추출
select * from gogek
  where goaddr like '서울%';

*/

