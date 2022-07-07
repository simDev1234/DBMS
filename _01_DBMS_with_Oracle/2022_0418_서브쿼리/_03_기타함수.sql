/*
 SELECT * FROM DEPT;
  
   DEPTNO DNAME LOC
 ------ ----- ---
     10 �ѹ���   101
     20 ������   202
     30 �����   303
     40 ������   404
     50 �渮��   505


  1. DECODE 
     ���� : DECODE(�ʵ�(�����), �񱳰�1, �����1,
                            �񱳰�2, �����2,
                            �񱳰�3, �����3,
                            �⺻��)
  
  SELECT 
     SABUN,
     SANAME,
     DEPTNO,
     DECODE(DEPTNO, 10, '�ѹ���', 
                    20, '������', 
                    30, '�����', 
                    40, '������', '�渮��') AS DNAME
  FROM SAWON      

    
  2. CASE ~ END
     ���� 1 : �ϳ��� ���ǿ� ���� ���� ���Ͽ� ����� ��´�.
        CASE �ʵ�(�����)
          WHEN �񱳰�1 THEN �����1
          WHEN �񱳰�2 THEN �����2
          WHEN �񱳰�3 THEN �����3
          ELSE �⺻��
        END
        
  --CASE ~END�� �̿��ؼ� �μ��� ���
        
  SELECT 
     SABUN,
     SANAME,
     DEPTNO,
     CASE DEPTNO
       WHEN 10 THEN '�ѹ���'
       WHEN 20 THEN '������'
       WHEN 30 THEN '�����'
       WHEN 40 THEN '������'
       ELSE '�渮��'
     END AS DNAME
  FROM SAWON
 
     ����2 : ������ ���ǿ� ���� ������ ����� ��´�.
       CASE 
         WHEN ����1 THEN �����1
         WHEN ����2 THEN �����2
         ELSE �⺻��
       END

  --CASE ~END �� �̿��ؼ� ���� ����
  SELECT
    GOBUN,
    GONAME,
    GOJUMIN,
    CASE
      WHEN SUBSTR(GOJUMIN,8,1) IN ('1', '3', '5', '7', '9') THEN '����'
      WHEN SUBSTR(GOJUMIN,8,1) IN ('2', '4', '6', '8', '0') THEN '����'
    END AS GENDER
  FROM GOGEK;
  
  SELECT
    GOBUN,
    GONAME,
    GOJUMIN,
    CASE
      WHEN TO_NUMBER(SUBSTR(GOJUMIN,8,1)) IN (1,3,5,7,9) THEN '����'
      WHEN TO_NUMBER(SUBSTR(GOJUMIN,8,1)) IN (2,4,6,8,0) THEN '����'
    END AS GENDER
  FROM GOGEK;
  
  
  Q1. ������̺��� ���, �̸�, �Ի����(�Ի����)�� ����
  SELECT
    SABUN AS ���,
    SANAME AS �̸�,
    CASE FLOOR(TO_NUMBER(TO_CHAR(SAHIRE,'MM'))/3)
      WHEN 1 THEN '��'
      WHEN 2 THEN '����'
      WHEN 3 THEN '����'
      ELSE '�ܿ�'
    END AS �Ի����
  FROM SAWON
  
  Q2. �����̺��� ����ȣ, ���̸�, ���� ��� ���� ����
  
  -- [����1]
  SELECT
    GOBUN,
    GONAME,
    CASE FLOOR(TO_NUMBER(SUBSTR(GOJUMIN,3,2))/3)
      WHEN 1 THEN '��'
      WHEN 2 THEN '����'
      WHEN 3 THEN '����'
      ELSE '�ܿ�'
    END AS �������
  FROM GOGEK;
  
  -- [����2]
  SELECT
    GOBUN,
    GONAME,
    GOJUMIN,
    CASE 
      WHEN SUBSTR(GOJUMIN,3,2) IN ('03','04','05') THEN '��'
      WHEN SUBSTR(GOJUMIN,3,2) IN ('06','07','08') THEN '����'
      WHEN SUBSTR(GOJUMIN,3,2) IN ('09','10','11') THEN '����'
      ELSE '�ܿ�'
    END �������
  FROM GOGEK
  
  
  3. NVL(�ʵ�, ��ü��)       : NULL�̸� ��ü�� ���� (NULL�� �ƴϸ� �״�� ���)
     NVL2(�ʵ�, ���� ,������) : NULL�� �ƴϸ� ����, NULL�̸� ������
  *NVL = NULL VALUE
  *��ü���� �ڷ��� Ÿ���� ���� Į���� �����ϰ� ������Ѵ�.
          
  SELECT 
    SABUN, SANAME, SAMGR, NVL(SAMGR, 0) AS SAMGR2, NVL2(SAMGR, 1, 0) AS SAMGR3
  FROM SAWON
  
  INSERT INTO SAWON(SABUN) VALUES(21)
  
  SELECT 
    SABUN, SANAME, NVL(SANAME,'�˼�����')
  FROM SAWON
  
  
  
  

*/