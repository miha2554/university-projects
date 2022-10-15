-- 2.1.1 ������� ��������� ������ PRODUCTS, SELLERS.
DESC PRODUCTS;
DESC SELLERS;

-- 2.1.2 ������� ��� ������ ������� SELLERS. �������� ��� ������ ������� PRODUCTS, ���������� ������� � �������� �������.
SELECT LIMIT, PRICE, DESCRIPTION, CODE, MANUFACTURER FROM PRODUCTS;

-- 2.1.3 �������� ������ ��������� � ��������� ��������.
SELECT FULL_NAME, AGE FROM SELLERS;

-- 2.1.4 ������ ������ �������, �������� ���� � ������ � � �.�. (��������, ��� � ������� ������� ���� ������ � �.�). ������� ������� "�����" "���� (�.�)" "���� (���.)".
SELECT DESCRIPTION �����, PRICE AS "���� (�.�.)", PRICE*57.48 AS "���� (���.)" FROM PRODUCTS;

-- 2.1.5 ������ ��� ������� ����� ������ �������, �������� � ����, �� ������� ��� ������������/������������ ����.
SELECT CITY, REGION,
CASE 
WHEN RESULT<PLAN THEN '���� �� �������� �� '||(PLAN-RESULT) 
WHEN RESULT>PLAN THEN '���� ������������ �� '||(RESULT-PLAN)
ELSE '������ ������������'
END
FROM OFFICES;

-- 2.1.6 ��� ���������, ���� ��������� �������� ����� ������ ��� ������� �������� �� 3% �� ��� ������������ ������ ������. ��� ��������� ������� ��������� � ��� ����������.
SELECT FULL_NAME||', '||POSITION, PLAN, PLAN+0.03*RESULT AS "���������" FROM SELLERS;

-- 2.1.7 ������� ��� ������ �� ������� PRODUCTS, �������� �� ��������. ������� ������� "������� ������".
SELECT MANUFACTURER ||', '|| CODE ||', '|| DESCRIPTION ||', '|| PRICE ||', '|| LIMIT "������� ������" FROM PRODUCTS;

-- 2.2.1 �������� ������������ ������ ���� ��������� � ��������� �� ��������� � ���� ������ �� ������.
SELECT ROWNUM AS "���������� �����", FULL_NAME, POSITION, EMPLOYMENT_DATE FROM SELLERS;

-- 2.2.2 ��������� ������� � ��������� �� ������� ������, ���� ��� ������������� ���������� 10.2 �����, � ��������� ���� - 15.25 ������.
SELECT ROUND (((15.25-10.2)/10.2)*100,3) FROM DUAL;

-- 2.2.3 ������� ��� ������������ ������, ��������� ������������� ������.
SELECT DISTINCT MANUFACTURER FROM PRODUCTS;
