create table sawon
(
   sabun number(3),
   saname varchar2(30),
   sasex  varchar2(10),
   deptno  number(3),     -- 부서번호
   sajob   varchar2(10),  -- 직급
   sahire  date,
   samgr  number(3),  -- 사수매니저 번호
   sapay   number(8), -- 연봉
   
   constraint pk_sawon_sabun primary key(sabun)
)
/