create table sawon
(
   sabun number(3),
   saname varchar2(30),
   sasex  varchar2(10),
   deptno  number(3),     -- �μ���ȣ
   sajob   varchar2(10),  -- ����
   sahire  date,
   samgr  number(3),  -- ����Ŵ��� ��ȣ
   sapay   number(8), -- ����
   
   constraint pk_sawon_sabun primary key(sabun)
)
/