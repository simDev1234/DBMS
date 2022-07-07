/*
-- 성적 관리 테이블 
                (테이블명)
   create table sungjuk 
   (
     -- 필요한 항목(column)
     -- 변수명 자료형
        name varchar2(100),    --1 //sql은 순서를 1부터 시작
        kor  number(3),        --2
        eng  int,              --3
        mat  int               --4
   )

-- DML(Data Manipulation Language) : insert update delete select

                             --오라클에서 문자열은 무조건 ' '
   -- 추가      (테이블명)       (필드 순서대로)
   insert into sungjuk values( '일길동', 90, 80, 70 );
   
   --          (테이블명)입력할 칼럼을 직접 지정   
   insert into sungjuk(kor,eng,mat,name) values(77,88,99,'이길동');
   insert into sungjuk values('삼길동', 90, 80, 70);

   -- 수정 (테이블명)    칼럼명=값   조건절 
   update sungjuk set kor=100               --이렇게 하면 모든 kor값이 다 100으로 바뀜
   update sungjuk set kor=100 where name = '이길동';
   update sungjuk set kor=100,eng=100,mat=100 where name = '일길동'; 
   update sungjuk set kor=100,eng=100,mat=100 where name = '삼길동'; 

   -- 삭제      (테이블명) 행선택 조건절
   delete from sungjuk                         -- 이렇게 하면 모든 데이터 삭제됨
   delete from sungjuk where 1=1;              -- 항상 참이라 모두 삭제(같다는 '=', 대입도 '=')
   delete from sungjuk where name = '삼길동';    

   -- 조회
   -- 전체 조회 (*은 '모든 칼럼'을 의미)
   select * from sungjuk
   -- 부분 조회
   select
   	   name,kor      -- 기본필드
   from sungjuk
   -- 총점 조회
   select
   	   name,kor,eng,mat,
   	   (kor+eng+mat) as tot     -- as tot : 이름을 tot로 준다는 것(HEADING - 테이블의 머리부분)
   from sungjuk
   -- 평균까지 조회
   select
   	   name,kor,eng,mat,
   	   (kor+eng+mat) as tot,     -- as tot : 이름을 tot로 준다는 것(HEADING - 테이블의 머리부분)
   	   (kor+eng+mat)/3 as mean
   from sungjuk
    -- 등수까지 조회
   select
   	   name,kor,eng,mat,         -- 기본 필드
   	   (kor+eng+mat) as tot,     -- 연산 필드
   	   (kor+eng+mat)/3 as mean,  -- 연산 필드
   	   rank() over(order by (kor+eng+mat) desc) as rank -- 연산 필드
   from sungjuk
    -- 소수점 첫째자리에서 반올림
   select
   	   name,kor,eng,mat,         -- 기본 필드
   	   (kor+eng+mat) as tot,     -- 연산 필드
   	   round((kor+eng+mat)/3,.1) as mean,  -- 연산 필드
   	   rank() over(order by (kor+eng+mat) desc) as rank -- 연산 필드
   from sungjuk
   
-- DDL(Data Definition Language) : create(생성), drop(삭제), alter(수정)
    --테이블 수정(칼럼 추가)
               (테이블명)    (추가할 칼럼 정보)
   alter table sungjuk add sci int ;
   
    update sungjuk set sci = 50;   -- where이 생략되면 전체 레코드를 대상으로 생성됨
   --칼럼이 하나 추가되면, 나머지 연산도 다 수정해야하는 어려뭉 있음 (데이터 설계를 처음에 잘 해주어야 함)
   -- 등수까지 조회
   select
   	   name,kor,eng,mat,sci,         -- 기본 필드
   	   (kor+eng+mat+sci) as tot,     -- 연산 필드
   	   (kor+eng+mat+sci)/4 as mean,  -- 연산 필드
   	   rank() over(order by (kor+eng+mat+sci) desc) as rank -- 연산 필드
   from sungjuk 
   
    --테이블 수정(칼럼 수정)
                      (테이블명) (수정할 칼럼 정보)
   alter table sungjuk modify (sci int not null);   -- null 허용 안 한다.
   
    --음악 추가
   alter table sungjuk add music int;
    --음악 삭제(다른 DB구조에 영향 미치므로 하지 않는 것이 좋다)
   alter table sungjuk drop column music;  
   
    --전체 테이블 삭제 (처음부터 다시 생성해야한다... 조심해야함)
    *실제 현장에서는 작업사항을 transaction에 올려두고, 여태까지 작업을 취소하거나 업데이트 할 수 있게 한다.
    drop table sungjuk;
  
  create or replace view sawon_view_man
  AS
  select * 
  from sawon where sasex = '남자'
  
    
*/

