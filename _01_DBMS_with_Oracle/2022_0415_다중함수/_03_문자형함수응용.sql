-- �� ���̺��� ���￡ ��� ����� ��ȸ 
SELECT * FROM gogek;
SELECT * FROM gogek WHERE goaddr LIKE '����%';

-- �� ���̺��� ���︸ ������
SELECT
  goname,
  SUBSTR(goaddr,1,2) AS "��� ����"
  FROM gogek;

SELECT * FROM gogek
  WHERE SUBSTR(goaddr,1,2) = '����';
  
-- �� ���̺��� ���� ���� ����(�Լ��� �̿�)
-- �Լ����� �������� �� ���� ������ ���ϵȴ�. (�ӵ� ����) / ������ ���� ���°� ����.
SELECT * FROM gogek
  WHERE SUBSTR(gojumin,8,1) in ('0','2','4','6','8');
  
SELECT * FROM gogek
  WHERE TO_NUMBER(SUBSTR(gojumin,8,1)) in (0, 2, 4, 6, 8);
  
SELECT * FROM gogek
  WHERE MOD(TO_NUMBER(SUBSTR(gojumin,8,1)),2) = 0;