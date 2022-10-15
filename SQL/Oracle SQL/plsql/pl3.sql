/* 3.1.1. ��� ������� (������������� ��������) ����������, ��������� �� �� � ����� "���������". 
�������� "�����������" ������������ ������ �������. 
���� ��� ����� 10000, �� ������ ��������� �������. 
�� ������ ������ ���������: '������ �������� "���������"' ��� '������ �� �������� "���������"' ��� '������� �� ����'.*/
declare
s number;
id number;
begin
id:=2106;
select sum(total_sum) into s from orders 
where client_id=id;
if s>10000 then dbms_output.put_line('������ �������� "���������"');
elsif s<=10000 then dbms_output.put_line('������ �� �������� "���������"');
else dbms_output.put_line('������� �� ����');
end if;
end;
/

-- 3.1.2 ��������� ���� � ��������� ��������� ��������� ������� PL/SQL ������� ������ ������� ��� ������. 
-- ������� ���������� ������� �� �����.
select * from orders; -- ��� ������ ������ � ��������

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

-- 3.1.3. �������������� ������ � ���������� SELECT, ������������ ���� ������, 
-- ��� ������ �� ����� SQL*PLUS ���� ������������ ������� ������� PRODUCTS.
declare
cursor d is 
select description from products; 
begin
for d_count in d loop -- ����� ������ ������ ������, ���� �����������, ���� ���� ������ � �������� ������ (����� �� ������ 5)
dbms_output.put_line(d_count.description);
end loop; 
end;
/