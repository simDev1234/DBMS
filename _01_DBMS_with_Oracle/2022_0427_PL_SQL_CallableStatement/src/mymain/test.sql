-- �μ��� ���� �ο���
SELECT
 deptno �μ���ȣ,
 sasex ����,
 count(*) �ο���
FROM SAWON
GROUP BY DEPTNO, sasex
order by deptno, sasex

-- ���޺� �ο���
select 
  sajob ����,
  count(*) �ο���
from sawon
group by sajob
order by sajob

-- �Ի翬���� �ο���
select
  to_char(sahire,'yyyy') �Ի翬��,
  count(*) �ο���
from sawon 
group by to_char(sahire, 'yyyy')
order by to_char(sahire, 'yyyy')

-- �Ի���� �ο���
select
  to_char(sahire, 'mm') �Ի��,
  count(*) �ο���
from sawon
group by to_char(sahire, 'mm')
order by to_char(sahire, 'mm')

-- �������� ������ �ο���
select
  substr(goaddr,1,2) as ������,
  substr(goaddr,4,3) as ����,
  count(*) �ο���
from gogek
group by substr(goaddr,1,2), substr(goaddr,4,3)
order by substr(goaddr,1,2), substr(goaddr,4,3)

-- ������̺��� �μ��� �ο����� 5�� �̻��� �μ� 
select 
  deptno �μ�,
  count(*) �ο���
from sawon
group by deptno
having count(*) >= 5
order by deptno

-- ������̺��� �μ����޿������ 3000~3200 ������ �μ��� ���϶�
select
  deptno �μ���,
  round(avg(sapay),2) �޿����
from sawon
group by deptno
having round(avg(sapay),2) between 3000 and 3200
order by deptno

-- �����̺��� ��������� �ο����� ���ϱ� (inline view ���)
select 
  g1.season �������,
  count(*) �ο���
from (select 
        case floor(to_number(substr(gojumin,3,2))/3)
		    when 1 then '��'
		    when 2 then '����'
		    when 3 then '����'
		    else '�ܿ�'
        end season
      from gogek) g1
group by g1.season

