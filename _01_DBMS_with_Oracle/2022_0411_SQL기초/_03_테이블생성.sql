/*
-- ���� ���� ���̺� 
                (���̺��)
   create table sungjuk 
   (
     -- �ʿ��� �׸�(column)
     -- ������ �ڷ���
        name varchar2(100),    --1 //sql�� ������ 1���� ����
        kor  number(3),        --2
        eng  int,              --3
        mat  int               --4
   )

-- DML(Data Manipulation Language) : insert update delete select

                             --����Ŭ���� ���ڿ��� ������ ' '
   -- �߰�      (���̺��)       (�ʵ� �������)
   insert into sungjuk values( '�ϱ浿', 90, 80, 70 );
   
   --          (���̺��)�Է��� Į���� ���� ����   
   insert into sungjuk(kor,eng,mat,name) values(77,88,99,'�̱浿');
   insert into sungjuk values('��浿', 90, 80, 70);

   -- ���� (���̺��)    Į����=��   ������ 
   update sungjuk set kor=100               --�̷��� �ϸ� ��� kor���� �� 100���� �ٲ�
   update sungjuk set kor=100 where name = '�̱浿';
   update sungjuk set kor=100,eng=100,mat=100 where name = '�ϱ浿'; 
   update sungjuk set kor=100,eng=100,mat=100 where name = '��浿'; 

   -- ����      (���̺��) �༱�� ������
   delete from sungjuk                         -- �̷��� �ϸ� ��� ������ ������
   delete from sungjuk where 1=1;              -- �׻� ���̶� ��� ����(���ٴ� '=', ���Ե� '=')
   delete from sungjuk where name = '��浿';    

   -- ��ȸ
   -- ��ü ��ȸ (*�� '��� Į��'�� �ǹ�)
   select * from sungjuk
   -- �κ� ��ȸ
   select
   	   name,kor      -- �⺻�ʵ�
   from sungjuk
   -- ���� ��ȸ
   select
   	   name,kor,eng,mat,
   	   (kor+eng+mat) as tot     -- as tot : �̸��� tot�� �شٴ� ��(HEADING - ���̺��� �Ӹ��κ�)
   from sungjuk
   -- ��ձ��� ��ȸ
   select
   	   name,kor,eng,mat,
   	   (kor+eng+mat) as tot,     -- as tot : �̸��� tot�� �شٴ� ��(HEADING - ���̺��� �Ӹ��κ�)
   	   (kor+eng+mat)/3 as mean
   from sungjuk
    -- ������� ��ȸ
   select
   	   name,kor,eng,mat,         -- �⺻ �ʵ�
   	   (kor+eng+mat) as tot,     -- ���� �ʵ�
   	   (kor+eng+mat)/3 as mean,  -- ���� �ʵ�
   	   rank() over(order by (kor+eng+mat) desc) as rank -- ���� �ʵ�
   from sungjuk
    -- �Ҽ��� ù°�ڸ����� �ݿø�
   select
   	   name,kor,eng,mat,         -- �⺻ �ʵ�
   	   (kor+eng+mat) as tot,     -- ���� �ʵ�
   	   round((kor+eng+mat)/3,.1) as mean,  -- ���� �ʵ�
   	   rank() over(order by (kor+eng+mat) desc) as rank -- ���� �ʵ�
   from sungjuk
   
-- DDL(Data Definition Language) : create(����), drop(����), alter(����)
    --���̺� ����(Į�� �߰�)
               (���̺��)    (�߰��� Į�� ����)
   alter table sungjuk add sci int ;
   
    update sungjuk set sci = 50;   -- where�� �����Ǹ� ��ü ���ڵ带 ������� ������
   --Į���� �ϳ� �߰��Ǹ�, ������ ���굵 �� �����ؾ��ϴ� ����� ���� (������ ���踦 ó���� �� ���־�� ��)
   -- ������� ��ȸ
   select
   	   name,kor,eng,mat,sci,         -- �⺻ �ʵ�
   	   (kor+eng+mat+sci) as tot,     -- ���� �ʵ�
   	   (kor+eng+mat+sci)/4 as mean,  -- ���� �ʵ�
   	   rank() over(order by (kor+eng+mat+sci) desc) as rank -- ���� �ʵ�
   from sungjuk 
   
    --���̺� ����(Į�� ����)
                      (���̺��) (������ Į�� ����)
   alter table sungjuk modify (sci int not null);   -- null ��� �� �Ѵ�.
   
    --���� �߰�
   alter table sungjuk add music int;
    --���� ����(�ٸ� DB������ ���� ��ġ�Ƿ� ���� �ʴ� ���� ����)
   alter table sungjuk drop column music;  
   
    --��ü ���̺� ���� (ó������ �ٽ� �����ؾ��Ѵ�... �����ؾ���)
    *���� ���忡���� �۾������� transaction�� �÷��ΰ�, ���±��� �۾��� ����ϰų� ������Ʈ �� �� �ְ� �Ѵ�.
    drop table sungjuk;
  
  create or replace view sawon_view_man
  AS
  select * 
  from sawon where sasex = '����'
  
    
*/

