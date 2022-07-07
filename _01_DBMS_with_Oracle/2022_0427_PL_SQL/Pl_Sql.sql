CREATE TABLE book
(
   idx   INT,
   name  CHAR(3 CHAR) NOT NULL,
   price INT
);

ALTER TABLE book 
  ADD CONSTRAINT pk_book_idx PRIMARY KEY(idx);
  
-- SAMPLE DATA 입력
INSERT INTO book VALUES((SELECT nvl(MAX(idx), 0) + 1 FROM book),'Java',20000);
INSERT INTO book VALUES((SELECT nvl(MAX(idx), 0) + 1 FROM book),'Oracle',30000);
INSERT INTO book VALUES((SELECT nvl(MAX(idx), 0) + 1 FROM book),'HTML',24000);
INSERT INTO book VALUES((SELECT nvl(MAX(idx), 0) + 1 FROM book),'JSP',22000);

-- INDEX 주는 방법
SELECT nvl(MAX(idx), 0) + 1 FROM book;

-- 수정
create or replace procedure book_insert(v_name IN varchar2, v_price IN number, v_idx IN number)
is
begin
   UPDATE book SET name = v_name, price = v_price WHERE idx = v_idx;
   commit;
end;
/


--삭제
create or replace procedure book_delete(v_idx IN number)
is
begin
   DELETE from book WHERE idx = v_idx;
   commit;
end;
/

-- pl/sql추가
create or replace procedure book_insert(v_name IN varchar2, v_price IN number)
is
begin
   INSERT INTO book VALUES((SELECT nvl(MAX(idx), 0) + 1 FROM book),v_name,v_price);
   commit;
end;
/

-- 실행
/*
SQL>exec book_insert('안드로이드',30000);
*/


