/*
 
  Q1. ��� ���̺��� ������ �ο���
  SELECT
    SUBSTR(SANAME, 1, 1) ����,
    COUNT(*) �ο���
  FROM SAWON
  GROUP BY SUBSTR(SANAME, 1, 1)
  ORDER BY SUBSTR(SANAME, 1, 1)
  
  Q2. ��� ���̺��� �Ի������ �ο���
  SELECT
    CASE FLOOR(TO_NUMBER(TO_CHAR(SAHIRE, 'MM'))/3) 
      WHEN 1 THEN '��'
      WHEN 2 THEN '����'
      WHEN 3 THEN '����'
      ELSE '�ܿ�'
    END AS ����,
    COUNT(*) �ο���
  FROM SAWON
  GROUP BY CASE FLOOR(TO_NUMBER(TO_CHAR(SAHIRE, 'MM'))/3) 
		      WHEN 1 THEN '��'
		      WHEN 2 THEN '����'
		      WHEN 3 THEN '����'
		      ELSE '�ܿ�'
		    END
  
  Q3. �����̺��� ������ ���� �����͸� �����ϼ���.
  : GOBUN, GONAME, GOJUMIN, BIRTH_YEAR
  -- BIRTH_YEAR : 90���, 2000��뿡 ���� ����� �ٸ�
  -- 2000��� ) �ֹ� ���� �α��ڰ� 3,4,7,8�϶� + 2000
  -- 1900��� ) �ֹ� ���� �ΰ��ڰ� 1,2,5,6�϶� + 1900
  -- 1800��� ) �ֹ� ���� �α��ڰ� 9,0�϶� + 1800
  
  SELECT
    GOBUN, GONAME, GOJUMIN,
    CASE 
      WHEN SUBSTR(GOJUMIN, 8, 1) IN ('1', '2' ,'5', '6') THEN TO_NUMBER(SUBSTR(GOJUMIN, 1, 2)) + 1900
      WHEN SUBSTR(GOJUMIN, 8, 1) IN ('9', '0') THEN TO_NUMBER(SUBSTR(GOJUMIN, 1, 2)) + 1800
      ELSE TO_NUMBER(SUBSTR(GOJUMIN, 1, 2)) + 2000
    END AS BIRTH_YEAR
  FROM GOGEK
  
  
  Q4. �����̺��� ������ ���� �����͸� �����ϼ���.
  : GOBUN, GONAME, GOJUMIN, LOCAL(�������)
  -- ������� : 9-10�ڸ� 
  
  SELECT
    GOBUN, GONAME, GOJUMIN,
    CASE 
      WHEN SUBSTR(GOJUMIN, 9, 2) BETWEEN '00' AND '08' THEN '����'
      WHEN SUBSTR(GOJUMIN, 9, 2) BETWEEN '09' AND '12' THEN '�λ�'
      WHEN SUBSTR(GOJUMIN, 9, 2) BETWEEN '13' AND '15' THEN '��õ'
      WHEN SUBSTR(GOJUMIN, 9, 2) BETWEEN '16' AND '25' THEN '��⵵'
      WHEN SUBSTR(GOJUMIN, 9, 2) BETWEEN '26' AND '34' THEN '������'   
      ELSE '��Ÿ'
    END AS LOCAL
  FROM GOGEK
  
  
  UPDATE GOGEK SET GOJUMIN = '660215-1123456' WHERE GOBUN = 1;
  UPDATE GOGEK SET GOJUMIN = '660215-1523456' WHERE GOBUN = 2;
  COMMIT
  
  
 */