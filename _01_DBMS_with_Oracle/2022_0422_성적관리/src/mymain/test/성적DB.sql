/*

--- 오라클의 일련번호 관리 객체 (시퀀스)
CREATE SEQUENCE seq_sungtb_idx


--- 테이블 생성
CREATE TABLE sungtb
(
    idx   INT,      -- 일련변호
    name  CHAR(4 char) NOT NULL, --이름
    kor   INT,      -- 국어
    eng   INT,      -- 영어
    mat   INT      -- 수학
);


--- 제약조건 
ALTER TABLE sungtb 
  ADD CONSTRAINT pk_sungtb_idx PRIMARY KEY(idx)


--- 체크제약(국어/영어/수학) : 0 ~ 100
ALTER TABLE sungtb 
  ADD CONSTRAINT ck_sungtb_kor check(kor between 0 and 100)
  
ALTER TABLE sungtb 
  ADD CONSTRAINT ck_sungtb_eng check(eng between 0 and 100)
  
ALTER TABLE sungtb 
  ADD CONSTRAINT ck_sungtb_mat check(mat between 0 and 100)
  
  
--- SAMPLE DATA
INSERT INTO sungtb VALUES(seq_sungtb_idx.nextVal, '일길동', 90, 80, 70);
INSERT INTO sungtb VALUES(seq_sungtb_idx.nextVal, '이길동', 80, 80, 80);
INSERT INTO sungtb VALUES(seq_sungtb_idx.nextVal, '삼길동', 90, 100, 90);

-- 삭제
DELETE FROM sungtb WHERE idx = 21;

-- 수정
UPDATE sungtb SET name = '일길동', kor = 100, eng = 100, mat = 100 WHERE idx = 1;

COMMIT


--- 조회 시 필요한 뷰를 생성

CREATE OR REPLACE VIEW sungtb_view
AS
	SELECT
	   s.*, 
	   (kor + eng + mat) as tot,  --- tot는 SQL문이 완전히 끝났을 때 생긴다.
	   ROUND((kor + eng + mat) / 3, 1) as avg,
	   RANK() OVER(ORDER BY (kor + eng + mat) desc) as rank
	FROM (SELECT * FROM sungtb) s
	ORDER BY idx


SELECT * FROM sungtb_view;


*/