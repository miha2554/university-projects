-- 2.1.1 Изучить структуры таблиц PRODUCTS, SELLERS.
DESC PRODUCTS;
DESC SELLERS;

-- 2.1.2 Вывести все строки таблицы SELLERS. Получить все строки таблицы PRODUCTS, расположив колонки в обратном порядке.
SELECT LIMIT, PRICE, DESCRIPTION, CODE, MANUFACTURER FROM PRODUCTS;

-- 2.1.3 Получить список продавцов с указанием возраста.
SELECT FULL_NAME, AGE FROM SELLERS;

-- 2.1.4 Выдать список товаров, указывая цену в рублях и в У.Е. (полагаем, что в таблице указана цена товара в У.Е). Назвать колонки "ТОВАР" "ЦЕНА (У.Е)" "ЦЕНА (РУБ.)".
SELECT DESCRIPTION ТОВАР, PRICE AS "ЦЕНА (У.Е.)", PRICE*57.48 AS "ЦЕНА (РУБ.)" FROM PRODUCTS;

-- 2.1.5 Выдать для каждого офиса список городов, регионов и сумм, на которые был перевыполнен/недовыполнен план.
SELECT CITY, REGION,
CASE 
WHEN RESULT<PLAN THEN 'план не выполнен на '||(PLAN-RESULT) 
WHEN RESULT>PLAN THEN 'план перевыполнен на '||(RESULT-PLAN)
ELSE 'данных недостаточно'
END
FROM OFFICES;

-- 2.1.6 Что получится, если увеличить плановый объём продаж для каждого продавца на 3% от его фактического объёма продаж. ФИО служащего указать совместно с его должностью.
SELECT FULL_NAME||', '||POSITION, PLAN, PLAN+0.03*RESULT AS "РЕЗУЛЬТАТ" FROM SELLERS;

-- 2.1.7 Вывести все данные из таблицы PRODUCTS, разделив их запятыми. Столбец назвать "Таблица товары".
SELECT MANUFACTURER ||', '|| CODE ||', '|| DESCRIPTION ||', '|| PRICE ||', '|| LIMIT "ТАБЛИЦА ТОВАРЫ" FROM PRODUCTS;

-- 2.2.1 Получить нумерованный список всех продавцов с указанием их должности и даты приема на работу.
SELECT ROWNUM AS "ПОРЯДКОВЫЙ НОМЕР", FULL_NAME, POSITION, EMPLOYMENT_DATE FROM SELLERS;

-- 2.2.2 Посчитать прибыль в процентах от продажи товара, если его себестоимость составляет 10.2 рубля, а продажная цена - 15.25 рублей.
SELECT ROUND (((15.25-10.2)/10.2)*100,3) FROM DUAL;

-- 2.2.3 Выбрать код изготовителя товара, исключить повторяющиеся записи.
SELECT DISTINCT MANUFACTURER FROM PRODUCTS;
