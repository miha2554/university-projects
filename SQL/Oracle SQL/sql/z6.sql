-- 6.1.1 Создать таблицу ГОРОДА, хранящую информацию о регионе, в котором расположен город, названии города, количестве населения (РЕГИОН, ГОРОД, НАСЕЛЕНИЕ). 
--Для определения типа данных столбцов - воспользуйтесь рассмотрением структуры таблицы OFFICES. Оцените, какие из полей должны быть включены в первичный ключ, создайте его. 
--Наложите ограничение на численность населения (>0). Заполните вновь созданную таблицу значениями городов из таблицы OFFICES.
DESC OFFICES;
CREATE TABLE CITIES
(REGION VARCHAR2(10 CHAR) NOT NULL,
CITY VARCHAR2(15 CHAR) NOT NULL,
POPULATION NUMBER,
PRIMARY KEY (REGION, CITY),
CONSTRAINT POPULATION_CHECK CHECK (POPULATION > 0));
INSERT INTO CITIES (REGION, CITY) SELECT REGION, CITY FROM OFFICES;
SELECT * FROM CITIES;

-- 6.1.3 Создайте таблицу ПРОИЗВОДИТЕЛИ (товаров). Руководствуйтесь таблицей PRODUCTS.
DESC PRODUCTS;
SELECT * FROM PRODUCTS;
CREATE TABLE MANUFACTURERS
(MANUFACTURER_ID NUMBER(4,0) NOT NULL,
MANUFACTURER VARCHAR2(3 CHAR) NOT NULL,
PRIMARY KEY (MANUFACTURER_ID));

-- 6.2.4 Модифицировать таблицу PRODUCTS, необходимо установить связь со справочной таблицей ПРОИЗВОДИТЕЛИ.
ALTER TABLE PRODUCTS
ADD FOREIGN KEY (MANUFACTURER) REFERENCES MANUFACTURERS (MANUFACTURER_ID);

-- 6.2.5 Удалить таблицы Группы и Студенты (не создавались, создавались Города и Производители).
DROP TABLE  PRODUCTS;
DROP TABLE MANUFACTURERS; 