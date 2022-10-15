/* 7.1.1 ������� ������������ ��������� ��������� � �������, � ������� ����������� �����. 
 ����� ���������� ����� ���������� � ���������� ������������? 
 ��� ��� ������������ � ����������� ����� � �������� ��������?
 ��������� �������, ����������� � �������: ��� ��������� �������, ������ ��� ����, � �������� �� ��������. 
 ����� ���������� ����� ��������� ������?
 ��������� ������, �� ������ ������ ������ �������� �� ���� ���������. ��� ����� �������������� ������� �����������.*/
select * from sellers; -- 11 �����
select * from offices; -- 7 �����

select full_name, city
from sellers cross join offices; -- 11*7=77 ����� (�������� ����������� = ������������ ���������)

select full_name, city
from sellers, offices
where sellers.office_code=offices.code; -- 10 �����, ��� �����������, � ���� ����_��� null

select full_name, city
from sellers left outer join offices
on sellers.office_code=offices.code; -- 11 ����� (������ ���� ��������� �� ����� ������, � �� 11 ����)

-- 7.1.4 ������� ������ ��������, ��������������� � ��������� ������ �����������.
select * from clients;
select * from sellers;

select cl.id, cl.name
from sellers se inner join clients cl
on se.id=cl.seller_id where se.full_name='�������� ������ ����������';

-- 7.1.5 ������� ������ ���� ����������, � ��������� �� ������������.
select 
����.full_name ��������,
case
when ���.id is null then '������������ ���' 
else ���.full_name
end ������������
from sellers ���� left outer join sellers ���
on ����.seller_id=���.id;

-- 7.1.8 ������� ������ �� ����� ����� 10000 � ��������� ��� ��������, �������� �������, �������� �� ������.
select * from orders;
select * from sellers;
select * from products;
select * from clients;

select orders.total_sum �����, sellers.full_name ��������, clients.name ������, products.description �����
from orders inner join sellers
on orders.seller_id=sellers.id 
inner join clients 
on orders.client_id=clients.id
inner join products
on orders.product_code=products.code and orders.product_manufacturer=product_manufacturer
where orders.total_sum>10000;

-- 7.1.9 ������� ������, ��������� ������� � ���� ������ ���� ���������, �������� ������� ������� ���������.
select substr(full_name, 1, instr(full_name, ' ')-1) �������, employment_date
from sellers
where employment_date>(select employment_date from sellers where full_name like '% ������ ��������')
order by employment_date, full_name;

-- 7.2.1 ������� ������ ��� ���������, ���� ������� ��������� � �������. 
select full_name 
from sellers inner join offices
on sellers.office_code=offices.code where city='������';

-- 7.2.2 �������� ������ ������������� ������, ������ ������� ����������� ��� "������".
select ref_number, product_manufacturer
from orders inner join clients
on orders.client_id=clients.id where name='��� "������"';

-- 7.2.3 ������� ������ ����������, ����������� ���� �� ���������, ��� � ��������, ������ �������� � ������ �� ��������.
select full_name
from sellers
where seller_id=(select seller_id from sellers where full_name like '��������%') and
full_name not like ('��������%');

-- 7.2.5 ������� ������ �������, ��������� �� ��������� ������, ������� ��������� ����������: 
-- ��������� ������, �������� �������, ���������� �����, ������������ ���������� � ������ ������.
select * from orders;

select orders.total_sum, clients.name, products.description
from orders inner join clients
on orders.client_id=clients.id
inner join products
on orders.product_code=products.code and orders.product_manufacturer=product_manufacturer
where orders.order_date>=(sysdate-7);

-- 7.2.7 ������� ������ ������, �������������� �������� �����������������.
select description 
from products
where (manufacturer, code) in 
(select product_manufacturer, product_code from orders where client_id in
(select id from clients where name like '��%'));