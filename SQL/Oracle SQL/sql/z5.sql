-- 5.1.1 �������� ����� ����� � ������� PRODUCTS. ���������� �������� ����� � ������������ ��������� ������.
SELECT * FROM PRODUCTS;
INSERT INTO PRODUCTS VALUES ('IZI','PT04','���������� �������',2000,300);
INSERT INTO PRODUCTS VALUES ('IZI','PT04','����',2000,300);

-- 5.1.3 ���������� �������� ����� ������, � ������� ������� ��� �������, �������� �������������� �������.
DESC SELLERS;
INSERT INTO SELLERS VALUES (NULL,'������ �.�.',20,'��������','12.05.11',20000,NULL,NULL,'V01');
INSERT INTO SELLERS VALUES (55,'������ �.�.',20,'��������','���',20000,NULL,NULL,'V01');
SELECT * FROM SELLERS;

-- 5.2.1 ������� ��������� ������� PRICELIST_LINES � ��������� � �������� ������� PRODUCTS, �������� ������, ����������� � ������������� "ZOM".
DESC PRICELIST_LINES;
SELECT * FROM PRODUCTS WHERE MANUFACTURER='ZOM';
INSERT INTO PRICELIST_LINES (PRODUCT_CODE,PRODUCT_NAME,PRODUCT_PRICE) SELECT MANUFACTURER||'_'||CODE, DESCRIPTION, PRICE FROM PRODUCTS WHERE MANUFACTURER!='ZOM'; 
SELECT * FROM PRICELIST_LINES;

-- 5.3.1 �������� �������� ������� �������� � ������� 107.
UPDATE SELLERS SET FULL_NAME='�������� ����' WHERE ID=107;
SELECT * FROM SELLERS;

-- 5.3.2 ��������� ���� ���� ������� � ������� PRICELIST_LINES �� 15%.
UPDATE PRICELIST_LINES SET PRODUCT_PRICE=1.15*PRODUCT_PRICE;
SELECT * FROM PRICELIST_LINES;

-- 5.3.3 ��������� ���� ��������, ������������� ���������� � ���������������� 105, 106, 107 � �������� � ��������������� 102.
UPDATE CLIENTS SET SELLER_ID=102 WHERE SELLER_ID IN (105,106,107);
SELECT * FROM CLIENTS;

-- 5.4.1 ������� ������ ������� PRICELIST_LINES � ��������������� "ZSM_PS03"
DELETE FROM PRICELIST_LINES WHERE PRODUCT_CODE = 'ZSM_PS03';

-- 5.4.3 ������� ��� ������ ��������, ������������� ������� 2126.
DELETE FROM ORDERS WHERE CLIENT_ID=2126;

-- 5.4.4 ������� ��� ������, ��������� �� 15 ������ 2002 ����.
DELETE FROM ORDERS WHERE 
ORDER_DATE < TO_DATE('15.11.2002', 'DD.MM.YYYY');
SELECT * FROM ORDERS;

-- 5.4.5 ������� ������ � ���� ��������, ������������� ����������, �������������� ������� 105, 109 � 101.
DELETE FROM CLIENTS WHERE SELLER_ID IN (101,105,109);
ROLLBACK;
SELECT * FROM CLIENTS;

-- 5.5.6 �������� ������-����������: ���� ������ ������. ���� ������ ������� �� ���������� ����� ������ � ������� ORDERS, ��������� ������ ������ ��������, ����������� ����� � �����, � �������� ���������� ��������.
INSERT INTO ORDERS (REF_NUMBER,ORDER_DATE,AMOUNT,TOTAL_SUM,CLIENT_ID,PRODUCT_MANUFACTURER,PRODUCT_CODE,SELLER_ID) VALUES (444444,'21.10.16',1,250,2111,'ZSM','PS01',106);
UPDATE SELLERS SET RESULT=RESULT+250 WHERE ID=106;
UPDATE OFFICES SET RESULT=RESULT+250 WHERE CODE = (SELECT OFFICE_CODE FROM SELLERS WHERE ID=106);
COMMIT; -- �������� ��������� ���������
--ROLLBACK; --������ ����������
--select * from orders;
