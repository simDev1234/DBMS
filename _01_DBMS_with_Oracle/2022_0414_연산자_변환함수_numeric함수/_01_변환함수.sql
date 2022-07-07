/*

[[변환함수]]
[ number -> 문자로 변환]

-- 콤마 예제
SELECT TO_CHAR(12345678,'999,999,999') comma FROM DUAL;
 
-- 소숫점 예제  
SELECT TO_CHAR(123.45678,'999,999,999.99') period FROM DUAL; 
 
-- $ 표시 예제
SELECT TO_CHAR(12345678,'$999,999,999') dollar  FROM DUAL;
 
-- Local 화폐 표시 예제 (한국의 경우 ￦로 자동 변환 됨)
SELECT TO_CHAR(12345678,'L999,999,999') local  FROM DUAL;
 
-- 왼쪽에 0을 삽입
SELECT TO_CHAR(123,'09999') zero FROM DUAL;  
 
-- 16진수로 변환
SELECT TO_CHAR(123,'XXXX') hexadecimal  FROM DUAL;


--------------------------------------------------------\\\

[날짜형(date) -> 문자형]

-- 년,월,일,시,분,초 예제
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') "sysdate"
FROM DUAL;
 
-- 365일 중 몇 일째인지 조회
SELECT TO_CHAR(SYSDATE, 'DDD') "Day of year" FROM DUAL;
 
-- 53주 중 몇 주차 인지 조회
SELECT TO_CHAR(SYSDATE, 'IW') "Week of year" FROM DUAL;
 
-- 해당 월의 이름 조회
SELECT TO_CHAR(SYSDATE, 'MONTH') "Name of month" FROM DUAL;


--------------------------------------------------------\\\

[문자 -> 날짜로 변환]

select to_date('2022-4-14 15:39:45', 'YYYY-MM-DD HH24:MI:SS') from dual;

--------------------------------------------------------\\\

[문자 -> 숫자로 변환]

select to_number('123') from dual
select to_number('123') + 1 from dual
*/