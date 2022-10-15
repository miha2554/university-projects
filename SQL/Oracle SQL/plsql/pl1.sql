-- 1.1.1 C���������� ������, ��������. 
DECLARE 
V_FIO VARCHAR2(100); 
BEGIN 
SELECT FULL_NAME 
INTO V_FIO 
FROM SELLERS 
WHERE ID=106; 
DBMS_OUTPUT.PUT_LINE('������� ��������: '||V_FIO); 
EXCEPTION 
WHEN OTHERS THEN 
DBMS_OUTPUT.PUT_LINE('��������� ������!'); 
END; 
/

-- 1.1.2 ������� �������, ������������ ������ "� �������!". ������� ��� ������� �� ���������� �����, ��������� ����� dbms_output, ��������� �������� �� ������.
CREATE OR REPLACE FUNCTION OUT_STR RETURN VARCHAR2 
IS STR VARCHAR2(10 CHAR); 
BEGIN 
STR:='� �������!'; 
RETURN STR;
END; 
/

DECLARE 
S VARCHAR2(10 CHAR); 
BEGIN 
DBMS_OUTPUT.PUT_LINE(OUT_STR()); 
END; 
/

-- 1.1.3 ��������� �� ������, ���� ����������, ����������� �� ������ ������� NOT NULL, ��������� �������������� �������� NULL? ����������� ����� �������������.
DECLARE 
A SELLERS.ID%TYPE:=NULL; 
BEGIN 
IF A IS NULL THEN 
DBMS_OUTPUT.PUT_LINE('����������� NULL'); 
ELSE 
DBMS_OUTPUT.PUT_LINE('NOT NULL'); 
END IF; 
END; 
/

-- 1.1.6 ��������� ��������� ����������, �������� � ��������� ���� �����. ��������� ��� �� 2 � ������� �� �����.
VARIABLE V NUMBER; 
BEGIN 
:V:=2; 
DBMS_OUTPUT.PUT_LINE(:V); 
:V:=:V+2; 
DBMS_OUTPUT.PUT_LINE(:V);
END; 
/ 
PRINT V;
