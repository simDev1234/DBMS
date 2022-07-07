/*
DDL (Data Definition Language) : create drop alter
1. ���� ���� 
create user test(����) identified by test(��й�ȣ)
create user test1 identified by test1

2. ���� �ο�
grant connect to test1       --- ���� ����
grant resource to test1      --- �ڿ�(Table) ���� ������ �� �ִ� ����
grant create view to test1   --- �ڿ�(View) ���� ������ �� �ִ� ����

-- ���� 2�� ����� �� ���� ó��
grant connect,resource to test1

3. ���� ȸ��(���)
revoke connect,resource from test1


----### ��ü���� : scott -> test1���� dept�� ��ȸ(SELECT)�� �� �ִ� ���� �ο� 
---(�۾��� scott�� �ϰ�, ��ȸ ���Ѹ� )
grant all   -- ��� ���� �ο�(����)
      (����)     (��ü)   (���)
grant select on dept to test1   -- ���� �ο�

revoke select on dept from test1  -- ���� ȸ��
*/