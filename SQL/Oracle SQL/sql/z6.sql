-- 6.1.1 ������� ������� ������, �������� ���������� � �������, � ������� ���������� �����, �������� ������, ���������� ��������� (������, �����, ���������). 
--��� ����������� ���� ������ �������� - �������������� ������������� ��������� ������� OFFICES. �������, ����� �� ����� ������ ���� �������� � ��������� ����, �������� ���. 
--�������� ����������� �� ����������� ��������� (>0). ��������� ����� ��������� ������� ���������� ������� �� ������� OFFICES.
DESC OFFICES;
CREATE TABLE CITIES
(REGION VARCHAR2(10 CHAR) NOT NULL,
CITY VARCHAR2(15 CHAR) NOT NULL,
POPULATION NUMBER,
PRIMARY KEY (REGION, CITY),
CONSTRAINT POPULATION_CHECK CHECK (POPULATION > 0));
INSERT INTO CITIES (REGION, CITY) SELECT REGION, CITY FROM OFFICES;
SELECT * FROM CITIES;

-- 6.1.3 �������� ������� ������������� (�������). ���������������� �������� PRODUCTS.
DESC PRODUCTS;
SELECT * FROM PRODUCTS;
CREATE TABLE MANUFACTURERS
(MANUFACTURER_ID NUMBER(4,0) NOT NULL,
MANUFACTURER VARCHAR2(3 CHAR) NOT NULL,
PRIMARY KEY (MANUFACTURER_ID));

-- 6.2.4 �������������� ������� PRODUCTS, ���������� ���������� ����� �� ���������� �������� �������������.
ALTER TABLE PRODUCTS
ADD FOREIGN KEY (MANUFACTURER) REFERENCES MANUFACTURERS (MANUFACTURER_ID);

-- 6.2.5 ������� ������� ������ � �������� (�� �����������, ����������� ������ � �������������).
DROP TABLE  PRODUCTS;
DROP TABLE MANUFACTURERS; 