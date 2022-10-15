-- 1.1.1 Cкопировать пример, отладить. 
DECLARE 
V_FIO VARCHAR2(100); 
BEGIN 
SELECT FULL_NAME 
INTO V_FIO 
FROM SELLERS 
WHERE ID=106; 
DBMS_OUTPUT.PUT_LINE('Фамилия продавца: '||V_FIO); 
EXCEPTION 
WHEN OTHERS THEN 
DBMS_OUTPUT.PUT_LINE('Произошла ошибка!'); 
END; 
/

-- 1.1.2 Создать функцию, возвращающую строку "Я работаю!". Вызвать эту функцию из анонимного блока, используя пакет dbms_output, результат показать на экране.
CREATE OR REPLACE FUNCTION OUT_STR RETURN VARCHAR2 
IS STR VARCHAR2(10 CHAR); 
BEGIN 
STR:='Я работаю!'; 
RETURN STR;
END; 
/

DECLARE 
S VARCHAR2(10 CHAR); 
BEGIN 
DBMS_OUTPUT.PUT_LINE(OUT_STR()); 
END; 
/

-- 1.1.3 Возникнет ли ошибка, если переменной, объявленной на основе столбцы NOT NULL, присвоить неопределенное значение NULL? Подтвердите ответ экспериментом.
DECLARE 
A SELLERS.ID%TYPE:=NULL; 
BEGIN 
IF A IS NULL THEN 
DBMS_OUTPUT.PUT_LINE('ПРИСВОИЛОСЬ NULL'); 
ELSE 
DBMS_OUTPUT.PUT_LINE('NOT NULL'); 
END IF; 
END; 
/

-- 1.1.6 Используя связанную переменную, передать в анонимный блок число. Увеличить его на 2 и вывести на экран.
VARIABLE V NUMBER; 
BEGIN 
:V:=2; 
DBMS_OUTPUT.PUT_LINE(:V); 
:V:=:V+2; 
DBMS_OUTPUT.PUT_LINE(:V);
END; 
/ 
PRINT V;
