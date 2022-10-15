-- 3.1.1 ������� ���������, ����� ������ ������� ����� 20000.
SELECT FULL_NAME, RESULT FROM SELLERS WHERE (RESULT>20000);

-- 3.1.2 ������� ������ ������, ����������� ������ ������ ������� ��������� ����� 80% �� ��������.
SELECT CODE, RESULT, PLAN FROM OFFICES WHERE ((RESULT/PLAN)*100<80);
SELECT CODE, RESULT, PLAN FROM OFFICES WHERE (RESULT<0.8*PLAN);

-- 3.1.3 ������� ���, ���� � ��������� ��� ���������, � ������� ����� ������ �������� ��������. ������� �� �� �������, �� ��� ���������, � ������� ����� ������ �� ������ ���������. �������� �������� �� ���������� ��������� ����� � ������ � �� ������ ������. ������ ���������� ������������ ����� �� ����� ������ ���������� ����� � �������?
SELECT FULL_NAME, PLAN, RESULT FROM SELLERS WHERE (RESULT>PLAN);
SELECT FULL_NAME, PLAN, RESULT FROM SELLERS WHERE (RESULT<=PLAN);
SELECT * FROM SELLERS;

-- 3.1.4 �������� ��� ������, ����������� � ��������� �������� 2011 ����.
SELECT * FROM ORDERS;
SELECT PRODUCT_CODE FROM ORDERS WHERE (TO_CHAR(ORDER_DATE, 'MM')>=10) AND (TO_CHAR(ORDER_DATE, 'YY')=11);
SELECT PRODUCT_CODE FROM ORDERS WHERE (TO_DATE('01.10.11','DD.MM.YY')<=ORDER_DATE)AND(TO_DATE('01.01.12','DD.MM.YY')>ORDER_DATE);

-- 3.1.5 ������� ������ ���������, ����������� ������ ������ ������� �� �������� � �������� �� 80 �� 120 ��������� �����.
SELECT FULL_NAME, 0.8*PLAN, 1.2*PLAN, RESULT, PLAN FROM SELLERS WHERE (RESULT<0.8*PLAN)OR(RESULT>1.2*PLAN);

-- 3.1.6 ������� ���������, ���������� � �������� � ���������. ������� ���������, �� ���������� � �������� � ���������.
SELECT * FROM OFFICES;
SELECT SELLER_ID, CITY FROM OFFICES WHERE (CITY='�������')OR(CITY='��������');
SELECT SELLER_ID, CITY FROM OFFICES WHERE (CITY!='�������')AND(CITY!='��������'); -- CITY NOT NULL, ����� �� �������������

-- 3.1.8 ������� ������, ���������� �����������.
SELECT * FROM PRODUCTS;
SELECT DESCRIPTION, CODE FROM PRODUCTS WHERE LOWER(DESCRIPTION) LIKE '%��������%';

-- 3.1.9 ������� ��������� - ������.
SELECT * FROM SELLERS WHERE FULL_NAME LIKE '%���%' OR FULL_NAME LIKE '%���%';

-- 3.1.10 ������� ������ ���������, ����������� �� �������. ������� ������ ���������, ������� �� ���������� ����.
SELECT * FROM SELLERS WHERE PLAN IS NULL;
SELECT * FROM SELLERS WHERE OFFICE_CODE IS NOT NULL;

-- 3.1.11 ����� ���� ���������, ������� �������� � ��������� � ��������, � ������������� ����.
SELECT * FROM SELLERS;
SELECT * FROM OFFICES;
SELECT * FROM SELLERS WHERE OFFICE_CODE IN (SELECT CODE FROM OFFICES WHERE CITY IN ('��������', '�������')) AND RESULT>PLAN;

-- 3.1.12 ������� ���������, ������� ��� ���� � ������.
SELECT * FROM SELLERS;
SELECT FULL_NAME FROM SELLERS WHERE FULL_NAME LIKE '% ���� %' OR FULL_NAME LIKE '% ������ %';

-- 3.2.1 ������� ������ ������, ��������������� �� �������� ����� ����������� � �������� �������� ������.
SELECT * FROM OFFICES;
SELECT CODE, RESULT-PLAN FROM OFFICES ORDER BY RESULT-PLAN NULLS FIRST;

-- 3.2.2 ������� ������ �������, ��������������� �� �������� ���� ������������, � ������ ������ ������������ ������������� ������ � ���������� �������.
SELECT * FROM PRODUCTS;
SELECT MANUFACTURER, DESCRIPTION FROM PRODUCTS ORDER BY MANUFACTURER DESC, DESCRIPTION;

-- 3.2.3 �� ���������������� �� ������� "FULL_NAME" ������ ��������� �������� ������ 5 �����.
SELECT FULL_NAME FROM (SELECT * FROM SELLERS ORDER BY FULL_NAME) WHERE ROWNUM<6;
SELECT * FROM SELLERS;
