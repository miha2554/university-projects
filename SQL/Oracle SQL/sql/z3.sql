-- 3.1.1 Вывести продавцов, объём продаж которых более 20000.
SELECT FULL_NAME, RESULT FROM SELLERS WHERE (RESULT>20000);

-- 3.1.2 Вывести список офисов, фактические объёмы продаж которых составили менее 80% от плановых.
SELECT CODE, RESULT, PLAN FROM OFFICES WHERE ((RESULT/PLAN)*100<80);
SELECT CODE, RESULT, PLAN FROM OFFICES WHERE (RESULT<0.8*PLAN);

-- 3.1.3 Вывести ФИО, план и результат для продавцов, у которых объём продаж превысил плановый. Выбрать те же колонки, но для продавцов, у которых объём продаж не больше планового. Обратить внимание на количество выбранных строк в первом и во втором случае. Почему количество возвращённых строк не равно общему количеству строк в таблице?
SELECT FULL_NAME, PLAN, RESULT FROM SELLERS WHERE (RESULT>PLAN);
SELECT FULL_NAME, PLAN, RESULT FROM SELLERS WHERE (RESULT<=PLAN);
SELECT * FROM SELLERS;

-- 3.1.4 Получить все заказы, оформленные в последнем квартале 2011 года.
SELECT * FROM ORDERS;
SELECT PRODUCT_CODE FROM ORDERS WHERE (TO_CHAR(ORDER_DATE, 'MM')>=10) AND (TO_CHAR(ORDER_DATE, 'YY')=11);
SELECT PRODUCT_CODE FROM ORDERS WHERE (TO_DATE('01.10.11','DD.MM.YY')<=ORDER_DATE)AND(TO_DATE('01.01.12','DD.MM.YY')>ORDER_DATE);

-- 3.1.5 Вывести список продавцов, фактические объёмы продаж которых не попадают в диапазон от 80 до 120 процентов плана.
SELECT FULL_NAME, 0.8*PLAN, 1.2*PLAN, RESULT, PLAN FROM SELLERS WHERE (RESULT<0.8*PLAN)OR(RESULT>1.2*PLAN);

-- 3.1.6 Выбрать продавцов, работающих в Сарапуле и Воткинске. Выбрать продавцов, не работающих в Сарапуле и Воткинске.
SELECT * FROM OFFICES;
SELECT SELLER_ID, CITY FROM OFFICES WHERE (CITY='Сарапул')OR(CITY='Воткинск');
SELECT SELLER_ID, CITY FROM OFFICES WHERE (CITY!='Сарапул')AND(CITY!='Воткинск'); -- CITY NOT NULL, МОЖНО НЕ РАССМАТРИВАТЬ

-- 3.1.8 Выбрать товары, являющиеся комплектами.
SELECT * FROM PRODUCTS;
SELECT DESCRIPTION, CODE FROM PRODUCTS WHERE LOWER(DESCRIPTION) LIKE '%комплект%';

-- 3.1.9 Выбрать продавцов - мужчин.
SELECT * FROM SELLERS WHERE FULL_NAME LIKE '%вич%' OR FULL_NAME LIKE '%ныч%';

-- 3.1.10 Вывести список продавцов, закреплённых за офисами. Вывести список продавцов, которым не установлен план.
SELECT * FROM SELLERS WHERE PLAN IS NULL;
SELECT * FROM SELLERS WHERE OFFICE_CODE IS NOT NULL;

-- 3.1.11 Найти всех продавцов, которые работают в Воткинске и Сарапуле, и перевыполнили план.
SELECT * FROM SELLERS;
SELECT * FROM OFFICES;
SELECT * FROM SELLERS WHERE OFFICE_CODE IN (SELECT CODE FROM OFFICES WHERE CITY IN ('Воткинск', 'Сарапул')) AND RESULT>PLAN;

-- 3.1.12 Выбрать продавцов, имеющих имя Иван и Сергей.
SELECT * FROM SELLERS;
SELECT FULL_NAME FROM SELLERS WHERE FULL_NAME LIKE '% Иван %' OR FULL_NAME LIKE '% Сергей %';

-- 3.2.1 Вывести список офисов, отсортированный по разности между фактическим и плановым объёмами продаж.
SELECT * FROM OFFICES;
SELECT CODE, RESULT-PLAN FROM OFFICES ORDER BY RESULT-PLAN NULLS FIRST;

-- 3.2.2 Вывести список товаров, отсортированный по убыванию кода изготовителя, в рамках одного изготовителя отсортировать товары в алфавитном порядке.
SELECT * FROM PRODUCTS;
SELECT MANUFACTURER, DESCRIPTION FROM PRODUCTS ORDER BY MANUFACTURER DESC, DESCRIPTION;

-- 3.2.3 Из отсортированного по столбцу "FULL_NAME" списка продавцов получить первые 5 строк.
SELECT FULL_NAME FROM (SELECT * FROM SELLERS ORDER BY FULL_NAME) WHERE ROWNUM<6;
SELECT * FROM SELLERS;
