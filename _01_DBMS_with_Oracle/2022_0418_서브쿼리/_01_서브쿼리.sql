-- ��� ���̺��� �ְ� �޿��ڸ� ����
SELECT * FROM SAWON
  WHERE SAPAY = (SELECT MAX(SAPAY) FROM SAWON);
  
-- ��� ���̺��� �� �μ��� �ְ� �޿��� ����

-- >> �Ʒ� �ڵ��� ���, �μ��� �����ϰų�, �μ���ȣ�� ����Ǹ� ������ �����ؾ��Ѵ�.
SELECT * FROM SAWON
  WHERE SAPAY = (SELECT MAX(SAPAY) FROM SAWON WHERE DEPTNO = 10) and DEPTNO = 10
        OR
        SAPAY = (SELECT MAX(SAPAY) FROM SAWON WHERE DEPTNO = 20) and DEPTNO = 20
        OR
        SAPAY = (SELECT MAX(SAPAY) FROM SAWON WHERE DEPTNO = 30) and DEPTNO = 30
        OR
        SAPAY = (SELECT MAX(SAPAY) FROM SAWON WHERE DEPTNO = 40) and DEPTNO = 40
  ORDER BY DEPTNO ASC;  -- �μ���ȣ�� ��������

-- ���� SQL���� ������ �ذ� 
-- >> ������� : �������� ������ ���������� �̿��ؼ� ����� ����� �������� �����ϴµ� �̿��Ѵ�. 
SELECT * FROM SAWON S1
  WHERE SAPAY = (SELECT MAX(SAPAY) FROM SAWON WHERE DEPTNO = S1.DEPTNO)
  ORDER BY S1.DEPTNO ASC; 
