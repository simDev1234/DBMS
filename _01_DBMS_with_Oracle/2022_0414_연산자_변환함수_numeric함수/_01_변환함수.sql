/*

[[��ȯ�Լ�]]
[ number -> ���ڷ� ��ȯ]

-- �޸� ����
SELECT TO_CHAR(12345678,'999,999,999') comma FROM DUAL;
 
-- �Ҽ��� ����  
SELECT TO_CHAR(123.45678,'999,999,999.99') period FROM DUAL; 
 
-- $ ǥ�� ����
SELECT TO_CHAR(12345678,'$999,999,999') dollar  FROM DUAL;
 
-- Local ȭ�� ǥ�� ���� (�ѱ��� ��� �ܷ� �ڵ� ��ȯ ��)
SELECT TO_CHAR(12345678,'L999,999,999') local  FROM DUAL;
 
-- ���ʿ� 0�� ����
SELECT TO_CHAR(123,'09999') zero FROM DUAL;  
 
-- 16������ ��ȯ
SELECT TO_CHAR(123,'XXXX') hexadecimal  FROM DUAL;


--------------------------------------------------------\\\

[��¥��(date) -> ������]

-- ��,��,��,��,��,�� ����
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') "sysdate"
FROM DUAL;
 
-- 365�� �� �� ��°���� ��ȸ
SELECT TO_CHAR(SYSDATE, 'DDD') "Day of year" FROM DUAL;
 
-- 53�� �� �� ���� ���� ��ȸ
SELECT TO_CHAR(SYSDATE, 'IW') "Week of year" FROM DUAL;
 
-- �ش� ���� �̸� ��ȸ
SELECT TO_CHAR(SYSDATE, 'MONTH') "Name of month" FROM DUAL;


--------------------------------------------------------\\\

[���� -> ��¥�� ��ȯ]

select to_date('2022-4-14 15:39:45', 'YYYY-MM-DD HH24:MI:SS') from dual;

--------------------------------------------------------\\\

[���� -> ���ڷ� ��ȯ]

select to_number('123') from dual
select to_number('123') + 1 from dual
*/