/*

연산자
산술을 제외하고, 관계/논리/기타 모두 문자열에 사용 가능하다. 
산술은 문자열에 사용 불가하다.
1. 산술 연산자 : *  /
              +  - mod(피젯수, 젯수)
2. 관계 연산자 : >  >=  <  <=  =(같냐?)  != 또는 <> (같지 않냐?)
3. 논리 연산자 : and or not
4. 기타 연산자 : 
              필드 between A and B   <-- A~B사이냐?
              필드 in (A, B, C)      <-- 필드=A or 필드=B or 필드=C
5. 문자열 결합 : || 
6. 문자열 유사 검색
	필드 like ''
     % : 모든 문자 (길이 관계 없이) -- ex. 필드 like '이%' << '이'로 시작되는데, 뒤는 뭐가 오든 몇글자던 상관 없다. 
     _ : 모든 문자 (1문자)

-- 산술 연산자
* 오라클은 정수, 실수 개념이 없어서, 10/3은 실수로 나옴
* mod(x,y) --> 몫 구하는 
* dual은 오라클에서 기본적으로 제공하는 테이블
select 5+3, 6-4, 3*5, 10/3, mod(10,3) from dual

-- 사원 테이블
select * from test1.sawon

-- 부서 테이블
select * from dept

-- 고객 테이블
select * from gogek

-- 사원 테이블에서 10번 부서 직원만 추출
select * from sawon where deptno = 10;

-- heading : select의 결과로 추출된 임시 컬럼명
*연산 필드 : 기본 필드의 연산에 의해서 형성된 필드
select
   sabun as 사번, 
   saname 사원명,      -- as 생략가능 
   --sajob as 직 급,    -- 에러! 공백을 띄어서 표준명명법에 어긋남  
   sajob as "직 급",    -- OK 
   sapay,
   sapay * 0.1 as bonus  -- 연산 필드 형성 시 임시 헤드 사용
from sawon

-- 문자열 결합 : ||
select saname , '님 새해 복 많이 받으세요' from sawon
select saname || '님 새해 복 많이 받으세요' from sawon
select saname || '님 새해 복 많이 받으세요' as message from sawon

-- 사원테이블에서 과장만 추출
select * from sawon where sajob = '과장'   -- 문자 자료형의 경우 ' ' 
                                          -- 숫자 자료형에 ' '를 넣으면 다른 오라클 버전에서 작동X
               
-- 사원테이블에서 10번 부서의 과장만 추출
select * from sawon 
  where (deptno = 10) and (sajob = '과장');
  
-- 사원테이블에서 직급이 과장, 대리 추출
select * from sawon
  where sajob = '과장' or sajob = '대리';
  
select * from sawon
  where sajob in('과장', '대리');

-- 사원테이블에서 연봉이 3000 이상인 사람 추출
select * from sawon
  where sapay >= 3000  

-- 사원테이블에서 연봉이 3500~4000 사이인 직원 추출
select * from sawon
  where sapay >= 3500 and sapay <= 4000;
  
select * from sawon
  where sapay between 3500 and 4000;  --XML에서 < > 태그 사용하므로 >= ~ <= 보다, between을 쓰는게 좋다.
  
-- 사원테이블에서 samgr가 null인 직원 정보 추출 (부장)
select * from sawon
  where samgr = null      -- 에러! = null로 하면 안 됨

[null 체크 방법1]  필드 is null
[null 체크 방법2]  필드 is not null

select * from sawon
  where samgr is null;
  
-- 사원테이블에서 samgr가 null이 아닌 직원 추출 (부장이 아닌 직원)
select * from sawon
  where samgr is not null;

-- ▼ 가급적 아래 not(  ) 역조건은 사용하지 말 것 
-- why? SELECT를 두 번 하기 때문에 속도 저하 
select * from sawon
  where not (samgr is null)   
  
Q1. 사원테이블에서 20번 부서의 여자 직원만 추출
select * from sawon
  where deptno = 20 and sasex = '여자'

Q2. 사원테이블의 부서장 중 연봉이 4000만원 초과인 직원 추출
select * from sawon
  where sajob = '부장' and sapay > 4000;

6. 문자열 유사 검색식
**무조건 유사 검색식은 문자열만 가능

(1) 문자열 유사 검색식 : %(모든문자)
-- 사원테이블에서 성씨 '이'씨인 직원 추출 
select * from sawon
  where saname like '이%'

(2) 문자열 유사 검색식 : _  <<모든 문자 1개
-- 사원테이블에서 이름의 2번째 글자가 '미'인 직원
select * from sawon
  where saname like '_미%'
  
-- 고객테이블에서 남자만 출력
select * from gogek
  where gojumin like '______-1%' or
        gojumin like '______-3%' or
        gojumin like '______-5%' or
        gojumin like '______-7%' or
        gojumin like '______-9%'

++ 형변환 함수
-- 사원테이블에서 2000-1-1년 이전(1월 1일 포함)에 입사한 직원 추출
*Date자료형은 관계 연산자는 가능하다. (문자열 유사검색식은 안됨)
*날짜 데이터는 ' '안에 입력
select * from sawon
  where sahire <= '2000-1-1'  <<- 이거는 2000-1-1 00:00:00, 결국 1월 1일은 미포함이다.
  
select * from sawon
  where sahire < '2000-1-2'

select to_date('2000-1-1 12:23:41','YYYY-MM-DD HH24:MI:SS') from dual
select to_char(to_date('2000-1-1 12:23:41','YYYY-MM-DD HH24:MI:SS'),'HH24') from dual



*/

