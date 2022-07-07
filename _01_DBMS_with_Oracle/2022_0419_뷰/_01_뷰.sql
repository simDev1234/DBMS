/*
 
 ����ȭ�� ������ https://kingofbackend.tistory.com/11
 
 ��(View)
 https://coding-factory.tistory.com/224
  
 1. ������ ���̺� : ���̺�ó�� ��� ����
 2. ���� ��� ���� :
   [1] ���� : ������ ���/���� ���� �����ϰ� ��� ����
   [2] ���ȼ� : �߿� �����͸� �ܺη� ���������� ���� (Ư������ڿ��� VIEW�� ��ȸ�� �� �ִ� ���Ѹ� �����ϸ� ��ü �����͸� �� �� ����)
 3. ���� ���� ���� : ���ο� ������ �� �ִ� SQL���� ���� 
 4. �並 �̿��Ϸ��� ������ �ο��޾ƾ� �Ѵ�. (���� : create view)
 grant create view to ���� 
 5. ����
 CREATE OR REPLACE VIEW�̸�
 AS 
   SQL����
 

 -- ������̺��� ���� ������ ��ȸ�ϴ� �並 ����
 
 CREATE VIEW SAWON_VIEW_GENDER_MALE
 AS
   SELECT * FROM SAWON WHERE SASEX = '����';
   
 **���� �Ŀ� �����ϰ� ���� ������ CREATE OR REPLACE
 CREATE OR REPLACE VIEW SAWON_VIEW_GENDER_MALE
 AS
   SELECT * FROM SAWON WHERE SASEX = '����';
 
     
 -- ���� (��ġ ���̺�ó�� ���)
 
 SELECT * FROM SAWON_VIEW_GENDER_MALE;
 
 -- ��� ���̺��� �Ի翬��/�Ի��/�Ի����� ���ϴ� ��
 * ��ȸ SELECT���� ���� ����� �並 �����
 
 CREATE OR REPLACE VIEW SAWON_VIEW
 AS
	 SELECT 
	   SABUN, SANAME, SASEX, DEPTNO, SAJOB, SAHIRE, SAMGR, SAPAY,
	   TO_NUMBER(TO_CHAR(SAHIRE, 'YYYY')) AS HIRE_YEAR,
	   TO_NUMBER(TO_CHAR(SAHIRE, 'MM')) AS HIRE_MONTH,
	   TO_NUMBER(TO_CHAR(SAHIRE, 'DD')) AS HIRE_DAY
	 FROM SAWON;
	 
 SELECT * FROM SAWON_VIEW;
 
 
 -- �Ի翬���� �ο��� ���ϱ�
 SELECT 
   HIRE_YEAR,  
   COUNT(*) �ο���
 FROM SAWON_VIEW
 GROUP BY HIRE_YEAR
 ORDER BY HIRE_YEAR; 
 
 [[[[ DESC SAWON_VIEW ]]]] �� CMD�� �Է��ϸ� �ش� �並 ���̺�ó�� Ȯ�� ����

 -- �⺻ �� + �Ի� ����    
 **�ζ��� �並 ����ؼ� ��ȸ�� �������� ����� �� �ִ�.
 **�並 ���� �� �ٸ� �並 ���� �� ����
 
 << ���� ���� �ڵ� >>
 
 SELECT
   *,                  --- ����! ����Ŭ������ ��ó�� ��� �Ұ�. (�ٸ� MYSQL���� ��� ����)
   HIRE_MONTH / 3
 FROM SAWON_VIEW 
 
 << �ζ��� �� >>
 
 SELECT 
   SV.*,
   CASE FLOOR(HIRE_MONTH / 3)
     WHEN 1 THEN '��'
     WHEN 2 THEN '����'
     WHEN 3 THEN '����'
     ELSE '�ܿ�'
   END AS �Ի����
 FROM (SELECT * FROM SAWON_VIEW) SV         --- �� ���̺� SV��� �ӽ� �̸��� ���� *�̶�, ���� SAWON_VIEW�� ���x
        
        
 << ���� �信�� �並 �� ����� >>
 CREATE OR REPLACE VIEW SAWON_VIEW2
 AS
	 SELECT 
	   SV.*,
	   CASE FLOOR(HIRE_MONTH / 3)
	     WHEN 1 THEN '��'
	     WHEN 2 THEN '����'
	     WHEN 3 THEN '����'
	     ELSE '�ܿ�'
	   END AS HIRE_SEASON
	 FROM (SELECT * FROM SAWON_VIEW) SV      
	 
 Q1. ��� ���̺��� �Ի������ �ο���
 
 SELECT 
   HIRE_SEASON,
   COUNT(*)
 FROM SAWON_VIEW2 
 GROUP BY HIRE_SEASON
 
 << ���� ���ȼ� ���� >>
 SELECT * FROM GOGEK; -- �ֹι�ȣ�� �ΰ��� ��������. ���� 6���ڸ� ����, �������� *ó�� �ʿ�
 
 SELECT 
   GOBUN, GONAME, GOADDR,
   SUBSTR(GOJUMIN, 1, 7) || '*******' AS GOJUMIN,
   ( 
     TO_NUMBER(SUBSTR(GOJUMIN,1,2)) +
     CASE
       WHEN TO_NUMBER(SUBSTR(GOJUMIN,8,1)) IN (1,2,5,6) THEN 1900
       WHEN TO_NUMBER(SUBSTR(GOJUMIN,8,1)) IN (3,4,7,8) THEN 2000
       ELSE 1800
     END 
   ) AS BIRTH_YEAR,
   GODAM
 FROM GOGEK 
 
 CREATE OR REPLACE VIEW GOGEK_VIEW
 AS
	 SELECT 
	   GOBUN, GONAME, GOADDR,
	   SUBSTR(GOJUMIN, 1, 7) || '*******' AS GOJUMIN,
	   ( 
	     TO_NUMBER(SUBSTR(GOJUMIN,1,2)) +
	     CASE
	       WHEN TO_NUMBER(SUBSTR(GOJUMIN,8,1)) IN (1,2,5,6) THEN 1900
	       WHEN TO_NUMBER(SUBSTR(GOJUMIN,8,1)) IN (3,4,7,8) THEN 2000
	       ELSE 1800
	     END 
	   ) AS BIRTH_YEAR,
	   GODAM
	 FROM GOGEK
     ORDER BY GOBUN
     
  SELECT * FROM GOGEK_VIEW;
  
  >> DBO �� �ְ� ������, DBA�� ��� ���� ������(���� ��� �������) OR �ǻ���ڰ� �� �� ���� 
  >> Ư�� DBA���� CONNECT���Ѹ� �ο��ϰ� VIEW ���̺� �� �� �ְ� ���� �ο� �ϸ� ���ѵ� �������� �����ϴ�.
  
  [[ DBO�� ���ο� DBA���� ������ �ο� -- ���ȼ��� Ȯ�� ]]
  
  << SYSTEM �������� TEST7 ������ ���� (������ CONNECT��) >>
  -- ���� CONNECTION NAME�� ORACLE_SYSTEM���� �����ϰ� �۾�
  
  CREATE USER TEST7 IDENTIFIED BY TEST7
  GRANT CONNECT TO TEST7
  
  << GOGEK_VIEW�� ��ȸ(SELECT)������ TEST7���� �ش� --- ������ TEST1 >>
  * �ش� ��ü(ENTITY, ���̺� �Ǵ� ��)�� ���� ������ ������(DBO)�� �ο��Ѵ�.
  -- ���� CONNECTION NAME�� ORACLE_TEST1���� �����ϰ� �۾�
  
  GRANT SELECT ON GOGEK_VIEW TO TEST7
  
  << TEST7 �������� �� �� �ִ� ���� GOGEK_VIEW�� SELECT�ϴ� �� ���̴�. >>
  SELECT * FROM GOGEK_VIEW   -- ����! ������ ������ �� �� ���� ���� (�ڱ� �ڽſ��� ����)
                             -- -- ���� CONNECTION NAME�� ORACLE_SYSTEM���� �����ϰ� �۾�
  SELECT * FROM TEST1.GOGEK_VIEW; 
  
  -- >> ��ü �������� �Ϻθ� ����   
  
                                                                                                    
  -- gogek_view�� �̿��ؼ� �߰� �ʵ�(Į��) �־��   
  1. �⺻ Į���� �״�� �ְ� �߰� (����/��)
  2. ���̸� : gogek_view2
  
  -- ���̿� �� ���ϱ�
  -- ���� : ���� ���� - ������� + 1
  -- �� : 
  
  CREATE OR REPLACE VIEW GOGEK_VIEW2
  AS
	  SELECT 
	    GV.*,
	    TO_NUMBER(TO_CHAR(SYSDATE,'YYYY')) - BIRTH_YEAR + 1 AS AGE,
	    CASE MOD(BIRTH_YEAR, 12)
	        WHEN 0 THEN '������'
	        when  1   then '��'
		    when  2   then '��'
		    when  3   then '����'
		    when  4   then '��'
		    when  5   then '��'
		    when  6   then 'ȣ����'
		    when  7   then '�䳢'
		    when  8   then '��'
		    when  9   then '��'
		    when  10  then '��'
		    else '��'
	    END || '��' as ��,
	    
	    (
	    CASE MOD(BIRTH_YEAR, 10)
	        when  0   then '��'
		    when  1   then '��'
		    when  2   then '��'
		    when  3   then '��'
	        WHEN  4   THEN '��'
	        when  5   then '��'
		    when  6   then '��'
		    when  7   then '��'
		    when  8   then '��'
		    when  9   then '��' 
	    END
	    ||
	    CASE MOD(BIRTH_YEAR, 12)
	        WHEN  0   THEN '��'
	        when  1   then '��'
		    when  2   then '��'
		    when  3   then '��'
		    when  4   then '��'
		    when  5   then '��'
		    when  6   then '��'
		    when  7   then '��'
		    when  8   then '��'
		    when  9   then '��'
		    when  10  then '��'
		    when  11  then '��'
	    END
	    )as ����
	  FROM (SELECT * FROM GOGEK_VIEW) GV

  
                                                                                                                                                                                                                                                                                                                                                                                                      
  
 
 */