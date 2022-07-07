-- 문자형 함수
-- http://www.gurubee.net/lecture/1025

-- concat
SELECT CONCAT('www.', 'oracleclub')||'.com' name FROM DUAL;

-- 이클립스 대문자 변환 : ctrl + shfit + x

-- INITCAP, LOWER, UPPER 예제
SELECT INITCAP('oracleclub') name FROM DUAL
SELECT UPPER('oracleclub') name FROM DUAL
SELECT LOWER('oracleclub') name FROM DUAL;

-- LPAD, RPAD 예제
SELECT LPAD('oracleclub', 12, '*') name FROM DUAL;
SELECT RPAD('oracleclub', 12, '*') name FROM DUAL;


-- SUBSTR(char, m ,[n]), SUBSTRB(char, m ,[n])
-- 세번째부터 문자열 반환.
--             123456789 
SELECT SUBSTR('oracleclub', 3) name FROM DUAL;
 
-- 세번째부터 네개의 문자열 반환.
SELECT SUBSTR('oracleclub', 3, 4) name FROM DUAL;
 
-- 뒤에서 세번째부터 두개의 문자열 반환.
SELECT SUBSTR('oracleclub', -3, 2) name FROM DUAL;

 
-- DB가 UTF-8인 경우 아래 SQL의 결과는?.
-- SUBSTRB 함수에서 B는 Byte단위로 처리하겠다는 의미
---             147  *오라클에서 한글 3byte 3byte씩
SELECT SUBSTRB('오라클클럽',1) name FROM DUAL
SELECT SUBSTRB('오라클클럽',3) name FROM DUAL;

-- Length
-- 문자열의 LENGTH를 조회하는 예제.
SELECT LENGTH('오라클클럽') len FROM DUAL
-- 전체 바이트 수 
SELECT LENGTHB('오라클클럽') len FROM DUAL;

-- replace
-- 간단한 REPLACE 예이다.
SELECT REPLACE('oracleclub','oracle','db') name FROM DUAL;

-- 대소문자를 구분한다는 것을 알수 있다.
SELECT REPLACE('OracleClub','oracle','DB') name  FROM DUAL
 UNION ALL  -- 실행 시 행에 대한 결합(두 줄 한 번에 출력)
SELECT REPLACE('OracleClub','Oracle','DB') name  FROM DUAL;

-- * union (레코드(행) 결합) : 동일한 레코드는 1회만 추출
select * from dept
UNION  -- 중복된 데이터는 제외하고 모두 실행
select * from dept where deptno < 30;


-- instr
-- 지정한 문자 OK가 발견되지 않아 0을 반환.
SELECT INSTR('CORPORATE FLOOR','OK') idx FROM DUAL;
 
-- OR이 있는 위치 2를 반환. 왼쪽부터 비교를 한다는 것을 알 수 있다.
SELECT INSTR('CORPORATE FLOOR','OR') idx FROM DUAL;
 
-- 왼쪽에서 세 번째부터 시작을 해서 검색된 OR의 위치를 반환 한다.
SELECT INSTR('CORPORATE FLOOR','OR', 3) idx FROM DUAL;
 
-- 왼쪽에서 세 번째부터 시작을 해서 비교를 하여 OR이 두 번째 검색되는 지점의 위치를 반환 한다.
                                ---  3번째부터 해서 or이 두개 있는데 두번째 or
SELECT INSTR('CORPORATE FLOOR','OR', 3, 2) idx FROM DUAL;


-- TRIM : 특정한 문자를 제거 한다. 제거할 문자를 입력하지 않으면 기본적으로 공백이 제거 된다.
-- LTRIM : 왼쪽부터 문자를 제거 한다. 제거할 문자를 입력하지 않으면 기본적으로 왼쪽 공백이 제거 된다.
-- RTRIM : 오른쪽부터 문자를 제거 한다. 제거할 문자를 입력하지 않으면 기본적으로 오른쪽 공백이 제거 된다.

-- o와 공백을 제거 하는 TRIM 예제이다.
SELECT TRIM('o' FROM 'oracleclub') name FROM DUAL
UNION ALL
SELECT TRIM(' oracleclub ') name FROM DUAL;
 
 
-- 왼쪽의 문자열을 TRIM하는 예제이다. 
-- 공백의 경우 왼쪽 공백만 제거 되는 것을 확인 할 수 있다.
SELECT LTRIM('oracleclub','oracle') name FROM DUAL
UNION ALL
SELECT REPLACE(LTRIM(' oracleclub '),' ','*') name FROM DUAL;
 
 
-- 오른쪽의 문자열을 TRIM 하는 예제이다. 
-- 공백의 경우 오른쪽 공백만 제거 되는 것을 확인 할 수 있다.
SELECT RTRIM('oracleclub','club') name FROM DUAL
UNION ALL
SELECT REPLACE(RTRIM(' oracleclub '),' ','*') name FROM DUAL;
