/*
제약조건(Constraint)
1. 데이터 무결성(Data Integrity)를 유지하기 위한 성질
2. 종류 
   1) not null (null 허용 안함) or null(허용)
   2) unique  : 도메인 내에 중복값 허용 안 함
   3) check   : 조건에 맞는 값만 허용
   4) default : 기본값
   5) primary key : 기본키
      : not null + unique + index설정
   6) foreign key : 외래키
      : 현재 입력(수정) 값의 유효성을 외부 데이블 부모키(컬럼)을 참조해서 체크
*/

-- [not null] 제약조건 : inline방식으로만 할 수 있다.
create table tb1
(
--  변수         자료형          제약조건
   name     varchar2(100)   not null,  --not null : null허용하지 않음 *인라인 방식(라인 안에 소속)
   nickname varchar2(100)   null       --null허용 *생략시> 기본값:null
)

insert into tb1 values('홍길동','하나');  --OK
insert into tb1(name) values ('이길동'); --OK
insert into tb1(nickname) values('삼식이'); --에러! : not null 제약 위배
insert into tb1 values('다나가',null);

select * from tb1

-- [unique] : 도메인 내 중복값 허용 안 함
create table tb2
(
   id  varchar2(100) not null unique, --중복 제약조건(not null + unique)
   pwd varchar2(100) not null
)

insert into tb2 values('one','1234'); -- OK
insert into tb2 values('two','5678'); -- OK
insert into tb2 values('one','4567')  -- 에러! : unique 위배      *Unique위배 알려주는 코드 
                                      -- ORA-00001: 무결성 제약 조건(TEST1.SYS_C004061)에 위배됩니다

-- <제약 조건명 지정> *에러메세지에서 확인 가능
-- (1) 테이블 생성 후 alter로 수정 : 제약조건명을 사용자가 지정
create table tb22
(
   id  varchar2(100) not null, --중복 제약조건(not null + unique)
   pwd varchar2(100) not null
)

--사용자 정의로 제약조건을 지정 : 사용자지정명칭 제약조건명(도메인변수) 
--*사용자 지정 명칭은 식별자 명명 규칙에 따른다.--
alter table tb22 
   add constraint unique_tb22_id  unique(id);
  
insert into tb22 values('one','1234'); -- OK
insert into tb22 values('one','2234'); -- 에러! 
                                       -- ORA-01735: 부적합한 ALTER TABLE 옵션입니다

select * from tb22

--(2) inline + 제약 이름 부여
create table tb222
(
  id  varchar2(100) not null,
  pwd varchar2(100) not null,
  
  constraint unique_tb222_id unique(id)
)

insert into tb222 values('one','1234'); -- OK
insert into tb222 values('one','2234'); -- 에러! 
                                        -- ORA-00001: 무결성 제약 조건(TEST1.UNIQUE_TB222_ID)에 위배됩니다

--[check] : 조건에 맞는 값만 허용
--연산자 
-----산술 연산자     : */ mod(피젯수,젯수)
-----관계 연산자     : > >= < <= =(같음?) !=(같지 않음?) <>(같지 않음?)  #결과값 boolean
-----일반 논리 연산자 : and or not                                  #결과값 boolean
-----기타          : 필드 또는 변수 between A and B (A~B사이냐?)
                --  필드 in(A,B,C)              (필드=A or 필드=B or 필드=C) 

create table tb3
(
   name varchar2(100) not null,
-- (1) inline 제약 설정
   kor  int  check(kor >= 0 and kor <=100),  
   eng  int,
   mat  int,
-- (2) 테이블 하단에 제약 설정
   constraint check_tb3_eng check(eng between 0 and 100)
)

-- (3) [가장 보편적인 방식] 별도로 테이블 수정하여 제약 설정
alter table tb3
  add constraint check_tb3_mat check(mat between 0 and 100)

insert into tb3 values('일길동',88,99,100);  
  
-- 오류 코드
-- insert할 때나, update할 때 제약조건 확인
insert into tb3 values('이길동',-1,99,99);  -- ORA-02290: 체크 제약조건(TEST1.SYS_C004073)이 위배되었습니다
insert into tb3 values('이길동',88,101,99); -- ORA-02290: 체크 제약조건(TEST1.CHECK_TB3_ENG)이 위배되었습니다
insert into tb3 values('삼길동',88,10,999); -- ORA-02290: 체크 제약조건(TEST1.CHECK_TB3_ENG)이 위배되었습니다

-- 제약조건 확인방법(무결성 제약조건에 관한 정보는 Dictionary에 저장됨)
-- : user_constraints에 저장
---** CMD에서 전체 constaints구조 확인 >> desc user_constraints
select * from user_constraints where 1 = 2;  --data 제외하고 heading만 확인
select constraint_type,constraint_name,table_name from user_constraints
--dictionary안에 있는 정보는 모두 대문자이므로, 특정 제약 검색 시 대문자로 검색해야한다.
select constraint_type,constraint_name,table_name from user_constraints
  where table_name='TB3';
--소문자 -> 대문자 변환 함수 : upper()
select constraint_type,constraint_name,table_name from user_constraints
  where table_name=upper('tb3');


create table tb33
(
   name   varchar2(100) not null,
   gender varchar2(100) not null
)

--#조건 : 성별은 '남자' 또는 '여자' 폼으로만 입력되게 제약조건 설정 
--(남,여,male,female 등 허용시 일관성 유지할 수 업음)
  
alter table tb33 
  add constraint check_tb33_gender check(gender in('남자','여자'));
  
insert into tb33 values('김철수','남자');  -- OK
insert into tb33 values('김영희','여');   -- 에러!
insert into tb33 values('김영희','여자 '); -- 에러! (공백 포함)

select * from tb33;

--[default] : 입력하지 않았을 때 기본값
create table tb4
(
  name    varchar2(100)  not null,
  age     int            default 1,
  gender  varchar2(100)  default '남자',
  regdate date           default sysdate 
)

insert into tb4 values('일길동',20,'남자','2022-4-12') -- '연-월-일' 또는 '연/월/일' 04월 or 4월 모두 ok
insert into tb4 values('일길동',20,'남자',to_date('2022-4-12','yyyy-mm-dd'))
insert into tb4(name) values('이길동');
insert into tb4 values('삼길동',default,default,default)
insert into tb4 values('사길동',30,'여자',default)

select * from tb4

--[primary key] : 기본키 *레코드(행)를 대표할 수 있는 컬럼
--not null + unique + index  <-- 자동 설정됨
--      (중복제약조건)  + (인덱스):조회성능향상(검색Tree)
--HDB(트리구조),NDB(네트워크구조),RDB(관계형 테이블),OODB(객체형) *현재는 RDB
create table tb5
(
   idx  int,                     --일련번호(PK)
   name varchar2(100) not null,
   tel  varchar2(100) null
)

--기본키 설정
alter table tb5
  add constraint pk_tb5_idx primary key(idx);

select constraint_type, constraint_name, table_name from user_constraints
  where table_name=upper('tb5')

insert into tb5 values(1,'일길동','010-111-1111') -- OK
insert into tb5(name) values('이에라'); --에러! ORA-01400: NULL을 ("TEST1"."TB5"."IDX") 안에 삽입할 수 없습니다
                                      --not null에 걸림
insert into tb5 values(1,'원길동','010-222-1111') -- 에러! ORA-00001: 무결성 제약 조건(TEST1.PK_TB5_IDEX)에 위배됩니다
                                                -- unique에 걸림

--2개 이상의 컬럼을 묶어서 PK로 사용할 수 있다.
create table tb55
(
   idx     int,
   name    varchar2(100),
   regdate date
)
alter table tb5
  add constraint pk_tb55_idx_regdate primary key(idx,regdate)

insert into tb55 values(1,'일길동',sysdate) --여러번 실행해도 OK
                                          --why? idx와 regdate 조합이 모두 다르면 다른 것으로 인식
                                          --회사에서 단원-차시를 나눴을 때 1단원,1차시/1단원,2차시로 나눴던 것과 비슷한 것 같다

--시퀀스를 이용한 idx 처리
create table tb555
(
   idx     int,
   regdate date default sysdate
)

alter table tb555
  add constraint pk_tb555_idx primary key(idx);
                   (시퀀스명)

----------------------------------------
--sequence : 일련번호 관리객체 *테이블과 별개의 객체/시퀀스는 수정불가(시퀀스 내의 MAX값 수정 등은 가능)   
--*시퀀스는 오라클에만 있다.                
--1) 생성
create sequence seq_tb555_idx

--2) 사용
select seq_tb555_idx.nextVal from dual
select seq_tb555_idx.nextVal , seq_tb555_idx.currVal from dual

--3) 삭제
drop sequence seq_tb555_idx
---------------------------------------------------------
--////시퀀스를 이용해서 idx값을 넣기
create sequence seq_tb555_idx
insert into tb555 values(seq_tb555_idx.nextVal, sysdate)
select * from tb555;


--[foreign key] : 외래키 <- 참조하는 [부모] 키 값을 참조해서 insert/update 내용 결정
create table student
(
   학번     int,
   이름     varchar2(100) not null,
   전화     varchar2(100) not null,
   보호자명  varchar2(100) not null,
   보호자직업 varchar2(100),
   주소     varchar2(100)
)

alter table student 
  add constraint pk_student_학번 primary key(학번);

insert into student values(1, '일길동','111-1111','일아비','자영업','서울');
insert into student values(2, '이길동','222-2222','이아비','회사원','인천');

select * from student

create table score
(
  일련번호 int,
  학번    int,
  국어    int,
  영어    int,
  수학    int,
  학년    int,
  학기    int,
  시험종류 varchar2(100) 
)

-- 기본키
alter table score
  add constraint pk_성적_일련번호 primary key(일련번호)

-- 외래키
alter table score
  add constraint fk_성적_학번 foreign key(학번) references student(학번);  
  
insert into score values(1, 1, 100, 90, 40, 1, 1, '중간고사') -- OK
insert into score values(1, 2, 100, 90, 40, 1, 1, '중간고사') -- 에러! 
                                                           -- ORA-00001: 무결성 제약 조건(TEST1.PK_성적_일련번호)에 위배됩니다
insert into score values(2, 1, 100, 100, 100, 1, 1, '기말고사');
insert into score values(3, 1, 100, 90, 30, 1, 2, '중간고사');
select * from score;