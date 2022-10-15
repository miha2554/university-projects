-- 4.1.2. Создать процедуру, заполняющую тестовую таблицу, состоящую из двух числовых столбцов f1 и f2, случайными данными.

create table test (f1 number, f2 number);

create or replace procedure random_numb is
begin
for i in 1..50 loop
insert into test values (dbms_random.value(1,100), dbms_random.value(1,100));
end loop;
end random_numb;
/
begin
random_numb;
end;
/
select * from test;
drop table test;

/* 4.1.4. Создать пакет, объединяющий процедуры и функции по работе с заказами. 
Определить пакетную переменную "Рабочая дата" указывающую на день, в котором производятся все операции по оформлению заказов. 
В пакет включить функцию, возвращающую рабочую дату, процедуру, модифицирующую рабочую дату. */

create or replace package for_orders is
function return_date return date; -- функция, возвращающая рабочую дату
procedure modify_date (dd in date); -- процедура, модифицирующая рабочую дату
d date; -- рабочая дата
end for_orders;
/

create or replace package body for_orders is
function return_date return date is
begin
return d;
end return_date;
procedure modify_date (dd in date) is
begin
d:=dd;
end modify_date;
end for_orders;
/

begin
for_orders.modify_date(to_date('04.06.15','DD.MM.YY'));
dbms_output.put_line(for_orders.return_date());
end;
/
