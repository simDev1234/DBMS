/*
 
    조인 (Join)
    : 2개 이상의 테이블을 연결해서 조회하는 방법
    
    1. 종류
      1) A inner join B : 행과 행이 1 : 1로 연결
      2) outer join : 
           A left  outer join B : A (left) 테이블 행은 모두 추출. B 테이블의 행은 조건에 만족하는 행만 추출.
           A right outer join B : B (right) 테이블 행은 모두 추출. A 테이블의 행은 조건에 만족하는 행만 추출. 
           A full  outer join B : 조건에 맞는 행은 결합 + 조건에 맞지 않더라도 A,B 나머지 행 모두 추출.
      3) A cross join B : A행 갯수 * B행 갯수
      4) self join      : 자신의 테이블과 연결
      
    ###1. inner join (= equi join) 
    
    (1) 일반적인 inner join 방식
    
    SELECT 
       sabun, saname, dname, loc
    FROM dept, sawon
    WHERE dept.deptno = sawon.deptno
    
    SELECT 
       sabun, saname, deptno, dname, loc   ---- 에러! why? deptno는 두개의 테이블 모두에 있음 
    FROM dept, sawon                            -- 열의 정의가 애매합니다. (어디의 deptno인지)
    WHERE dept.deptno = sawon.deptno
    
    SELECT
       sabun, saname, dept.deptno, dname, loc
    FROM dept, sawon
    WHERE dept.deptno = sawon.deptno
    
    (2) [ANSI-92 SQL] *ANSI : 표준 SQL (모든 DBMS에서 공통적으로 사용되는 명령)
    
    SELECT 
      *
    FROM dept d INNER JOIN sawon s ON d.deptno = s.deptno
              (조인 방식)             ON (조인 조건)
    
    ###2. cross join : 조인 조건 없이 연결
    
    SELECT * FROM dept, sawon
    
    [ANSI-92]
    SELECT * FROM dept CROSS JOIN sawon
    
    
    ###3. self join + inner join
    (사원정보)           (상사정보)
    사번    직급   사원명   상사사번   상사직급   상사명 
    
    SELECT
      s1.sabun, s1.sajob, s1.saname, -- 사원정보
      s2.sabun, s2.sajob, s2.saname  -- 상사정보
    FROM sawon s1, sawon s2
    WHERE s1.samgr = s2.sabun
    
    [left outer join oracle 문법]
    SELECT
      s1.sabun, s1.sajob, s1.saname, -- 사원정보
      s2.sabun, s2.sajob, s2.saname  -- 상사정보
    FROM sawon s1, sawon s2
    WHERE s1.samgr = s2.sabun(+)     -- s1.samgr은 모두 출력, s2.sabun부분은 null로 채우기
    
    cf ) MS-SQL server (left outer join)
         where s1.samgr *= s2.sabun
         
    [ANSI-92]
    SELECT
      s1.sabun, s1.sajob, s1.saname, -- 사원정보
      s2.sabun, s2.sajob, s2.saname  -- 상사정보
    FROM sawon s1 left outer join sawon s2 on s1.samgr = s2.sabun
    OREDER BY s1.sabun;
    
    
    ###5. full outer join : ANSI-92
    SELECT * 
    FROM dept d FULL OUTER JOIN sawon s ON d.deptno = s.deptno
    
    ### sawon + gogek
    사번      사원명    고객번호   고객명
    SELECT * FROM gogek order by gobun
    
    -- 고객이 있는 사원만 출력
    SELECT
      *
    FROM sawon s INNER JOIN gogek g ON s.sabun = g.godam
    ORDER BY sabun
    
    -- 고객이 없는 사원 포함 모두 출력
    SELECT
      *
    FROM sawon s LEFT OUTER JOIN gogek g ON s.sabun = g.godam
    WHERE gobun IS NULL
    
    -- 고객이 없는 사원만 출력
    SELECT
      sabun, saname, gobun, goname
    FROM sawon s LEFT OUTER JOIN gogek g ON s.sabun = g.godam
    --WHERE gobun IS NULL
    ORDER BY sabun
    
    
    Q. 아래와 같이 출력하라.(세 개의 테이블을 한 번에 조인)
    사번 사원명 부서번호 부서명 고객번호 고객명 
     sawon       dept      gogek
    
    SELECT 
      sabun, saname, 
      d.deptno, dname,
      gobun, goname
    FROM sawon s INNER JOIN dept d ON s.deptno = d.deptno  --(1) sawon, dept 결합한 테이블
         LEFT OUTER JOIN gogek g ON s.sabun = g.godam      --(2) 결합한 테이블에 gogek결합
    ORDER BY sabun
    
    Q. 아래 내용 대로 조회하세요.
    사번    사원명   부서번호  부서명  고객번호  고객명   상사번호  상사명   상사고객번호   상사고객명
       sawon s1      dept d      gogek g1        sawon s2         gogek g2
    
    SELECT
      s1.sabun as 사번,      s1.saname as 사원명,
      d.deptno as 부서번호,   d.dname as 부서명,
      g1.gobun as 고객번호,   g1.goname as 고객명,
      s2.samgr as 상사번호,   s2.saname as 상사명,
      g2.gobun as 상사고객변호, g2.goname as 상사고객명
    FROM sawon s1 INNER JOIN dept d ON s1.deptno = d.deptno
         LEFT OUTER JOIN gogek g1 ON s1.sabun = g1.gobun
         LEFT OUTER JOIN sawon s2 ON s1.sabun = s2.samgr
         LEFT OUTER JOIN gogek g2 ON s2.samgr = g2.gobun
    ORDER BY s1.sabun
          
*/