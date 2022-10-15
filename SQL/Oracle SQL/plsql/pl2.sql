/* 2.1.1. В среде SQL*PLUS объявите связанную строковую переменную, создайте анонимный блок PL/SQL, 
в котором заполните эту переменную текущей датой на 0 часов, 0 минут, 0 секунд. Выведите переменную в хост-среде.*/
variable t varchar2(80 char);
begin
:t:=to_char(trunc(sysdate),'DD.MM.YYYY HH24:MI:SS'); -- параметр format функции trunc опущен - усечены часы, минуты, секунды
end;
/
print t;

-- 2.1.2. Что произойдет, если в блоке PL/SQL встретится строка "В_СУММА := SUM(ЦЕНА)"?
declare
t number;
s number;
begin
select sum(total_sum) into t from orders; 
s:=sum(total_sum); -- функция «SUM» может использоваться только внутри оператора SQL, ругается на 6 строку
dbms_output.put_line(s);
end;
/

-- 2.1.3. Получить в блоке PL/SQL для последнего заказа название товара и ФИО продавца его оформившего.
declare
descr varchar2(70 char);
name varchar2(70 char);
begin
select products.description, sellers.full_name into descr, name
from products inner join orders
on orders.product_code=products.code and orders.product_manufacturer=products.manufacturer
inner join sellers
on orders.seller_id=sellers.id
where orders.ref_number=(select ref_number from (select order_date, ref_number from orders order by order_date desc) where rownum=1);
dbms_output.put_line(name||' оформил заказ: '||descr);
end;
/

-- 2.1.4. Определить ФИО руководителя для указанного продавца.
declare
sel_id number;
boss_id number;
name varchar2(70 char);
begin
sel_id:=105;
select seller_id into boss_id from sellers where id=sel_id;
if boss_id is null then dbms_output.put_line('У данного продавца нет руководителя.');
else
select full_name into name from sellers where id=boss_id;
dbms_output.put_line(name);
end if;
end;
/

-- 2.1.8. Используя атрибуты неявного курсора сообщить в хост-среду о результатах удаления заказов указанного продавца.
variable count varchar2(20);
begin
delete from orders where seller_id=103;
:count:=SQL%ROWCOUNT||' строк удалено.';
end;
/
print count;
rollback;