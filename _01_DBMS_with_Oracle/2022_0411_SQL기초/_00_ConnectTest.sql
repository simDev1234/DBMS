/*
  ���� �ּ�
*/

-- xxx.sqlȭ�� ������ 1�� �ּ��� : --
-- ���� �ּ��� : /* */

-- hr�������� �����
-- ��� ���� ��ȸ
select * from EMPLOYEES
-- �������� �����ݷ��� ���û���/ ���� �巡���Ͽ� Alt+x�ϸ� �����

-- �μ� ���� ��ȸ
select * from DEPARTMENTS;

-- AWS ���� 
select * from TEST:

--scott ����
/*
�ּ� ó���� ���·ε� ���� ����
select * from emp;
*/

/*
-- dept ���̺�� emp ���̺��� �����ϴ� ����
SELECT e.empno, e.ename, d.dname
  FROM dept d, empe
WHERE d.deptno = e.deptno;

--����Ŭ ������ �ȵǸ� -> �˻� -> ����
  1. OracleServiceXE
  2. OracleXETNSListener
  ����Ȯ�� 
  3. ojdbc14.jar�� ����ġ�� �ִ��� Ȯ��
  
-- ����Ŭ ���� �ȵɶ� CMDâ���� Ȯ�� �ϴ� ��
-- cmdâ���� �����Ͱ� �۵��ϴ��� Ȯ���ϰ�, ���۵��� start�� �۵�
   c:\>lsnrctl
   LSNRCTL>status    -- ������ ���� Ȯ��
   LSNRCTL>start     -- ������ ����
   LSNRCTL>stop      -- ������ ����
     
SELECT * FROM dept;

select * from sawon

select * from gogek_view2

SELECT 
  v2.*,
  TO_NUMBER(SUBSTR(GOJUMIN,3,2)) as birth_month,
  TO_NUMBER(SUBSTR(GOJUMIN,5,2)) as birth_day
FROM gogek_view v2 

SELECT
  TO_NUMBER(SUBSTR(GOJUMIN,3,2)) as birth_month,
  TO_NUMBER(SUBSTR(GOJUMIN,5,2)) as birth_day
FROM sawon s LEFT OUTER JOIN gogek_view2 v2 ON s.sabun = v2.godam 



    
*/

/*
  create user test1 identified by test1
  
*/
