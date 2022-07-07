CREATE TABLE book
(
   idx   INT,
   name  CHAR(3 CHAR) NOT NULL,
   price INT
);

ALTER TABLE book 
  ADD CONSTRAINT pk_book_idx PRIMARY KEY(idx);
  
-- SAMPLE DATA �Է�
INSERT INTO book VALUES((SELECT nvl(MAX(idx), 0) + 1 FROM book),'Java',20000);
INSERT INTO book VALUES((SELECT nvl(MAX(idx), 0) + 1 FROM book),'Oracle',30000);
INSERT INTO book VALUES((SELECT nvl(MAX(idx), 0) + 1 FROM book),'HTML',24000);
INSERT INTO book VALUES((SELECT nvl(MAX(idx), 0) + 1 FROM book),'JSP',22000);

-- INDEX �ִ� ���
SELECT nvl(MAX(idx), 0) + 1 FROM book;

-- ����
create or replace procedure book_insert(v_name IN varchar2, v_price IN number, v_idx IN number)
is
begin
   UPDATE book SET name = v_name, price = v_price WHERE idx = v_idx;
   commit;
end;
/


--����
create or replace procedure book_delete(v_idx IN number)
is
begin
   DELETE from book WHERE idx = v_idx;
   commit;
end;
/

-- pl/sql�߰�
create or replace procedure book_insert(v_name IN varchar2, v_price IN number)
is
begin
   INSERT INTO book VALUES((SELECT nvl(MAX(idx), 0) + 1 FROM book),v_name,v_price);
   commit;
end;
/

-- ����
/*
SQL>exec book_insert('�ȵ���̵�',30000);
*/


