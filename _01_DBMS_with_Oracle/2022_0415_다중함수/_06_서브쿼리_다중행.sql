/*
  http://www.gurubee.net/lecture/1503
   
   -- ��� ���̺��� �ֺҾϰ� ������ �μ� ���� ����
   SELECT * FROM sawon 
     WHERE deptno = (SELECT deptno FROM sawon WHERE saname = '�ֺҾ�')
   
   >> ���� �� ��� ���� (= , >= , <= , != ��� ������ ã�� �� ���)
   
   INSERT INTO sawon VALUES(21,'�ֺҾ�','����',20,'����',TO_DATE('1984-7-25 13:00:00','YYYY-MM-DD HH24:MI:SS'),2,3800);
   
   >> ���� �߻� (���� ���� �ƴ����� ��Ÿ��)
   
   **** �ذ� : in (  ) �� ���
   ** IN�� ���ĸ� �ٲ� ��
   SELECT * FROM sawon
     WHERE deptno IN (SELECT deptno FROM sawon WHERE saname = '�ֺҾ�')
   
   
   **ANY�� ���̸� ������ ���� ��,
   3000�̻� �޴��� OR 3500�̻� �޴���
   -- (�̹��ڰ� �� �̻� ���� ��) ��� ���̺��� �̹��ڿ� ���ų� �� ū �޿��� �޴� ���� ����
   SELECT * FROM sawon
     WHERE sajob >= ANY (SELECT sajob FROM sawon WHERE saname = '�̹���')
   
   **ALL�� ���̸� ������ ���� ��.
   3000�̻��̸鼭 35000�̻��̾���Ѵ�. 
   -- (�̹��ڰ� �� �̻� ���� ��) ��� ���̺��� �̹��ڿ� ���ų� �� ū �޿��� �޴� ���� ����
   SELECT * FROM sawon
     WHERE sajob >= ALL (SELECT sajob FROM sawon WHERE saname = '�̹���')
   
   **DISTINCT�ϸ� ������ �� �ߺ��� ����
   SELECT DISTINCT deptno FROM sawon
     ORDER BY deptno
   
   
*/