/*

1. 문자형 : byte단위 크기
   char(크기)     :  고정 길이 
   varchar2(크기) :  가변 길이 
   -- 가변길이란?
      ex. memo char(2000)     -> 'a' -> 총 할당 크기 : 2000byte
          memo varchar2(2000) -> 'a' -> 총 할당 크기 : 1byte

2. 숫자형 : 길이(자릿수) <- 가변형
   number(길이)
   number(p,s) -- p : precision(전체 길이), s : scale(소수점 이하)
   int   ==  number(38)과 동일 자료형  *숫자가 38개이다. n^38(자바의 float와 같은 범위)
   ※ 항상 길이는 넉넉하게 주는 것이 좋다.
   
3. 날짜형 :  
   date(자료형)
   sysdate : 현재 시스템 날짜/시간을 구해주는 함수  
   select sysdate from dual  -- dual(임시테이블)
   
4. LOB(Large Object) : 최대 4GB
   *실제 대이터 테이블은 참조형 식으로 별도로 저장된다.
   BLOB(Binary Large Object) : 동영상/사운드/이미지...
   CLOB(Char Large Object)   : 문자의 대용량
   
5. raw (소량의 binary)
   LONG(한 레코드에 한 개만 저장할 수 있음)
   
*/