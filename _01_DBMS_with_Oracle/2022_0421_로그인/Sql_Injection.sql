/*


CREATE TABLE test_member
(
   idx  int,
   id   varchar2(100) not null,
   pwd  varchar2(100) not null,
   name varchar2(100) not null
);


-- �⺻Ű ���� (�ε���)
ALTER TABLE test_member
  ADD CONSTRAINT pk_test_member_idx PRIMARY KEY(idx);
  

-- ���̵� �ߺ� ���� (unique)
ALTER TABLE test_member
  ADD CONSTRAINT unique_test_member_id UNIQUE(id);
  
  
-- ���� ������ �Է�
INSERT INTO test_member VALUES(1,'one','1234','��浿');
INSERT INTO test_member VALUES(2,'two','5678','���浿');
INSERT INTO test_member VALUES(3,'three','7890','�ٱ浿');
INSERT INTO test_member VALUES(4,'four','1555','��浿');
INSERT INTO test_member VALUES(5,'five','6666','���浿');
INSERT INTO test_member VALUES(6,'six','7777','�ٱ浿');
INSERT INTO test_member VALUES(7,'seven','5644','��浿');
INSERT INTO test_member VALUES(8,'eight','1235','�Ʊ浿');
INSERT INTO test_member VALUES(9,'nine','1254','�ڱ浿');

COMMIT


--LOGIN SQL

--��Ŀ�� �Ʒ��� ���� SQL���� Ȯ���ϰ�, injection()�� ���� �����͸� ���Ŀ� �� �ִ�
--SQL injection(������ SQL����� ���δ�)
SELECT * 
FROM test_member 
WHERE id = 'one' and pwd ='1234' or 1=1
                               //�̷� ������ �׻� ���� �ٿ��� �����͸� �� ������

*/