/*


CREATE TABLE test_member
(
   idx  int,
   id   varchar2(100) not null,
   pwd  varchar2(100) not null,
   name varchar2(100) not null
);


-- 기본키 설정 (인덱스)
ALTER TABLE test_member
  ADD CONSTRAINT pk_test_member_idx PRIMARY KEY(idx);
  

-- 아이디 중복 불허 (unique)
ALTER TABLE test_member
  ADD CONSTRAINT unique_test_member_id UNIQUE(id);
  
  
-- 샘플 데이터 입력
INSERT INTO test_member VALUES(1,'one','1234','김길동');
INSERT INTO test_member VALUES(2,'two','5678','나길동');
INSERT INTO test_member VALUES(3,'three','7890','다길동');
INSERT INTO test_member VALUES(4,'four','1555','라길동');
INSERT INTO test_member VALUES(5,'five','6666','마길동');
INSERT INTO test_member VALUES(6,'six','7777','바길동');
INSERT INTO test_member VALUES(7,'seven','5644','사길동');
INSERT INTO test_member VALUES(8,'eight','1235','아길동');
INSERT INTO test_member VALUES(9,'nine','1254','자길동');

COMMIT


--LOGIN SQL

--해커는 아래와 같이 SQL문을 확인하고, injection()을 통해 데이터를 훔쳐올 수 있다
--SQL injection(별도의 SQL명령을 붙인다)
SELECT * 
FROM test_member 
WHERE id = 'one' and pwd ='1234' or 1=1
                               //이런 식으로 항상 참을 붙여서 데이터를 다 가져옴

*/