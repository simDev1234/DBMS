-- 추가
create or replace procedure book_insert(v_name IN varchar2, v_price IN number)
is
begin
   INSERT INTO book VALUES((SELECT nvl(MAX(idx), 0) + 1 FROM book),v_name,v_price);
   commit;
end;
/

--수정
create or replace procedure book_update(v_name IN varchar2, v_price IN number, v_idx IN number)
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