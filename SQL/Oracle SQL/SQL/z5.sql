-- 5.1.1 Äîáàâèòü íîâûé òîâàð â òàáëèöó PRODUCTS. Ïîïûòàòüñÿ âñòàâèòü òîâàð ñ ñóùåñòâóþùèì ïåðâè÷íûì êëþ÷îì.
SELECT * FROM PRODUCTS;
INSERT INTO PRODUCTS VALUES ('IZI','PT04','Ïîäîêîííèê øèðîêèé',2000,300);
INSERT INTO PRODUCTS VALUES ('IZI','PT04','ÀÀÀÀ',2000,300);

-- 5.1.3 Ïîïûòàòüñÿ âñòàâèòü íîâóþ çàïèñü, â êîòîðîé íàðóøåí òèï ñòîëáöà, íàðóøåíà îáÿçàòåëüíîñòü ñòîëáöà.
DESC SELLERS;
INSERT INTO SELLERS VALUES (NULL,'Èâàíîâ À.Â.',20,'Ïðîäàâåö','12.05.11',20000,NULL,NULL,'V01');ф
INSERT INTO SELLERS VALUES (55,'Èâàíîâ À.Â.',20,'Ïðîäàâåö','ÖÀÖ',20000,NULL,NULL,'V01');
SELECT * FROM SELLERS;

-- 5.2.1 Èçó÷èòü ñòðóêòóðó òàáëèöû PRICELIST_LINES è çàïîëíèòü å¸ çàïèñÿìè òàáëèöû PRODUCTS, èñêëþ÷àÿ çàïèñè, îòíîñÿùèåñÿ ê ïðîèçâîäèòåëþ "ZOM".
DESC PRICELIST_LINES;
SELECT * FROM PRODUCTS WHERE MANUFACTURER='ZOM';
INSERT INTO PRICELIST_LINES (PRODUCT_CODE,PRODUCT_NAME,PRODUCT_PRICE) SELECT MANUFACTURER||'_'||CODE, DESCRIPTION, PRICE FROM PRODUCTS WHERE MANUFACTURER!='ZOM'; 
SELECT * FROM PRICELIST_LINES;

-- 5.3.1 Èçìåíèòü íåâåðíóþ ôàìèëèþ ïðîäàâöà ñ íîìåðîì 107.
UPDATE SELLERS SET FULL_NAME='Ñèìîíîâà Êàòÿ' WHERE ID=107;
SELECT * FROM SELLERS;

-- 5.3.2 Óâåëè÷èòü öåíó âñåõ òîâàðîâ â òàáëèöå PRICELIST_LINES íà 15%.
UPDATE PRICELIST_LINES SET PRODUCT_PRICE=1.15*PRODUCT_PRICE;
SELECT * FROM PRICELIST_LINES;

-- 5.3.3 Ïåðåâåñòè âñåõ êëèåíòîâ, îáñëóæèâàåìûõ ïðîäàâöàìè ñ èäåíòèôèêàòîðàìè 105, 106, 107 ê ïðîäàâöó ñ èäåíòèôèêàòîðîì 102.
UPDATE CLIENTS SET SELLER_ID=102 WHERE SELLER_ID IN (105,106,107);
SELECT * FROM CLIENTS;

-- 5.4.1 Óäàëèòü ñòðîêó òàáëèöû PRICELIST_LINES ñ èäåíòèôèêàòîðîì "ZSM_PS03"
DELETE FROM PRICELIST_LINES WHERE PRODUCT_CODE = 'ZSM_PS03';

-- 5.4.3 Óäàëèòü âñå çàêàçû êîìïàíèè, èäåíòèôèêàòîð êîòîðîé 2126.
DELETE FROM ORDERS WHERE CLIENT_ID=2126;

-- 5.4.4 Óäàëèòü âñå çàêàçû, ñäåëàííûå äî 15 íîÿáðÿ 2002 ãîäà.
DELETE FROM ORDERS WHERE 
ORDER_DATE < TO_DATE('15.11.2002', 'DD.MM.YYYY');
SELECT * FROM ORDERS;

-- 5.4.5 Óäàëèòü äàííûå î âñåõ êëèåíòàõ, îáñëóæèâàåìûõ ïðîäàâöàìè, èäåíòèôèêàòîðû êîòîðûõ 105, 109 è 101.
DELETE FROM CLIENTS WHERE SELLER_ID IN (101,105,109);
ROLLBACK;
SELECT * FROM CLIENTS;

-- 5.5.6 Ïðîâåñòè áèçíåñ-òðàíçàêöèþ: ââîä íîâîãî çàêàçà. Ââîä çàêàçà ñîñòîèò èç äîáàâëåíèÿ íîâîé ñòðîêè â òàáëèöå ORDERS, èçìåíåíèÿ îáúåìà ïðîäàæ ïðîäàâöà, îôîðìèâøåãî çàêàç è îôèñà, ê êîòîðîìó ïðèêðåïëåí ïðîäàâåö.
INSERT INTO ORDERS (REF_NUMBER,ORDER_DATE,AMOUNT,TOTAL_SUM,CLIENT_ID,PRODUCT_MANUFACTURER,PRODUCT_CODE,SELLER_ID) VALUES (444444,'21.10.16',1,250,2111,'ZSM','PS01',106);
UPDATE SELLERS SET RESULT=RESULT+250 WHERE ID=106;
UPDATE OFFICES SET RESULT=RESULT+250 WHERE CODE = (SELECT OFFICE_CODE FROM SELLERS WHERE ID=106);
COMMIT; -- ôèêñàöèÿ âíåñåííûõ èçìåíåíèé
--ROLLBACK; --îòìåíà òðàíçàêöèè
--select * from orders;
