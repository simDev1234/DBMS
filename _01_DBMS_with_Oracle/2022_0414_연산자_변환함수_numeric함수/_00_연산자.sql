/*

������
����� �����ϰ�, ����/��/��Ÿ ��� ���ڿ��� ��� �����ϴ�. 
����� ���ڿ��� ��� �Ұ��ϴ�.
1. ��� ������ : *  /
              +  - mod(������, ����)
2. ���� ������ : >  >=  <  <=  =(����?)  != �Ǵ� <> (���� �ʳ�?)
3. �� ������ : and or not
4. ��Ÿ ������ : 
              �ʵ� between A and B   <-- A~B���̳�?
              �ʵ� in (A, B, C)      <-- �ʵ�=A or �ʵ�=B or �ʵ�=C
5. ���ڿ� ���� : || 
6. ���ڿ� ���� �˻�
	�ʵ� like ''
     % : ��� ���� (���� ���� ����) -- ex. �ʵ� like '��%' << '��'�� ���۵Ǵµ�, �ڴ� ���� ���� ����ڴ� ��� ����. 
     _ : ��� ���� (1����)

-- ��� ������
* ����Ŭ�� ����, �Ǽ� ������ ���, 10/3�� �Ǽ��� ����
* mod(x,y) --> �� ���ϴ� 
* dual�� ����Ŭ���� �⺻������ �����ϴ� ���̺�
select 5+3, 6-4, 3*5, 10/3, mod(10,3) from dual

-- ��� ���̺�
select * from test1.sawon

-- �μ� ���̺�
select * from dept

-- �� ���̺�
select * from gogek

-- ��� ���̺��� 10�� �μ� ������ ����
select * from sawon where deptno = 10;

-- heading : select�� ����� ����� �ӽ� �÷���
*���� �ʵ� : �⺻ �ʵ��� ���꿡 ���ؼ� ������ �ʵ�
select
   sabun as ���, 
   saname �����,      -- as �������� 
   --sajob as �� ��,    -- ����! ������ �� ǥ�ظ����� ��߳�  
   sajob as "�� ��",    -- OK 
   sapay,
   sapay * 0.1 as bonus  -- ���� �ʵ� ���� �� �ӽ� ��� ���
from sawon

-- ���ڿ� ���� : ||
select saname , '�� ���� �� ���� ��������' from sawon
select saname || '�� ���� �� ���� ��������' from sawon
select saname || '�� ���� �� ���� ��������' as message from sawon

-- ������̺��� ���常 ����
select * from sawon where sajob = '����'   -- ���� �ڷ����� ��� ' ' 
                                          -- ���� �ڷ����� ' '�� ������ �ٸ� ����Ŭ �������� �۵�X
               
-- ������̺��� 10�� �μ��� ���常 ����
select * from sawon 
  where (deptno = 10) and (sajob = '����');
  
-- ������̺��� ������ ����, �븮 ����
select * from sawon
  where sajob = '����' or sajob = '�븮';
  
select * from sawon
  where sajob in('����', '�븮');

-- ������̺��� ������ 3000 �̻��� ��� ����
select * from sawon
  where sapay >= 3000  

-- ������̺��� ������ 3500~4000 ������ ���� ����
select * from sawon
  where sapay >= 3500 and sapay <= 4000;
  
select * from sawon
  where sapay between 3500 and 4000;  --XML���� < > �±� ����ϹǷ� >= ~ <= ����, between�� ���°� ����.
  
-- ������̺��� samgr�� null�� ���� ���� ���� (����)
select * from sawon
  where samgr = null      -- ����! = null�� �ϸ� �� ��

[null üũ ���1]  �ʵ� is null
[null üũ ���2]  �ʵ� is not null

select * from sawon
  where samgr is null;
  
-- ������̺��� samgr�� null�� �ƴ� ���� ���� (������ �ƴ� ����)
select * from sawon
  where samgr is not null;

-- �� ������ �Ʒ� not(  ) �������� ������� �� �� 
-- why? SELECT�� �� �� �ϱ� ������ �ӵ� ���� 
select * from sawon
  where not (samgr is null)   
  
Q1. ������̺��� 20�� �μ��� ���� ������ ����
select * from sawon
  where deptno = 20 and sasex = '����'

Q2. ������̺��� �μ��� �� ������ 4000���� �ʰ��� ���� ����
select * from sawon
  where sajob = '����' and sapay > 4000;

6. ���ڿ� ���� �˻���
**������ ���� �˻����� ���ڿ��� ����

(1) ���ڿ� ���� �˻��� : %(��繮��)
-- ������̺��� ���� '��'���� ���� ���� 
select * from sawon
  where saname like '��%'

(2) ���ڿ� ���� �˻��� : _  <<��� ���� 1��
-- ������̺��� �̸��� 2��° ���ڰ� '��'�� ����
select * from sawon
  where saname like '_��%'
  
-- �����̺��� ���ڸ� ���
select * from gogek
  where gojumin like '______-1%' or
        gojumin like '______-3%' or
        gojumin like '______-5%' or
        gojumin like '______-7%' or
        gojumin like '______-9%'

++ ����ȯ �Լ�
-- ������̺��� 2000-1-1�� ����(1�� 1�� ����)�� �Ի��� ���� ����
*Date�ڷ����� ���� �����ڴ� �����ϴ�. (���ڿ� ����˻����� �ȵ�)
*��¥ �����ʹ� ' '�ȿ� �Է�
select * from sawon
  where sahire <= '2000-1-1'  <<- �̰Ŵ� 2000-1-1 00:00:00, �ᱹ 1�� 1���� �������̴�.
  
select * from sawon
  where sahire < '2000-1-2'

select to_date('2000-1-1 12:23:41','YYYY-MM-DD HH24:MI:SS') from dual
select to_char(to_date('2000-1-1 12:23:41','YYYY-MM-DD HH24:MI:SS'),'HH24') from dual



*/

