-- 6.1.4. �������� ���� PL/SQL, � ������� ��������� ��������� ������� �� ����. 
-- � ����������� ������ �������� ��������� �� ���� ������ � ����-����������. ������� ��������� �� �����.

declare
n number;
err_text varchar2(255);
begin
n:=4;
n:=n/0;
dbms_output.put_line(n);
exception
when ZERO_DIVIDE then
rollback;
err_text:=SQLERRM;
dbms_output.put_line(err_text);
end;
/

-- 6.1.3. ��������� �������� ����������, �������� �������, ������������ ��� ���������� ��� ���������� ������� � ����: 
-- "�� ����", "����", "�����".
select * from orders;

create or replace function numb_ord (d date) return varchar2 is
n number;
no_orders exception;
one_order exception;
many_orders exception;
begin
select count(*) into n from orders where order_date=d;
if n=0 then raise no_orders; elsif
n=1 then raise one_order; else
raise many_orders; end if;
exception
when no_orders then return '�� ����';
when one_order then return '����';
when many_orders then return '�����';
end numb_ord;
/

begin
dbms_output.put_line(numb_ord(to_date('17.12.11','DD.MM.YY')));
end;
/