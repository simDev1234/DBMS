/*

  ��(��)�� �Լ�
  1. COUNT(�ʵ�) : �������� ������ ���Ѵ�. (null�� �������� �ʴ´�.)
     COUNT(*)   : ��ü���ڵ� �� ���ϱ�
  
  SELECT COUNT(*), COUNT(samgr) FROM sawon;

  2. SUM(), AVG(), MAX(), MIN()
  (1) SUM(����) : �������� ��
  SELECT 
     SUM(sapay) AS "��ü �޿� �հ�" 
  FROM sawon;
  
  (2) AVG(����) : �������� ���
  SELECT
     AVG(sapay) AS "��ü �޿� ���"
  FROM sawon;
  
  (3) MAX(���� �Ǵ� ��¥) : ������ ���� �ִ밪
  * DATE���� �ִ밪�� ���� �ֽ� ��¥
  SELECT
     MAX(sapay) AS "�ִ� �޿���",
     MAX(sahire) AS "���� �ֱ� �Ի��� ����"
  FROM sawon;
  
  (4) MIN(���� �Ǵ� ��¥) : ������ ���� �ּҰ�
  * DATE���� �ִ밪�� ���� ���� ��¥
  SELECT
     MIN(sapay) AS "�ּ� �޿���",
     MIN(sahire) AS "���� ���� �Ի��� ����"
  FROM sawon;

*/