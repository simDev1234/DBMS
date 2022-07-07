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

-- �ܷ� Ű ����
ALTER TALBE sawon
  ADD CONSTRAINT fk_sawon_deptno FOREIGN KEY(deptno)
                                 REFERENCES dept(deptno);
                                 
                                 -- on delete cascade(cascade : ����/ �θ�Ű�� �����Ǹ� �����ϴ� FK �����ϴ� ���ڵ嵵 �����ض�.)
                                 
SELECT TABLE sawon
  ADD CONSTRAINT fk_sawon_samgr FOREIGN KEY(samgr)
                                REFERENCES sawon(sabun);
                                

-- gobun : �� ��� ��� ��ȣ
create table gogek
(
    gobun number(3),             
    goname varchar2(30),
    goaddr varchar2(30),
    gojumin  varchar2(14),
    godam  number(3),
    
    constraint pk_gogek_gobun primary key(gobun)
)
/

ALTER TABLE gogek 
  ADD CONSTRAINT fk_gogek_godam FOREIGN KEY(godam) 
                                REFERENCES sawon(sabun);
                                
                                
                                