-- SYSDTE ����
SELECT TO_CHAR(SYSDATE,'RRRR-MM-DD HH24:MI:SS') "���ݽð�"
  FROM DUAL ;
 
SELECT TO_CHAR(SYSDATE-1,'RRRR-MM-DD HH24:MI:SS') "�Ϸ������ݽð�"
  FROM DUAL ;
 
SELECT TO_CHAR(SYSDATE-1/24,'RRRR-MM-DD HH24:MI:SS') "1�ð����ð�"
  FROM DUAL ;
 
SELECT TO_CHAR(SYSDATE-1/24/60,'RRRR-MM-DD HH24:MI:SS') "1�����ð�"
  FROM DUAL ;
 
SELECT TO_CHAR(SYSDATE-1/24/60/10,'RRRR-MM-DD HH24:MI:SS') "6�����ð�"
  FROM DUAL ;
 
SELECT TO_CHAR(SYSDATE-(5/24 + 30/24/60 + 10/24/60/60),'RRRR-MM-DD HH24:MI:SS') "5�ð� 30�� 10����"
  FROM DUAL ;
  
-- SYSTIMESTAMP
-- SYSTIMESTAMP �Լ��� ����ϸ� ���� ���ڿ� �ð�(�ý��۱���)�� ���� �� �ִ�.
-- SYSTIMESTAMP ����
SELECT TO_CHAR(SYSTIMESTAMP,'RRRR-MM-DD HH24:MI:SS.FF3')  
  FROM DUAL ;
 
SELECT TO_CHAR(SYSTIMESTAMP,'RRRR-MM-DD HH24:MI:SS.FF9')  
  FROM DUAL ;
 
SELECT TO_CHAR(SYSTIMESTAMP -1/24,'RRRR-MM-DD HH24:MI:SS') "1�ð����ð�"
  FROM DUAL ;
 
SELECT TO_CHAR(SYSTIMESTAMP -1/24/60,'RRRR-MM-DD HH24:MI:SS') "1�����ð�"
  FROM DUAL ;
  
  
-- ADD_MONTHS(a, b) 
-- ADD_MONTHS �Լ��� a�� ��¥�� b�� ���� ���� ���� ��ȯ �Ѵ�.
-- SYSDATE�� �̿��� ����
                               --������
SELECT TO_CHAR(ADD_MONTHS(SYSDATE,3),'RRRR-MM-DD')  "date"
  FROM DUAL; 
 
-- TIMESTAMP�� �̿��� ����
SELECT TO_CHAR(ADD_MONTHS(SYSTIMESTAMP,3),'RRRR-MM-DD')  "date"
  FROM DUAL;  
  

-- MONTHS_BETWEEN(a1, a2)
-- MONTHS_BETWEEN�� a1�� a2 ������ ���� ���� NUMBER�� Ÿ������ ��ȯ �Ѵ�.
                                   --- �ϼ��� ���� ���� �Ǵ� �Ǽ��� ���� �� ����
-- �� ���� ���̿� ���� ���� ��ȸ�ϴ� ����
SELECT MONTHS_BETWEEN(TO_DATE('2010-06-05','RRRR-MM-DD'), 
                      TO_DATE('2010-05-01','RRRR-MM-DD'))  "month"  
  FROM DUAL;
 
-- �� ���� ���̿� ��¥ ���� ��ȸ�ϴ� ����
-- ��¥�� �����Ͱ� ��Ģ������ ������ �� �ƴ�, ��¥ - ��¥ �ؼ� ���� �� ���ϴ� ��
SELECT TO_DATE('2010-06-05','RRRR-MM-DD') - 
       TO_DATE('2010-05-01','RRRR-MM-DD')  "Day"  
  FROM DUAL;  
  
--Q1. ���� ��ƿ� �� �� or �� ��
SELECT MONTHS_BETWEEN(TO_DATE(SYSDATE, 'RRRR-MM-DD'),
                      TO_DATE('1993-07-05', 'RRRR-MM-DD')) AS "���� ��ƿ� �� ��"
  FROM DUAL;
  
SELECT TRUNC(MONTHS_BETWEEN(TO_DATE(SYSDATE, 'RRRR-MM-DD'),
                      TO_DATE('1993-07-05', 'RRRR-MM-DD')),1) AS "���� ��ƿ� �� ��"
  FROM DUAL;

SELECT TO_DATE(SYSDATE, 'RRRR-MM-DD') -
       TO_DATE('1993-07-05', 'RRRR-MM-DD') as "���� ��ƿ� �� ��"
  FROM DUAL;
  
-- LAST_DAY(d)
-- LAST_DAY �Լ��� ���� ������ ���� ��¥�� ��ȯ �Ѵ�
-- LAST_DAY����
SELECT SYSDATE today, LAST_DAY(SYSDATE) lastday 
  FROM DUAL;
  
--NEXT_DAY(d, c1)
--NEXT_DAY�� ���ƿ��� ��õ� ������ ���ڸ� ��ȯ�Ѵ�.
--������ 1(��) ~ 7(��)�� �Է��ϸ� �ȴ�.
-- NEXT_DAY����
SELECT NEXT_DAY(SYSDATE, 4) "Next Wednesday"
  FROM DUAL;
 
-- NEXT_DAY����
SELECT NEXT_DAY(TO_DATE('20110501','RRRRMMDD'), 2) "5�� ù°�� ������"
  FROM DUAL;
  
-- ROUND ����
-- ROUND���� * ���� : YEAR, MONTH, DD
SELECT ROUND(TO_DATE('2011-09-11 21:00:01','RRRR-MM-DD HH24:MI:SS'), 'YEAR') 
  FROM DUAL;
  
SELECT ROUND(TO_DATE('2011-09-11 21:00:01','RRRR-MM-DD HH24:MI:SS'), 'MONTH') 
  FROM DUAL;
  
SELECT ROUND(TO_DATE('2011-09-11 21:00:01','RRRR-MM-DD HH24:MI:SS'), 'DD') 
  FROM DUAL;

--> ���� ���� ��, ����Ʈ 'DD'
SELECT ROUND(TO_DATE('2011-09-11 21:00:01','RRRR-MM-DD HH24:MI:SS')) 
  FROM DUAL;
  
SELECT TO_CHAR(ROUND(TO_DATE('2011-09-11 21:00:01',
                             'RRRR-MM-DD HH24:MI:SS'), 'YEAR'),
               'RRRR-MM-DD HH24:MI:SS')  
  FROM DUAL;
 
SELECT TO_CHAR(ROUND(TO_DATE('2011-09-11 21:00:01',
                             'RRRR-MM-DD HH24:MI:SS'), 'MONTH'),
               'RRRR-MM-DD HH24:MI:SS')  
  FROM DUAL;
 
SELECT TO_CHAR(ROUND(TO_DATE('2011-09-11 21:00:01',
                             'RRRR-MM-DD HH24:MI:SS'), 'DD'),
               'RRRR-MM-DD HH24:MI:SS')  
  FROM DUAL;
 
SELECT TO_CHAR(ROUND(TO_DATE('2011-09-11 21:00:01',
                             'RRRR-MM-DD HH24:MI:SS')), 
               'RRRR-MM-DD HH24:MI:SS')   
  FROM DUAL;

                      