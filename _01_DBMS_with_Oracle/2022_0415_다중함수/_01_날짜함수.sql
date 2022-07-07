-- SYSDTE 예제
SELECT TO_CHAR(SYSDATE,'RRRR-MM-DD HH24:MI:SS') "지금시간"
  FROM DUAL ;
 
SELECT TO_CHAR(SYSDATE-1,'RRRR-MM-DD HH24:MI:SS') "하루전지금시간"
  FROM DUAL ;
 
SELECT TO_CHAR(SYSDATE-1/24,'RRRR-MM-DD HH24:MI:SS') "1시간전시간"
  FROM DUAL ;
 
SELECT TO_CHAR(SYSDATE-1/24/60,'RRRR-MM-DD HH24:MI:SS') "1분전시간"
  FROM DUAL ;
 
SELECT TO_CHAR(SYSDATE-1/24/60/10,'RRRR-MM-DD HH24:MI:SS') "6초전시간"
  FROM DUAL ;
 
SELECT TO_CHAR(SYSDATE-(5/24 + 30/24/60 + 10/24/60/60),'RRRR-MM-DD HH24:MI:SS') "5시간 30분 10초전"
  FROM DUAL ;
  
-- SYSTIMESTAMP
-- SYSTIMESTAMP 함수를 사용하면 현재 일자와 시간(시스템기준)을 얻을 수 있다.
-- SYSTIMESTAMP 예제
SELECT TO_CHAR(SYSTIMESTAMP,'RRRR-MM-DD HH24:MI:SS.FF3')  
  FROM DUAL ;
 
SELECT TO_CHAR(SYSTIMESTAMP,'RRRR-MM-DD HH24:MI:SS.FF9')  
  FROM DUAL ;
 
SELECT TO_CHAR(SYSTIMESTAMP -1/24,'RRRR-MM-DD HH24:MI:SS') "1시간전시간"
  FROM DUAL ;
 
SELECT TO_CHAR(SYSTIMESTAMP -1/24/60,'RRRR-MM-DD HH24:MI:SS') "1분전시간"
  FROM DUAL ;
  
  
-- ADD_MONTHS(a, b) 
-- ADD_MONTHS 함수는 a의 날짜에 b의 달을 더한 값을 반환 한다.
-- SYSDATE를 이용한 예제
                               --개월수
SELECT TO_CHAR(ADD_MONTHS(SYSDATE,3),'RRRR-MM-DD')  "date"
  FROM DUAL; 
 
-- TIMESTAMP를 이용한 예제
SELECT TO_CHAR(ADD_MONTHS(SYSTIMESTAMP,3),'RRRR-MM-DD')  "date"
  FROM DUAL;  
  

-- MONTHS_BETWEEN(a1, a2)
-- MONTHS_BETWEEN은 a1과 a2 사이의 달의 수를 NUMBER형 타입으로 반환 한다.
                                   --- 일수의 차는 정수 또는 실수로 나올 수 있음
-- 두 일자 사이에 달의 수를 조회하는 예제
SELECT MONTHS_BETWEEN(TO_DATE('2010-06-05','RRRR-MM-DD'), 
                      TO_DATE('2010-05-01','RRRR-MM-DD'))  "month"  
  FROM DUAL;
 
-- 두 일자 사이에 일짜 수를 조회하는 예제
-- 날짜형 데이터가 사칙연산이 가능한 것 아닌, 날짜 - 날짜 해서 일자 술 구하는 것
SELECT TO_DATE('2010-06-05','RRRR-MM-DD') - 
       TO_DATE('2010-05-01','RRRR-MM-DD')  "Day"  
  FROM DUAL;  
  
--Q1. 내가 살아온 월 수 or 일 수
SELECT MONTHS_BETWEEN(TO_DATE(SYSDATE, 'RRRR-MM-DD'),
                      TO_DATE('1993-07-05', 'RRRR-MM-DD')) AS "내가 살아온 월 수"
  FROM DUAL;
  
SELECT TRUNC(MONTHS_BETWEEN(TO_DATE(SYSDATE, 'RRRR-MM-DD'),
                      TO_DATE('1993-07-05', 'RRRR-MM-DD')),1) AS "내가 살아온 월 수"
  FROM DUAL;

SELECT TO_DATE(SYSDATE, 'RRRR-MM-DD') -
       TO_DATE('1993-07-05', 'RRRR-MM-DD') as "내가 살아온 날 수"
  FROM DUAL;
  
-- LAST_DAY(d)
-- LAST_DAY 함수는 달의 마지막 날의 날짜를 반환 한다
-- LAST_DAY예제
SELECT SYSDATE today, LAST_DAY(SYSDATE) lastday 
  FROM DUAL;
  
--NEXT_DAY(d, c1)
--NEXT_DAY는 돌아오는 명시된 요일의 일자를 반환한다.
--요일은 1(일) ~ 7(토)로 입력하면 된다.
-- NEXT_DAY예제
SELECT NEXT_DAY(SYSDATE, 4) "Next Wednesday"
  FROM DUAL;
 
-- NEXT_DAY예제
SELECT NEXT_DAY(TO_DATE('20110501','RRRRMMDD'), 2) "5월 첫째주 월요일"
  FROM DUAL;
  
-- ROUND 예제
-- ROUND예제 * 기준 : YEAR, MONTH, DD
SELECT ROUND(TO_DATE('2011-09-11 21:00:01','RRRR-MM-DD HH24:MI:SS'), 'YEAR') 
  FROM DUAL;
  
SELECT ROUND(TO_DATE('2011-09-11 21:00:01','RRRR-MM-DD HH24:MI:SS'), 'MONTH') 
  FROM DUAL;
  
SELECT ROUND(TO_DATE('2011-09-11 21:00:01','RRRR-MM-DD HH24:MI:SS'), 'DD') 
  FROM DUAL;

--> 기준 생략 시, 디폴트 'DD'
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

                      