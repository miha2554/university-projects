-- 4.1.1 �������� ��������������� ������ ��������� � �� ���� �� ��������� �����, ������� ������ ���� �������� �� 15% �� ��������� � �������. ��� ������ ���� � ������� "������� �.�.", ����� ���� ������� �� �����.
SELECT ROWNUM AS "���������� �����", FULL_NAME,
  SUBSTR(FULL_NAME,1,INSTR(FULL_NAME,' ')-1)||' '||SUBSTR(FULL_NAME,INSTR(FULL_NAME,' ')+1,1)||'.'||SUBSTR(FULL_NAME,INSTR(FULL_NAME,' ',1,2)+1,1)||'.' AS "������� �.�.", 
  PLAN AS "������� ����", 
  ROUND(1.15*PLAN) AS "���� �� ����. �����" 
FROM SELLERS; 

-- 4.1.2 ������� ��������� �� ������. ������ ��������� ��� 7% �� ���������� ��������� ��� �����. � ������ ������ ������� ������ �� ��������, ������� ������������� ����. ������������� ���������� ������ �� ������ � ������� �������� ���������.
SELECT FULL_NAME, (RESULT-PLAN)*0.07 AS "������", OFFICE_CODE
FROM SELLERS 
WHERE (RESULT > PLAN)
ORDER BY OFFICE_CODE;

-- 4.1.3 ������� ���������, ������� ������� - ������ �����. ������� ������� � ������� ������, ������������� ������ �� �������� ��������.
SELECT * FROM SELLERS;
SELECT FULL_NAME, AGE, TO_CHAR(AGE, 'RN') AS "������� � ������� ������" FROM SELLERS WHERE MOD(AGE,2)=0 ORDER BY AGE DESC;

-- 4.2.1 ������� �������, ��������� �� ������� ��������� � �� ���� ����� �� ������. ������� � ��� ����� ��������� ������ " ������ ".
SELECT SUBSTR(FULL_NAME,1,INSTR(FULL_NAME,' ')-1)||' ������ � '||TO_CHAR(EMPLOYMENT_DATE,'YYYY') FROM SELLERS WHERE EMPLOYMENT_DATE IS NOT NULL; -- ������ �������� �����������

-- 4.2.2 ������� ������ ������� ���������� �������, ������ �������� ������.
SELECT LPAD(UPPER(DESCRIPTION),26,' ') FROM PRODUCTS;

-- 4.3.3 �������� ������, ��������� �������� ���� � ������� "05 ���� 2000 ����".
SELECT TO_CHAR(SYSDATE,'DD')||' '||
DECODE(TO_NUMBER(TO_CHAR(SYSDATE,'MM')),
1,'������',
2,'�������',
3,'�����',
4,'������',
5,'���',
6,'����',
7,'����',
8,'�������',
9,'��������',
10,'�������',
11,'������',
12,'�������')
||' '||TO_CHAR(SYSDATE,'YYYY')||' ����'
FROM DUAL;

-- 4.3.1 �������� ������ ��� ������ �������� �������, �������� ������� "������� �����".
SELECT TO_CHAR(SYSDATE, 'HH24:MI:SS') AS "������� �����" FROM DUAL;

-- 4.3.4 ������� �����, ������� ��������� ��� ���������� 1-�� ���� � ���������� �������.
SELECT TO_CHAR(SYSDATE+1/24, 'HH24:MI:SS') FROM DUAL;

-- 4.4 �������������������� � ������������� �������� �������������� �����: �������� � ������ �����, ������������� ������ � ����, �� ��������� ������� TO_DATE, ���������� �������������� �������� � ����������� �������� � �.�.
SELECT '34'+45 FROM DUAL;
SELECT '34'||45 FROM DUAL;
SELECT ADD_MONTHS('01.11.2017',12) FROM DUAL;

-- 4.5.3 ������� ��� �������� ������������ ������ � ������� �����.
SELECT USER, TO_CHAR(SYSDATE, 'HH24:MI:SS') FROM DUAL;

-- 4.5.2 ������� ��� ������ ������� �� ���� �������: 1 - ��� � ����� �����, 2 - ("���� ��������","���� �� ��������") � ����������� � ���������� �����. ��� ���������, ���� � ������ �� ������ ����������� �������� �� ��������? � ���� ������ �������� �������� "����������".
SELECT CODE||' '||CITY AS "��� � �����", 
CASE
WHEN PLAN>RESULT THEN '���� ��������'
WHEN PLAN<RESULT THEN '���� �� ��������'
ELSE '����������'
END AS "����"
FROM OFFICES;

-- 4.6.2 ��������� ������� ������� ���������� ����� ���������� �� ������ � �� ����� � �����.
SELECT AVG(RESULT/PLAN*100) FROM SELLERS;

-- 4.6.3 ������� �����, ���������� �� ����������� �����, �� ��� ������, �� ������, �� ������� ���� ����� N ������.
SELECT PRODUCT_MANUFACTURER, PRODUCT_CODE, COUNT(*), SUM(TOTAL_SUM)
FROM ORDERS
GROUP BY (PRODUCT_MANUFACTURER, PRODUCT_CODE)
HAVING COUNT(*)>2; -- N=2

-- 4.7.1 �������� � ����� ������� ������������ ����� ������ ����� ���������, � ����� ����������� ����� ������. ��������� �������� � ���� ���������: 1) � ����� ������; 2) � ����� �������.
SELECT MIN(RESULT), MAX(RESULT) FROM SELLERS;
SELECT MAX(RESULT) AS ��������� FROM SELLERS
UNION
SELECT MIN(RESULT) FROM SELLERS;

-- 4.7.2 ������� ��� ������ �� ���������� ������, �� ����������� ���������� (�� �������). ��������������� ���������� MINUS.
SELECT * FROM ORDERS WHERE PRODUCT_MANUFACTURER = 'ZSM' AND PRODUCT_CODE='PS01';
SELECT * FROM ORDERS 
WHERE PRODUCT_MANUFACTURER = 'ZSM' AND PRODUCT_CODE='PS01'
MINUS
SELECT * FROM ORDERS 
WHERE PRODUCT_MANUFACTURER = 'ZSM' AND PRODUCT_CODE='PS01'
AND ORDER_DATE = (SELECT MAX(ORDER_DATE) FROM ORDERS WHERE PRODUCT_MANUFACTURER = 'ZSM' AND PRODUCT_CODE = 'PS01');

-- 4.7.3 � ���������� ������� �������� ������� �� ���� �����, � ������� ����������� 3 ���������������� ����, ������� � �������.
SELECT TO_CHAR(SYSDATE, 'DD.MM.YYYY') AS "1" FROM DUAL UNION
SELECT TO_CHAR(SYSDATE+1, 'DD.MM.YYYY') AS "2" FROM DUAL UNION
SELECT TO_CHAR(SYSDATE+2, 'DD.MM.YYYY') AS "3" FROM DUAL;

-- 4.7.5 ������� ����� �������� ����� ������ �� ������������� �������, � ��� �� ����� ����� ������.
SELECT SUM(TOTAL_SUM), PRODUCT_MANUFACTURER FROM ORDERS GROUP BY PRODUCT_MANUFACTURER
UNION
SELECT SUM(TOTAL_SUM), '�����' FROM ORDERS;
