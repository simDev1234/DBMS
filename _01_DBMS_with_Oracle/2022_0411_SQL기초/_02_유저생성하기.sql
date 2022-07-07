/*
DDL (Data Definition Language) : create drop alter
1. 유저 생성 
create user test(계정) identified by test(비밀번호)
create user test1 identified by test1

2. 권한 부여
grant connect to test1       --- 연결 권한
grant resource to test1      --- 자원(Table) 생성 관리할 수 있는 권한
grant create view to test1   --- 자원(View) 생성 관리할 수 있는 권한

-- 위의 2개 명령을 한 번에 처리
grant connect,resource to test1

3. 권한 회수(취소)
revoke connect,resource from test1


----### 객체권한 : scott -> test1에게 dept를 조회(SELECT)할 수 있는 권한 부여 
---(작업은 scott가 하고, 조회 권한만 )
grant all   -- 모든 권한 부여(위험)
      (권한)     (객체)   (대상)
grant select on dept to test1   -- 권한 부여

revoke select on dept from test1  -- 권한 회수
*/