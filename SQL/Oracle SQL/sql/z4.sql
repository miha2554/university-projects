-- 4.1.1 Выведите пронумерованный список продавцов и их план на следующий месяц, который должен быть увеличен на 15% по сравнению с текущим. ФИО должно быть в формате "Фамилия И.О.", новый план округлён до целых.
SELECT ROWNUM AS "ПОРЯДКОВЫЙ НОМЕР", FULL_NAME,
  SUBSTR(FULL_NAME,1,INSTR(FULL_NAME,' ')-1)||' '||SUBSTR(FULL_NAME,INSTR(FULL_NAME,' ')+1,1)||'.'||SUBSTR(FULL_NAME,INSTR(FULL_NAME,' ',1,2)+1,1)||'.' AS "ФАМИЛИЯ И.О.", 
  PLAN AS "ТЕКУЩИЙ ПЛАН", 
  ROUND(1.15*PLAN) AS "ПЛАН НА СЛЕД. МЕСЯЦ" 
FROM SELLERS; 

-- 4.1.2 Вывести ведомость на премию. Премия считается как 7% от превышения продавцом его плана. В список должны попасть только те продавцы, которые перевыполнили план. Отсортировать полученный список по офисам к которым продавцы приписаны.
SELECT FULL_NAME, (RESULT-PLAN)*0.07 AS "ПРЕМИЯ", OFFICE_CODE
FROM SELLERS 
WHERE (RESULT > PLAN)
ORDER BY OFFICE_CODE;

-- 4.1.3 Выбрать продавцов, возраст которых - чётное число. Возраст вывести в римских цифрах, отсортировать список по убыванию возраста.
SELECT * FROM SELLERS;
SELECT FULL_NAME, AGE, TO_CHAR(AGE, 'RN') AS "ВОЗРАСТ В РИМСКИХ ЦИФРАХ" FROM SELLERS WHERE MOD(AGE,2)=0 ORDER BY AGE DESC;

-- 4.2.1 Вывести столбец, состоящий из фамилий продавцов и их года приёма на работу. Фамилию и год приёма разделить словом " принят ".
SELECT SUBSTR(FULL_NAME,1,INSTR(FULL_NAME,' ')-1)||' ПРИНЯТ В '||TO_CHAR(EMPLOYMENT_DATE,'YYYY') FROM SELLERS WHERE EMPLOYMENT_DATE IS NOT NULL; -- убрала нелепого безофисного

-- 4.2.2 Вывести список товаров заглавными буквами, прижав название вправо.
SELECT LPAD(UPPER(DESCRIPTION),26,' ') FROM PRODUCTS;

-- 4.3.3 Написать запрос, выводящий заданную дату в формате "05 июня 2000 года".
SELECT TO_CHAR(SYSDATE,'DD')||' '||
DECODE(TO_NUMBER(TO_CHAR(SYSDATE,'MM')),
1,'ЯНВАРЯ',
2,'ФЕВРАЛЯ',
3,'МАРТА',
4,'АПРЕЛЯ',
5,'МАЯ',
6,'ИЮНЯ',
7,'ИЮЛЯ',
8,'АВГУСТА',
9,'СЕНТЯБРЯ',
10,'ОКТЯБРЯ',
11,'НОЯБРЯ',
12,'ДЕКАБРЯ')
||' '||TO_CHAR(SYSDATE,'YYYY')||' ГОДА'
FROM DUAL;

-- 4.3.1 Напишите запрос для вывода текущего времени, назовите столбец "Местное время".
SELECT TO_CHAR(SYSDATE, 'HH24:MI:SS') AS "МЕСТНОЕ ВРЕМЯ" FROM DUAL;

-- 4.3.4 Указать время, которое получится при добавлении 1-го часа к системному времени.
SELECT TO_CHAR(SYSDATE+1/24, 'HH24:MI:SS') FROM DUAL;

-- 4.4 Поэксперементировать с возможностями неявного преобразования типов: добавить к строке число, преобразовать строку в дату, не используя функцию TO_DATE, произвести арифметические операции с символьными строками и т.д.
SELECT '34'+45 FROM DUAL;
SELECT '34'||45 FROM DUAL;
SELECT ADD_MONTHS('01.11.2017',12) FROM DUAL;

-- 4.5.3 Вывести имя текущего пользователя сессии и текущее время.
SELECT USER, TO_CHAR(SYSDATE, 'HH24:MI:SS') FROM DUAL;

-- 4.5.2 Вывести для офисов таблицу из двух колонок: 1 - код и город офиса, 2 - ("план выполнен","план не выполнен") в зависимости о выполнения плана. Что изменится, если у одного из офисов отсутствуют сведения по продажам? В этом случае добавить значение "неизвестно".
SELECT CODE||' '||CITY AS "КОД И ГОРОД", 
CASE
WHEN PLAN>RESULT THEN 'ПЛАН ВЫПОЛНЕН'
WHEN PLAN<RESULT THEN 'ПЛАН НЕ ВЫПОЛНЕН'
ELSE 'НЕИЗВЕСТНО'
END AS "ПЛАН"
FROM OFFICES;

-- 4.6.2 Посчитать средний процент выполнения плана продавцами по офисам и по фирме в целом.
SELECT AVG(RESULT/PLAN*100) FROM SELLERS;

-- 4.6.3 Указать сумму, вырученную за определённый товар, за все товары, за товары, по которым было более N продаж.
SELECT PRODUCT_MANUFACTURER, PRODUCT_CODE, COUNT(*), SUM(TOTAL_SUM)
FROM ORDERS
GROUP BY (PRODUCT_MANUFACTURER, PRODUCT_CODE)
HAVING COUNT(*)>2; -- N=2

-- 4.7.1 Получить в одном запросе максимальный объем продаж среди продавцов, а также минимальный объем продаж. Результат получить в двух вариантах: 1) в одной строке; 2) в одной колонке.
SELECT MIN(RESULT), MAX(RESULT) FROM SELLERS;
SELECT MAX(RESULT) AS РЕЗУЛЬТАТ FROM SELLERS
UNION
SELECT MIN(RESULT) FROM SELLERS;

-- 4.7.2 Вывести все заказы по указанному товару, за исключением последнего (по времени). Воспользоваться оператором MINUS.
SELECT * FROM ORDERS WHERE PRODUCT_MANUFACTURER = 'ZSM' AND PRODUCT_CODE='PS01';
SELECT * FROM ORDERS 
WHERE PRODUCT_MANUFACTURER = 'ZSM' AND PRODUCT_CODE='PS01'
MINUS
SELECT * FROM ORDERS 
WHERE PRODUCT_MANUFACTURER = 'ZSM' AND PRODUCT_CODE='PS01'
AND ORDER_DATE = (SELECT MAX(ORDER_DATE) FROM ORDERS WHERE PRODUCT_MANUFACTURER = 'ZSM' AND PRODUCT_CODE = 'PS01');

-- 4.7.3 В результате запроса получить таблицу из трех строк, в которых содержаться 3 последовательные даты, начиная с текущей.
SELECT TO_CHAR(SYSDATE, 'DD.MM.YYYY') AS "1" FROM DUAL UNION
SELECT TO_CHAR(SYSDATE+1, 'DD.MM.YYYY') AS "2" FROM DUAL UNION
SELECT TO_CHAR(SYSDATE+2, 'DD.MM.YYYY') AS "3" FROM DUAL;

-- 4.7.5 Вывести одним запросом суммы продаж по изготовителям товаров, а так же общую сумму продаж.
SELECT SUM(TOTAL_SUM), PRODUCT_MANUFACTURER FROM ORDERS GROUP BY PRODUCT_MANUFACTURER
UNION
SELECT SUM(TOTAL_SUM), 'ИТОГО' FROM ORDERS;
