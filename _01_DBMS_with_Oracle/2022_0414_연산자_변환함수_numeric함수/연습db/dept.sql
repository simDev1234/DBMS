create table dept
(
   deptno number(3),
   dname  varchar2(100),
   loc       varchar2(10),
   constraint pk_dept_deptno primary key(deptno)
)
/