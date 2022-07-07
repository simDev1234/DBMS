/*
��������(Constraint)
1. ������ ���Ἲ(Data Integrity)�� �����ϱ� ���� ����
2. ���� 
   1) not null (null ��� ����) or null(���)
   2) unique  : ������ ���� �ߺ��� ��� �� ��
   3) check   : ���ǿ� �´� ���� ���
   4) default : �⺻��
   5) primary key : �⺻Ű
      : not null + unique + index����
   6) foreign key : �ܷ�Ű
      : ���� �Է�(����) ���� ��ȿ���� �ܺ� ���̺� �θ�Ű(�÷�)�� �����ؼ� üũ
*/

-- [not null] �������� : inline������θ� �� �� �ִ�.
create table tb1
(
--  ����         �ڷ���          ��������
   name     varchar2(100)   not null,  --not null : null������� ���� *�ζ��� ���(���� �ȿ� �Ҽ�)
   nickname varchar2(100)   null       --null��� *������> �⺻��:null
)

insert into tb1 values('ȫ�浿','�ϳ�');  --OK
insert into tb1(name) values ('�̱浿'); --OK
insert into tb1(nickname) values('�����'); --����! : not null ���� ����
insert into tb1 values('�ٳ���',null);

select * from tb1

-- [unique] : ������ �� �ߺ��� ��� �� ��
create table tb2
(
   id  varchar2(100) not null unique, --�ߺ� ��������(not null + unique)
   pwd varchar2(100) not null
)

insert into tb2 values('one','1234'); -- OK
insert into tb2 values('two','5678'); -- OK
insert into tb2 values('one','4567')  -- ����! : unique ����      *Unique���� �˷��ִ� �ڵ� 
                                      -- ORA-00001: ���Ἲ ���� ����(TEST1.SYS_C004061)�� ����˴ϴ�

-- <���� ���Ǹ� ����> *�����޼������� Ȯ�� ����
-- (1) ���̺� ���� �� alter�� ���� : �������Ǹ��� ����ڰ� ����
create table tb22
(
   id  varchar2(100) not null, --�ߺ� ��������(not null + unique)
   pwd varchar2(100) not null
)

--����� ���Ƿ� ���������� ���� : �����������Ī �������Ǹ�(�����κ���) 
--*����� ���� ��Ī�� �ĺ��� ��� ��Ģ�� ������.--
alter table tb22 
   add constraint unique_tb22_id  unique(id);
  
insert into tb22 values('one','1234'); -- OK
insert into tb22 values('one','2234'); -- ����! 
                                       -- ORA-01735: �������� ALTER TABLE �ɼ��Դϴ�

select * from tb22

--(2) inline + ���� �̸� �ο�
create table tb222
(
  id  varchar2(100) not null,
  pwd varchar2(100) not null,
  
  constraint unique_tb222_id unique(id)
)

insert into tb222 values('one','1234'); -- OK
insert into tb222 values('one','2234'); -- ����! 
                                        -- ORA-00001: ���Ἲ ���� ����(TEST1.UNIQUE_TB222_ID)�� ����˴ϴ�

--[check] : ���ǿ� �´� ���� ���
--������ 
-----��� ������     : */ mod(������,����)
-----���� ������     : > >= < <= =(����?) !=(���� ����?) <>(���� ����?)  #����� boolean
-----�Ϲ� �� ������ : and or not                                  #����� boolean
-----��Ÿ          : �ʵ� �Ǵ� ���� between A and B (A~B���̳�?)
                --  �ʵ� in(A,B,C)              (�ʵ�=A or �ʵ�=B or �ʵ�=C) 

create table tb3
(
   name varchar2(100) not null,
-- (1) inline ���� ����
   kor  int  check(kor >= 0 and kor <=100),  
   eng  int,
   mat  int,
-- (2) ���̺� �ϴܿ� ���� ����
   constraint check_tb3_eng check(eng between 0 and 100)
)

-- (3) [���� �������� ���] ������ ���̺� �����Ͽ� ���� ����
alter table tb3
  add constraint check_tb3_mat check(mat between 0 and 100)

insert into tb3 values('�ϱ浿',88,99,100);  
  
-- ���� �ڵ�
-- insert�� ����, update�� �� �������� Ȯ��
insert into tb3 values('�̱浿',-1,99,99);  -- ORA-02290: üũ ��������(TEST1.SYS_C004073)�� ����Ǿ����ϴ�
insert into tb3 values('�̱浿',88,101,99); -- ORA-02290: üũ ��������(TEST1.CHECK_TB3_ENG)�� ����Ǿ����ϴ�
insert into tb3 values('��浿',88,10,999); -- ORA-02290: üũ ��������(TEST1.CHECK_TB3_ENG)�� ����Ǿ����ϴ�

-- �������� Ȯ�ι��(���Ἲ �������ǿ� ���� ������ Dictionary�� �����)
-- : user_constraints�� ����
---** CMD���� ��ü constaints���� Ȯ�� >> desc user_constraints
select * from user_constraints where 1 = 2;  --data �����ϰ� heading�� Ȯ��
select constraint_type,constraint_name,table_name from user_constraints
--dictionary�ȿ� �ִ� ������ ��� �빮���̹Ƿ�, Ư�� ���� �˻� �� �빮�ڷ� �˻��ؾ��Ѵ�.
select constraint_type,constraint_name,table_name from user_constraints
  where table_name='TB3';
--�ҹ��� -> �빮�� ��ȯ �Լ� : upper()
select constraint_type,constraint_name,table_name from user_constraints
  where table_name=upper('tb3');


create table tb33
(
   name   varchar2(100) not null,
   gender varchar2(100) not null
)

--#���� : ������ '����' �Ǵ� '����' �����θ� �Էµǰ� �������� ���� 
--(��,��,male,female �� ���� �ϰ��� ������ �� ����)
  
alter table tb33 
  add constraint check_tb33_gender check(gender in('����','����'));
  
insert into tb33 values('��ö��','����');  -- OK
insert into tb33 values('�迵��','��');   -- ����!
insert into tb33 values('�迵��','���� '); -- ����! (���� ����)

select * from tb33;

--[default] : �Է����� �ʾ��� �� �⺻��
create table tb4
(
  name    varchar2(100)  not null,
  age     int            default 1,
  gender  varchar2(100)  default '����',
  regdate date           default sysdate 
)

insert into tb4 values('�ϱ浿',20,'����','2022-4-12') -- '��-��-��' �Ǵ� '��/��/��' 04�� or 4�� ��� ok
insert into tb4 values('�ϱ浿',20,'����',to_date('2022-4-12','yyyy-mm-dd'))
insert into tb4(name) values('�̱浿');
insert into tb4 values('��浿',default,default,default)
insert into tb4 values('��浿',30,'����',default)

select * from tb4

--[primary key] : �⺻Ű *���ڵ�(��)�� ��ǥ�� �� �ִ� �÷�
--not null + unique + index  <-- �ڵ� ������
--      (�ߺ���������)  + (�ε���):��ȸ�������(�˻�Tree)
--HDB(Ʈ������),NDB(��Ʈ��ũ����),RDB(������ ���̺�),OODB(��ü��) *����� RDB
create table tb5
(
   idx  int,                     --�Ϸù�ȣ(PK)
   name varchar2(100) not null,
   tel  varchar2(100) null
)

--�⺻Ű ����
alter table tb5
  add constraint pk_tb5_idx primary key(idx);

select constraint_type, constraint_name, table_name from user_constraints
  where table_name=upper('tb5')

insert into tb5 values(1,'�ϱ浿','010-111-1111') -- OK
insert into tb5(name) values('�̿���'); --����! ORA-01400: NULL�� ("TEST1"."TB5"."IDX") �ȿ� ������ �� �����ϴ�
                                      --not null�� �ɸ�
insert into tb5 values(1,'���浿','010-222-1111') -- ����! ORA-00001: ���Ἲ ���� ����(TEST1.PK_TB5_IDEX)�� ����˴ϴ�
                                                -- unique�� �ɸ�

--2�� �̻��� �÷��� ��� PK�� ����� �� �ִ�.
create table tb55
(
   idx     int,
   name    varchar2(100),
   regdate date
)
alter table tb5
  add constraint pk_tb55_idx_regdate primary key(idx,regdate)

insert into tb55 values(1,'�ϱ浿',sysdate) --������ �����ص� OK
                                          --why? idx�� regdate ������ ��� �ٸ��� �ٸ� ������ �ν�
                                          --ȸ�翡�� �ܿ�-���ø� ������ �� 1�ܿ�,1����/1�ܿ�,2���÷� ������ �Ͱ� ����� �� ����

--�������� �̿��� idx ó��
create table tb555
(
   idx     int,
   regdate date default sysdate
)

alter table tb555
  add constraint pk_tb555_idx primary key(idx);
                   (��������)

----------------------------------------
--sequence : �Ϸù�ȣ ������ü *���̺�� ������ ��ü/�������� �����Ұ�(������ ���� MAX�� ���� ���� ����)   
--*�������� ����Ŭ���� �ִ�.                
--1) ����
create sequence seq_tb555_idx

--2) ���
select seq_tb555_idx.nextVal from dual
select seq_tb555_idx.nextVal , seq_tb555_idx.currVal from dual

--3) ����
drop sequence seq_tb555_idx
---------------------------------------------------------
--////�������� �̿��ؼ� idx���� �ֱ�
create sequence seq_tb555_idx
insert into tb555 values(seq_tb555_idx.nextVal, sysdate)
select * from tb555;


--[foreign key] : �ܷ�Ű <- �����ϴ� [�θ�] Ű ���� �����ؼ� insert/update ���� ����
create table student
(
   �й�     int,
   �̸�     varchar2(100) not null,
   ��ȭ     varchar2(100) not null,
   ��ȣ�ڸ�  varchar2(100) not null,
   ��ȣ������ varchar2(100),
   �ּ�     varchar2(100)
)

alter table student 
  add constraint pk_student_�й� primary key(�й�);

insert into student values(1, '�ϱ浿','111-1111','�Ͼƺ�','�ڿ���','����');
insert into student values(2, '�̱浿','222-2222','�̾ƺ�','ȸ���','��õ');

select * from student

create table score
(
  �Ϸù�ȣ int,
  �й�    int,
  ����    int,
  ����    int,
  ����    int,
  �г�    int,
  �б�    int,
  �������� varchar2(100) 
)

-- �⺻Ű
alter table score
  add constraint pk_����_�Ϸù�ȣ primary key(�Ϸù�ȣ)

-- �ܷ�Ű
alter table score
  add constraint fk_����_�й� foreign key(�й�) references student(�й�);  
  
insert into score values(1, 1, 100, 90, 40, 1, 1, '�߰����') -- OK
insert into score values(1, 2, 100, 90, 40, 1, 1, '�߰����') -- ����! 
                                                           -- ORA-00001: ���Ἲ ���� ����(TEST1.PK_����_�Ϸù�ȣ)�� ����˴ϴ�
insert into score values(2, 1, 100, 100, 100, 1, 1, '�⸻���');
insert into score values(3, 1, 100, 90, 30, 1, 2, '�߰����');
select * from score;