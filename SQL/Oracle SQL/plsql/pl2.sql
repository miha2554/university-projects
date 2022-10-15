/* 2.1.1. � ����� SQL*PLUS �������� ��������� ��������� ����������, �������� ��������� ���� PL/SQL, 
� ������� ��������� ��� ���������� ������� ����� �� 0 �����, 0 �����, 0 ������. �������� ���������� � ����-�����.*/
variable t varchar2(80 char);
begin
:t:=to_char(trunc(sysdate),'DD.MM.YYYY HH24:MI:SS'); -- �������� format ������� trunc ������ - ������� ����, ������, �������
end;
/
print t;

-- 2.1.2. ��� ����������, ���� � ����� PL/SQL ���������� ������ "�_����� := SUM(����)"?
declare
t number;
s number;
begin
select sum(total_sum) into t from orders; 
s:=sum(total_sum); -- ������� �SUM� ����� �������������� ������ ������ ��������� SQL, �������� �� 6 ������
dbms_output.put_line(s);
end;
/

-- 2.1.3. �������� � ����� PL/SQL ��� ���������� ������ �������� ������ � ��� �������� ��� �����������.
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
dbms_output.put_line(name||' ������� �����: '||descr);
end;
/

-- 2.1.4. ���������� ��� ������������ ��� ���������� ��������.
declare
sel_id number;
boss_id number;
name varchar2(70 char);
begin
sel_id:=105;
select seller_id into boss_id from sellers where id=sel_id;
if boss_id is null then dbms_output.put_line('� ������� �������� ��� ������������.');
else
select full_name into name from sellers where id=boss_id;
dbms_output.put_line(name);
end if;
end;
/

-- 2.1.8. ��������� �������� �������� ������� �������� � ����-����� � ����������� �������� ������� ���������� ��������.
variable count varchar2(20);
begin
delete from orders where seller_id=103;
:count:=SQL%ROWCOUNT||' ����� �������.';
end;
/
print count;
rollback;