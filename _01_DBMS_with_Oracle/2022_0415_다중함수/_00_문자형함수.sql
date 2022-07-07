-- ������ �Լ�
-- http://www.gurubee.net/lecture/1025

-- concat
SELECT CONCAT('www.', 'oracleclub')||'.com' name FROM DUAL;

-- ��Ŭ���� �빮�� ��ȯ : ctrl + shfit + x

-- INITCAP, LOWER, UPPER ����
SELECT INITCAP('oracleclub') name FROM DUAL
SELECT UPPER('oracleclub') name FROM DUAL
SELECT LOWER('oracleclub') name FROM DUAL;

-- LPAD, RPAD ����
SELECT LPAD('oracleclub', 12, '*') name FROM DUAL;
SELECT RPAD('oracleclub', 12, '*') name FROM DUAL;


-- SUBSTR(char, m ,[n]), SUBSTRB(char, m ,[n])
-- ����°���� ���ڿ� ��ȯ.
--             123456789 
SELECT SUBSTR('oracleclub', 3) name FROM DUAL;
 
-- ����°���� �װ��� ���ڿ� ��ȯ.
SELECT SUBSTR('oracleclub', 3, 4) name FROM DUAL;
 
-- �ڿ��� ����°���� �ΰ��� ���ڿ� ��ȯ.
SELECT SUBSTR('oracleclub', -3, 2) name FROM DUAL;

 
-- DB�� UTF-8�� ��� �Ʒ� SQL�� �����?.
-- SUBSTRB �Լ����� B�� Byte������ ó���ϰڴٴ� �ǹ�
---             147  *����Ŭ���� �ѱ� 3byte 3byte��
SELECT SUBSTRB('����ŬŬ��',1) name FROM DUAL
SELECT SUBSTRB('����ŬŬ��',3) name FROM DUAL;

-- Length
-- ���ڿ��� LENGTH�� ��ȸ�ϴ� ����.
SELECT LENGTH('����ŬŬ��') len FROM DUAL
-- ��ü ����Ʈ �� 
SELECT LENGTHB('����ŬŬ��') len FROM DUAL;

-- replace
-- ������ REPLACE ���̴�.
SELECT REPLACE('oracleclub','oracle','db') name FROM DUAL;

-- ��ҹ��ڸ� �����Ѵٴ� ���� �˼� �ִ�.
SELECT REPLACE('OracleClub','oracle','DB') name  FROM DUAL
 UNION ALL  -- ���� �� �࿡ ���� ����(�� �� �� ���� ���)
SELECT REPLACE('OracleClub','Oracle','DB') name  FROM DUAL;

-- * union (���ڵ�(��) ����) : ������ ���ڵ�� 1ȸ�� ����
select * from dept
UNION  -- �ߺ��� �����ʹ� �����ϰ� ��� ����
select * from dept where deptno < 30;


-- instr
-- ������ ���� OK�� �߰ߵ��� �ʾ� 0�� ��ȯ.
SELECT INSTR('CORPORATE FLOOR','OK') idx FROM DUAL;
 
-- OR�� �ִ� ��ġ 2�� ��ȯ. ���ʺ��� �񱳸� �Ѵٴ� ���� �� �� �ִ�.
SELECT INSTR('CORPORATE FLOOR','OR') idx FROM DUAL;
 
-- ���ʿ��� �� ��°���� ������ �ؼ� �˻��� OR�� ��ġ�� ��ȯ �Ѵ�.
SELECT INSTR('CORPORATE FLOOR','OR', 3) idx FROM DUAL;
 
-- ���ʿ��� �� ��°���� ������ �ؼ� �񱳸� �Ͽ� OR�� �� ��° �˻��Ǵ� ������ ��ġ�� ��ȯ �Ѵ�.
                                ---  3��°���� �ؼ� or�� �ΰ� �ִµ� �ι�° or
SELECT INSTR('CORPORATE FLOOR','OR', 3, 2) idx FROM DUAL;


-- TRIM : Ư���� ���ڸ� ���� �Ѵ�. ������ ���ڸ� �Է����� ������ �⺻������ ������ ���� �ȴ�.
-- LTRIM : ���ʺ��� ���ڸ� ���� �Ѵ�. ������ ���ڸ� �Է����� ������ �⺻������ ���� ������ ���� �ȴ�.
-- RTRIM : �����ʺ��� ���ڸ� ���� �Ѵ�. ������ ���ڸ� �Է����� ������ �⺻������ ������ ������ ���� �ȴ�.

-- o�� ������ ���� �ϴ� TRIM �����̴�.
SELECT TRIM('o' FROM 'oracleclub') name FROM DUAL
UNION ALL
SELECT TRIM(' oracleclub ') name FROM DUAL;
 
 
-- ������ ���ڿ��� TRIM�ϴ� �����̴�. 
-- ������ ��� ���� ���鸸 ���� �Ǵ� ���� Ȯ�� �� �� �ִ�.
SELECT LTRIM('oracleclub','oracle') name FROM DUAL
UNION ALL
SELECT REPLACE(LTRIM(' oracleclub '),' ','*') name FROM DUAL;
 
 
-- �������� ���ڿ��� TRIM �ϴ� �����̴�. 
-- ������ ��� ������ ���鸸 ���� �Ǵ� ���� Ȯ�� �� �� �ִ�.
SELECT RTRIM('oracleclub','club') name FROM DUAL
UNION ALL
SELECT REPLACE(RTRIM(' oracleclub '),' ','*') name FROM DUAL;
