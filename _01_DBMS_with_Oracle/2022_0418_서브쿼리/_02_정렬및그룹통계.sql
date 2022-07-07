/*
 
  ���� (SORT) *asc ��������, desc �������� (������ ����Ʈ asc)
  : ORDER BY �ʵ� [asc | desc]   
             -- 1�� ����          2�� ���� 
  : ORDER BY �ʵ�1 [asc | desc], �ʵ�2 [asc | desc]
  
  SELECT * FROM SAWON
    ORDER BY DEPTNO asc, SASEX asc;
  
  
  �׷����
  : GROUP BY �ʵ�  *�ʵ� = �׷�ȭ ��ų Į��
  ** SELECT ~ FROM�� ���� �� �ִ� �׸�, GROUP BY �÷�, ����Լ�(COUTN,SUM,AGV,MIN,MAX..)
  
  --�μ��� �ο� �� 
  SELECT  
    DEPTNO AS �μ���ȣ,       --[4]
    COUNT(*) AS �ο���       
  FROM SAWON               --[1] �������
  WHERE 1 = 1              --[2]
  GROUP BY DEPTNO          --[3]
  ORDER BY DEPTNO          --[5]
  
  --GROUP BY�� �� ���, SELECT �ؿ��� �ش� �׷� �Ǵ� �����Լ��� �� �� �ִ�.
  
   --�μ��� �ο� ��, �޿��հ�
  SELECT  
    DEPTNO AS �μ���ȣ,       --[4]
    COUNT(*) AS �ο���,
    SUM(SAPAY) AS �޿��հ�,
    AVG(SAPAY) AS �޿����,
    MAX(SAPAY) AS �ִ�޿�,
    MIN(SAPAY) AS �ּұ޿�,
    MIN(SAHIRE) AS �����Ի�����,
    MAX(SAHIRE) AS �ֱ��Ի�����       
  FROM SAWON               --[1] �������
  WHERE 1 = 1              --[2]
  GROUP BY DEPTNO          --[3]
  ORDER BY DEPTNO          --[5]

  
  --�μ��� ���� �ο� ��
  SELECT 
    DEPTNO AS �μ���,
    SASEX AS ����,
    COUNT(*) AS �ο��� 
  FROM SAWON
  GROUP BY DEPTNO, SASEX
  ORDER BY DEPTNO, SASEX
  
  
  --���޺� �ο� ��
  SELECT 
   SAJOB AS ����,
   COUNT(*) AS "���� �� �ο���"
  FROM SAWON
  GROUP BY SAJOB
  ORDER BY SAJOB
  
  
  --������̺��� �Ի翬���� �ο� �� ��ȸ
  SELECT
    TO_CHAR(SAHIRE, 'YYYY') AS �Ի�⵵,
    COUNT(*) AS �ο���
  FROM SAWON
  GROUP BY TO_CHAR(SAHIRE, 'YYYY')
  ORDER BY TO_CHAR(SAHIRE, 'YYYY')
  
  
  --������̺��� �Ի���� �ο� ��
  SELECT
    TO_CHAR(SAHIRE,'MM') AS �Ի��,
    COUNT(*) AS �ο���
  FROM SAWON
  GROUP BY TO_CHAR(SAHIRE, 'MM')
  ORDER BY TO_CHAR(SAHIRE, 'MM')
  
  
  --������̺��� �Ի��뺰 �ο��� (1980���, 90���..)
  SELECT
     TRUNC(TO_NUMBER(TO_CHAR(SAHIRE,'YYYY')), -1) AS �Ի���,
     COUNT(*)
  FROM SAWON
  GROUP BY TRUNC(TO_NUMBER(TO_CHAR(SAHIRE,'YYYY')), -1)
  ORDER BY TRUNC(TO_NUMBER(TO_CHAR(SAHIRE,'YYYY')), -1)
  
  -- >> �Լ��� ���� ����ؼ� ������ ���̱�
  SELECT
     SUBSTR(TO_CHAR(SAHIRE,'YYYY'),1,3) || '0���' AS �Ի���,
     COUNT(*)
  FROM SAWON
  GROUP BY SUBSTR(TO_CHAR(SAHIRE,'YYYY'),1,3)
  ORDER BY SUBSTR(TO_CHAR(SAHIRE,'YYYY'),1,3)
  
  -- �����̺��� ������(��/�� ����) �ο��� ���϶�
  SELECT 
    SUBSTR(GOADDR, 1, 2) AS ����,
    COUNT(*) AS �ο���
  FROM GOGEK
  GROUP BY SUBSTR(GOADDR, 1, 2)
  ORDER BY SUBSTR(GOADDR, 1, 2)   --�����ټ�
  
  -- �����̺��� ��� ������ �ο��� ���϶�
  SELECT 
    CASE FLOOR(TO_NUMBER(SUBSTR(GOJUMIN, 3,2)) / 3)
             WHEN 1 THEN '��'
             WHEN 2 THEN '����'
             WHEN 3 THEN '����'
             ELSE '�ܿ�'
    END AS ����, 
    COUNT(*) AS "������ �ο���" 
  FROM GOGEK
  GROUP BY CASE FLOOR(TO_NUMBER(SUBSTR(GOJUMIN, 3,2)) / 3)
             WHEN 1 THEN '��'
             WHEN 2 THEN '����'
             WHEN 3 THEN '����'
             ELSE '�ܿ�'
    	   END 

  --> �ζ��� ��.. (���Ŀ� ��� ����)  
  SELECT 
    SEASON ����,
    COUNT(*) �ο���
  FROM (SELECT
         CASE FLOOR(TO_NUMBER(SUBSTR(GOJUMIN, 3,2)) / 3)
             WHEN 1 THEN '��'
             WHEN 2 THEN '����'
             WHEN 3 THEN '����'
             ELSE '�ܿ�'
    	 END SEASON
        FROM GOGEK)
  GROUP BY SEASON
  ORDER BY �ο���
  
  
  -- GROUP BY�� HAVING�� : GROUP BY ����� ���� ������
  
  --����. �μ��� �ο��� ������� 5�� �̻��� �μ��� �ο��� ���
  SELECT                 ---[4]
    DEPTNO,
    COUNT(*)
  FROM SAWON             ---[1]
  GROUP BY DEPTNO        ---[2]
  HAVING COUNT(*) >= 5   ---[3]
  
  --�޿� ����� 3000���� ���� �μ�
  SELECT 
    DEPTNO,
    AVG(SAPAY)
  FROM SAWON
  GROUP BY DEPTNO
  HAVING AVG(SAPAY) < 3000
  
  SELECT                ---[5]     
    DEPTNO,
    AVG(SAPAY)
  FROM SAWON            ---[1]
  WHERE DEPTNO <> 20    ---[2]
  GROUP BY DEPTNO       ---[3] 
  HAVING AVG(SAPAY) BETWEEN 3000 AND 3200  --[4]
  
  
            
 */

