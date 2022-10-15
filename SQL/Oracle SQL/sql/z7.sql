/* 7.1.1 Вывести всевозможные сочетания продавцов и городов, в которых расположены офисы. 
 Какое количество строк содержится в декартовом произведении? 
 Как оно соотноситься с количеством строк в исходных таблицах?
 Соедините таблицы, участвующие в запросе: для продавцов указать, только тот офис, к которому он приписан. 
 Какое количество строк возвратил запрос?
 Повторите запрос, но теперь список должен состоять из всех продавцов. Для этого воспользуйтесь внешним соединением.*/
select * from sellers; -- 11 строк
select * from offices; -- 7 строк

select full_name, city
from sellers cross join offices; -- 11*7=77 строк (мощность декартового = произведение мощностей)

select full_name, city
from sellers, offices
where sellers.office_code=offices.code; -- 10 строк, нет безофисного, у него офис_код null

select full_name, city
from sellers left outer join offices
on sellers.office_code=offices.code; -- 11 строк (вывели всех продавцов со своим офисом, а их 11 штук)

-- 7.1.4 Вывести список клиентов, обслуживавшихся у Вахрушева Сергей Степановича.
select * from clients;
select * from sellers;

select cl.id, cl.name
from sellers se inner join clients cl
on se.id=cl.seller_id where se.full_name='Вахрушев Сергей Степанович';

-- 7.1.5 Вывести список ВСЕХ работников, с указанием их руководителя.
select 
подч.full_name работник,
case
when рук.id is null then 'руководителя нет' 
else рук.full_name
end руководитель
from sellers подч left outer join sellers рук
on подч.seller_id=рук.id;

-- 7.1.8 Вывести заказы на сумму более 10000 с указанием ФИО продавца, названия клиента, сведений по товару.
select * from orders;
select * from sellers;
select * from products;
select * from clients;

select orders.total_sum СУММА, sellers.full_name ПРОДАВЕЦ, clients.name КЛИЕНТ, products.description ТОВАР
from orders inner join sellers
on orders.seller_id=sellers.id 
inner join clients 
on orders.client_id=clients.id
inner join products
on orders.product_code=products.code and orders.product_manufacturer=product_manufacturer
where orders.total_sum>10000;

-- 7.1.9 Создать запрос, выводящий фамилии и даты приема всех продавцов, принятых позднее Михаила Ивановича.
select substr(full_name, 1, instr(full_name, ' ')-1) ФАМИЛИЯ, employment_date
from sellers
where employment_date>(select employment_date from sellers where full_name like '% Михаил Иванович')
order by employment_date, full_name;

-- 7.2.1 Вывести список ФИО продавцов, офис которых находится в Ижевске. 
select full_name 
from sellers inner join offices
on sellers.office_code=offices.code where city='Ижевск';

-- 7.2.2 Получить список изготовителей товара, товары которых приобретены ООО "Памира".
select ref_number, product_manufacturer
from orders inner join clients
on orders.client_id=clients.id where name='ООО "Памира"';

-- 7.2.3 Вывести список работников, подчиненных тому же менеджеру, что и ЗАЙЧЕНКО, самого ЗАЙЧЕНКО в список не включать.
select full_name
from sellers
where seller_id=(select seller_id from sellers where full_name like 'Зайченко%') and
full_name not like ('Зайченко%');

-- 7.2.5 Вывести список заказов, сделанный за последнюю неделю, включая следующую информацию: 
-- стоимость заказа, название клиента, сделавшего заказ, наименование указанного в заказе товара.
select * from orders;

select orders.total_sum, clients.name, products.description
from orders inner join clients
on orders.client_id=clients.id
inner join products
on orders.product_code=products.code and orders.product_manufacturer=product_manufacturer
where orders.order_date>=(sysdate-7);

-- 7.2.7 Вывести список товара, приобретенного частными предпринимателями.
select description 
from products
where (manufacturer, code) in 
(select product_manufacturer, product_code from orders where client_id in
(select id from clients where name like 'ЧП%'));