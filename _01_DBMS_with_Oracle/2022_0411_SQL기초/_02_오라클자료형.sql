/*

1. ������ : byte���� ũ��
   char(ũ��)     :  ���� ���� 
   varchar2(ũ��) :  ���� ���� 
   -- �������̶�?
      ex. memo char(2000)     -> 'a' -> �� �Ҵ� ũ�� : 2000byte
          memo varchar2(2000) -> 'a' -> �� �Ҵ� ũ�� : 1byte

2. ������ : ����(�ڸ���) <- ������
   number(����)
   number(p,s) -- p : precision(��ü ����), s : scale(�Ҽ��� ����)
   int   ==  number(38)�� ���� �ڷ���  *���ڰ� 38���̴�. n^38(�ڹ��� float�� ���� ����)
   �� �׻� ���̴� �˳��ϰ� �ִ� ���� ����.
   
3. ��¥�� :  
   date(�ڷ���)
   sysdate : ���� �ý��� ��¥/�ð��� �����ִ� �Լ�  
   select sysdate from dual  -- dual(�ӽ����̺�)
   
4. LOB(Large Object) : �ִ� 4GB
   *���� ������ ���̺��� ������ ������ ������ ����ȴ�.
   BLOB(Binary Large Object) : ������/����/�̹���...
   CLOB(Char Large Object)   : ������ ��뷮
   
5. raw (�ҷ��� binary)
   LONG(�� ���ڵ忡 �� ���� ������ �� ����)
   
*/