-- 5.1.1 Добавить новый товар в таблицу PRODUCTS. Попытаться вставить товар с существующим первичным ключом.
SELECT * FROM PRODUCTS;
INSERT INTO PRODUCTS VALUES ('IZI','PT04','Подоконник широкий',2000,300);
INSERT INTO PRODUCTS VALUES ('IZI','PT04','АААА',2000,300);

-- 5.1.3 Попытаться вставить новую запись, в которой нарушен тип столбца, нарушена обязательность столбца.
DESC SELLERS;
INSERT INTO SELLERS VALUES (NULL,'Иванов А.В.',20,'Продавец','12.05.11',20000,NULL,NULL,'V01');
INSERT INTO SELLERS VALUES (55,'Иванов А.В.',20,'Продавец','ЦАЦ',20000,NULL,NULL,'V01');
SELECT * FROM SELLERS;

-- 5.2.1 Изучить структуру таблицы PRICELIST_LINES и заполнить её записями таблицы PRODUCTS, исключая записи, относящиеся к производителю "ZOM".
DESC PRICELIST_LINES;
SELECT * FROM PRODUCTS WHERE MANUFACTURER='ZOM';
INSERT INTO PRICELIST_LINES (PRODUCT_CODE,PRODUCT_NAME,PRODUCT_PRICE) SELECT MANUFACTURER||'_'||CODE, DESCRIPTION, PRICE FROM PRODUCTS WHERE MANUFACTURER!='ZOM'; 
SELECT * FROM PRICELIST_LINES;

-- 5.3.1 Изменить неверную фамилию продавца с номером 107.
UPDATE SELLERS SET FULL_NAME='Симонова Катя' WHERE ID=107;
SELECT * FROM SELLERS;

-- 5.3.2 Увеличить цену всех товаров в таблице PRICELIST_LINES на 15%.
UPDATE PRICELIST_LINES SET PRODUCT_PRICE=1.15*PRODUCT_PRICE;
SELECT * FROM PRICELIST_LINES;

-- 5.3.3 Перевести всех клиентов, обслуживаемых продавцами с идентификаторами 105, 106, 107 к продавцу с идентификатором 102.
UPDATE CLIENTS SET SELLER_ID=102 WHERE SELLER_ID IN (105,106,107);
SELECT * FROM CLIENTS;

-- 5.4.1 Удалить строку таблицы PRICELIST_LINES с идентификатором "ZSM_PS03"
DELETE FROM PRICELIST_LINES WHERE PRODUCT_CODE = 'ZSM_PS03';

-- 5.4.3 Удалить все заказы компании, идентификатор которой 2126.
DELETE FROM ORDERS WHERE CLIENT_ID=2126;

-- 5.4.4 Удалить все заказы, сделанные до 15 ноября 2002 года.
DELETE FROM ORDERS WHERE 
ORDER_DATE < TO_DATE('15.11.2002', 'DD.MM.YYYY');
SELECT * FROM ORDERS;

-- 5.4.5 Удалить данные о всех клиентах, обслуживаемых продавцами, идентификаторы которых 105, 109 и 101.
DELETE FROM CLIENTS WHERE SELLER_ID IN (101,105,109);
ROLLBACK;
SELECT * FROM CLIENTS;

-- 5.5.6 Провести бизнес-транзакцию: ввод нового заказа. Ввод заказа состоит из добавления новой строки в таблице ORDERS, изменения объема продаж продавца, оформившего заказ и офиса, к которому прикреплен продавец.
INSERT INTO ORDERS (REF_NUMBER,ORDER_DATE,AMOUNT,TOTAL_SUM,CLIENT_ID,PRODUCT_MANUFACTURER,PRODUCT_CODE,SELLER_ID) VALUES (444444,'21.10.16',1,250,2111,'ZSM','PS01',106);
UPDATE SELLERS SET RESULT=RESULT+250 WHERE ID=106;
UPDATE OFFICES SET RESULT=RESULT+250 WHERE CODE = (SELECT OFFICE_CODE FROM SELLERS WHERE ID=106);
COMMIT; -- фиксация внесенных изменений
--ROLLBACK; --отмена транзакции
--select * from orders;
