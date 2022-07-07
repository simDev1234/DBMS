-- ������̺��� �� �������� �ٹ� ����, �ٹ� ���� ��ȸ
SELECT 
  SABUN, SANAME, SAHIRE,
  FLOOR(MONTHS_BETWEEN(SYSDATE, SAHIRE)/12) AS �ٹ�����,
  FLOOR(MOD(MONTHS_BETWEEN(SYSDATE,SAHIRE),12)) AS �ܿ�����,
  FLOOR(MONTHS_BETWEEN(SYSDATE,SAHIRE)) AS �ѱٹ�����,
  10000 AS ������,
  FLOOR(SAPAY/13) AS ����
FROM SAWON;


-- ������ ������ ���� (������ �������� ���Ե� ���)
-- ���� = ���� / 13 
-- ������ = ���� * �ٹ����� + ���� * �ܿ�����/12
--      = ���� * �� �ٹ����� / 12
--      = ���� / 12 * �� �ٹ�����
SELECT
  SABUN, SANAME, SAHIRE,
  ROUND(SAPAY/13) AS ����,
  ROUND((SAPAY/13) / 12 * MONTHS_BETWEEN(SYSDATE,SAHIRE)) AS ������
FROM SAWON;