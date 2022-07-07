/*
 
    ���� (Join)
    : 2�� �̻��� ���̺��� �����ؼ� ��ȸ�ϴ� ���
    
    1. ����
      1) A inner join B : ��� ���� 1 : 1�� ����
      2) outer join : 
           A left  outer join B : A (left) ���̺� ���� ��� ����. B ���̺��� ���� ���ǿ� �����ϴ� �ุ ����.
           A right outer join B : B (right) ���̺� ���� ��� ����. A ���̺��� ���� ���ǿ� �����ϴ� �ุ ����. 
           A full  outer join B : ���ǿ� �´� ���� ���� + ���ǿ� ���� �ʴ��� A,B ������ �� ��� ����.
      3) A cross join B : A�� ���� * B�� ����
      4) self join      : �ڽ��� ���̺�� ����
      
    ###1. inner join (= equi join) 
    
    (1) �Ϲ����� inner join ���
    
    SELECT 
       sabun, saname, dname, loc
    FROM dept, sawon
    WHERE dept.deptno = sawon.deptno
    
    SELECT 
       sabun, saname, deptno, dname, loc   ---- ����! why? deptno�� �ΰ��� ���̺� ��ο� ���� 
    FROM dept, sawon                            -- ���� ���ǰ� �ָ��մϴ�. (����� deptno����)
    WHERE dept.deptno = sawon.deptno
    
    SELECT
       sabun, saname, dept.deptno, dname, loc
    FROM dept, sawon
    WHERE dept.deptno = sawon.deptno
    
    (2) [ANSI-92 SQL] *ANSI : ǥ�� SQL (��� DBMS���� ���������� ���Ǵ� ���)
    
    SELECT 
      *
    FROM dept d INNER JOIN sawon s ON d.deptno = s.deptno
              (���� ���)             ON (���� ����)
    
    ###2. cross join : ���� ���� ���� ����
    
    SELECT * FROM dept, sawon
    
    [ANSI-92]
    SELECT * FROM dept CROSS JOIN sawon
    
    
    ###3. self join + inner join
    (�������)           (�������)
    ���    ����   �����   �����   �������   ���� 
    
    SELECT
      s1.sabun, s1.sajob, s1.saname, -- �������
      s2.sabun, s2.sajob, s2.saname  -- �������
    FROM sawon s1, sawon s2
    WHERE s1.samgr = s2.sabun
    
    [left outer join oracle ����]
    SELECT
      s1.sabun, s1.sajob, s1.saname, -- �������
      s2.sabun, s2.sajob, s2.saname  -- �������
    FROM sawon s1, sawon s2
    WHERE s1.samgr = s2.sabun(+)     -- s1.samgr�� ��� ���, s2.sabun�κ��� null�� ä���
    
    cf ) MS-SQL server (left outer join)
         where s1.samgr *= s2.sabun
         
    [ANSI-92]
    SELECT
      s1.sabun, s1.sajob, s1.saname, -- �������
      s2.sabun, s2.sajob, s2.saname  -- �������
    FROM sawon s1 left outer join sawon s2 on s1.samgr = s2.sabun
    OREDER BY s1.sabun;
    
    
    ###5. full outer join : ANSI-92
    SELECT * 
    FROM dept d FULL OUTER JOIN sawon s ON d.deptno = s.deptno
    
    ### sawon + gogek
    ���      �����    ����ȣ   ����
    SELECT * FROM gogek order by gobun
    
    -- ���� �ִ� ����� ���
    SELECT
      *
    FROM sawon s INNER JOIN gogek g ON s.sabun = g.godam
    ORDER BY sabun
    
    -- ���� ���� ��� ���� ��� ���
    SELECT
      *
    FROM sawon s LEFT OUTER JOIN gogek g ON s.sabun = g.godam
    WHERE gobun IS NULL
    
    -- ���� ���� ����� ���
    SELECT
      sabun, saname, gobun, goname
    FROM sawon s LEFT OUTER JOIN gogek g ON s.sabun = g.godam
    --WHERE gobun IS NULL
    ORDER BY sabun
    
    
    Q. �Ʒ��� ���� ����϶�.(�� ���� ���̺��� �� ���� ����)
    ��� ����� �μ���ȣ �μ��� ����ȣ ���� 
     sawon       dept      gogek
    
    SELECT 
      sabun, saname, 
      d.deptno, dname,
      gobun, goname
    FROM sawon s INNER JOIN dept d ON s.deptno = d.deptno  --(1) sawon, dept ������ ���̺�
         LEFT OUTER JOIN gogek g ON s.sabun = g.godam      --(2) ������ ���̺� gogek����
    ORDER BY sabun
    
    Q. �Ʒ� ���� ��� ��ȸ�ϼ���.
    ���    �����   �μ���ȣ  �μ���  ����ȣ  ����   ����ȣ  ����   ������ȣ   ������
       sawon s1      dept d      gogek g1        sawon s2         gogek g2
    
    SELECT
      s1.sabun as ���,      s1.saname as �����,
      d.deptno as �μ���ȣ,   d.dname as �μ���,
      g1.gobun as ����ȣ,   g1.goname as ����,
      s2.samgr as ����ȣ,   s2.saname as ����,
      g2.gobun as ������ȣ, g2.goname as ������
    FROM sawon s1 INNER JOIN dept d ON s1.deptno = d.deptno
         LEFT OUTER JOIN gogek g1 ON s1.sabun = g1.gobun
         LEFT OUTER JOIN sawon s2 ON s1.sabun = s2.samgr
         LEFT OUTER JOIN gogek g2 ON s2.samgr = g2.gobun
    ORDER BY s1.sabun
          
*/