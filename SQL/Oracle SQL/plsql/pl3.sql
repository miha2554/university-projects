/* 3.1.1. Для клиента (идентификатор известен) определить, относится ли он к числу "Уважаемых". 
Критерий "уважаемости" определяется суммой заказов. 
Если она более 10000, то клиент считается таковым. 
На экране должно появиться: 'клиент является "уважаемым"' или 'клиент не является "уважаемым"' или 'заказов не было'.*/
declare
s number;
id number;
begin
id:=2106;
select sum(total_sum) into s from orders 
where client_id=id;
if s>10000 then dbms_output.put_line('Клиент является "уважаемым"');
elsif s<=10000 then dbms_output.put_line('Клиент не является "уважаемым"');
else dbms_output.put_line('Заказов не было');
end if;
end;
/

-- 3.1.2 Используя цикл и операторы ветвления заполнить таблицу PL/SQL суммами продаж каждого дня месяца. 
-- Вывести содержимое таблицы на экран.
select * from orders; -- для выбора месяца и проверки

create table orders_m(order_date date, sum number);

declare
d date;
s number;
begin
s:=0;
d:=to_date('01.01.10','DD.MM.YYYY');
loop
select nvl(sum(total_sum),0) into s from orders
where to_char(order_date)=to_char(d);
insert into orders_m values (d,s);
d:=d+1;
s:=0;
exit when (d=to_date('01.02.10','DD.MM.YYYY'));
end loop;
end;
/
select * from orders_m;
drop table orders_m;

-- 3.1.3. Воспользуйтесь циклом и оператором SELECT, возвращающим одну запись, 
-- для вывода на экран SQL*PLUS всех наименований товаров таблицы PRODUCTS.
declare
cursor d is 
select description from products; 
begin
for d_count in d loop -- явный курсор неявно открыт, тело выполняется, пока есть записи в активном наборе (взято из лекции 5)
dbms_output.put_line(d_count.description);
end loop; 
end;
/