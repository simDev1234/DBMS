/*

-- ������̺��� �Ի�⵵, �Ի��, �Ի��� ���� ����
select 
   sabun,saname,sahire,                 -- �⺻�ʵ�
   -- to_char(sahire,'YYYY') as �Ի�⵵   -- �����ʵ�
   to_number(to_char(sahire,'YYYY')) as �Ի�⵵,
   to_number(to_char(sahire,'MM')) as �Ի��,
   to_number(to_char(sahire,'DD')) as �Ի���
from sawon

-- ������̺��� 1900��뿡 �Ի��� ���� ����

select * from sawon
  where to_number(to_char(sahire,'YYYY')) < 2000

-- Q1. ������̺��� 7���� �Ի��� ���� ����
select * from sawon
  where to_number(to_char(sahire,'MM')) = 7

-- Q2. ������̺��� ���� �Ի��� ���� ����
select * from sawon
  where to_number(to_char(sahire,'MM')) in (3, 4, 5)

-- �� ���̺��� ���� ��� ���� ����
select * from gogek
  where goaddr like '����%';

*/

