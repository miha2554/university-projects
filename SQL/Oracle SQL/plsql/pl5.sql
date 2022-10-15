-- 5.1.1. (согласование значени€ пол€ RESULT и суммы продаж; процедура, выполн€ющую автоматическую корректировку денормализованной суммы)

create or replace procedure proc is
cursor nesogl is
select id, result from sellers where result!=(select sum(total_sum) from orders where seller_id=sellers.id);
r number;    
begin
for k in nesogl loop
select sum(total_sum) into r from orders where seller_id=k.id;
update sellers set result=r where id=k.id;
end loop;
end;
/

declare
cursor nesogl is
select id, result from sellers where result!=(select sum(total_sum) from orders where seller_id=sellers.id);
r number;    
begin
for k in nesogl loop
select sum(total_sum) into r from orders where seller_id=k.id;
update sellers set result=r where id=k.id;
end loop;
end;
/

-- 5.1.2. (если на товар с ценой более 1000 рублей не было заказов, уменьшить его цену на 5%)
-- (в таблице PRICELIST_LINES к их названию добавить '*')
desc pricelist_lines;
alter table pricelist_lines modify product_code varchar2(9 char);
insert into pricelist_lines (product_code, product_name, product_price) 
select manufacturer||'_'||code, description, price from products;

declare
cursor prods is
select manufacturer, code, price from products
where price>1000;
n number;
begin
for p in prods loop
select count(*) into n from orders where product_manufacturer=p.manufacturer and product_code=p.code;
if n=0 then
update products
set price=0.95*price where manufacturer=p.manufacturer and code=p.code;
update pricelist_lines
set product_price=0.95*product_price, product_name=product_name||'*' where product_code=p.manufacturer||'_'||p.code;
end if;
end loop;
end;
/
select * from pricelist_lines;
rollback;