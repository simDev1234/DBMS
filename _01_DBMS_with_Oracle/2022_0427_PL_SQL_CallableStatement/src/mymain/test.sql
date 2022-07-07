-- 부서별 성별 인원수
SELECT
 deptno 부서번호,
 sasex 성별,
 count(*) 인원수
FROM SAWON
GROUP BY DEPTNO, sasex
order by deptno, sasex

-- 직급별 인원수
select 
  sajob 직급,
  count(*) 인원수
from sawon
group by sajob
order by sajob

-- 입사연도별 인원수
select
  to_char(sahire,'yyyy') 입사연도,
  count(*) 인원수
from sawon 
group by to_char(sahire, 'yyyy')
order by to_char(sahire, 'yyyy')

-- 입사월별 인원수
select
  to_char(sahire, 'mm') 입사월,
  count(*) 인원수
from sawon
group by to_char(sahire, 'mm')
order by to_char(sahire, 'mm')

-- 거주지별 지역별 인원수
select
  substr(goaddr,1,2) as 거주지,
  substr(goaddr,4,3) as 지역,
  count(*) 인원수
from gogek
group by substr(goaddr,1,2), substr(goaddr,4,3)
order by substr(goaddr,1,2), substr(goaddr,4,3)

-- 사원테이블에서 부서별 인원수가 5명 이상인 부서 
select 
  deptno 부서,
  count(*) 인원수
from sawon
group by deptno
having count(*) >= 5
order by deptno

-- 사원테이블에서 부서별급여평균이 3000~3200 사이인 부서를 구하라
select
  deptno 부서명,
  round(avg(sapay),2) 급여평균
from sawon
group by deptno
having round(avg(sapay),2) between 3000 and 3200
order by deptno

-- 고객테이블에서 출생계절별 인원수를 구하기 (inline view 사용)
select 
  g1.season 출생계절,
  count(*) 인원수
from (select 
        case floor(to_number(substr(gojumin,3,2))/3)
		    when 1 then '봄'
		    when 2 then '여름'
		    when 3 then '가을'
		    else '겨울'
        end season
      from gogek) g1
group by g1.season

