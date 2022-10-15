/*
Компания занимается производством. Для учета продажи у них есть своя программа. В программе есть таблицы:
•	таблица “CLIENT” содержит информацию о клиенте: 
o	поля CLIENT_ID - внешний ключ;
o	NAME - наименование;
o	ADRESS - адрес;
o	PHONE - телефон.

•	таблица “DOGOVOR” содержит информацию о договоре, поля:
o	DOGOVOR_ID - внешний ключ;
o	DOG_NUMBER - номер;
o	DATE - дата;
o	CLIENT_ID - идентификатор клиента.

•	таблица “ORDERS” содержит информацию о заказах по договору, поля:
o	ORDER_ID - внешний ключ;
o	DATE - дата заказа;
o	ORDER_TERM - срок выполнения заказа;
o	ORDER_OBJ - содержание заказа;
o	DOGOVOR_ID - идентификатор договора.

Необходимо создать запрос, который выведет следующие поля:
Дата заказа, Срок выполнения заказа, Содержание последнего заказа клиента ООО “Ирбис”, Наименование клиента, Дату договора и Номер договора (дата и номер должны выводиться в формате: «Договор №1 от 01.01.2021 г.»).
*/
CREATE TABLE [CLIENT] (
    CLIENT_ID int PRIMARY KEY CLUSTERED IDENTITY (1, 1),
    NAME nvarchar(100),
    ADRESS nvarchar(100),
    PHONE nvarchar(100)
);

CREATE TABLE [DOGOVOR] (
    DOGOVOR_ID int PRIMARY KEY CLUSTERED IDENTITY (1, 1),
    DOG_NUMBER int,
    DATE date,
    CLIENT_ID int
);

CREATE TABLE [ORDERS] (
    ORDER_ID int PRIMARY KEY CLUSTERED IDENTITY (1, 1),
    DATE date,
    ORDER_TERM date,
    ORDER_OBJ nvarchar(100),
    DOGOVOR_ID int
);

ALTER TABLE [ORDERS] WITH CHECK ADD CONSTRAINT [ORDERS_fk0] FOREIGN KEY ([DOGOVOR_ID]) REFERENCES [DOGOVOR]([DOGOVOR_ID]) ON UPDATE CASCADE;
ALTER TABLE [ORDERS] CHECK CONSTRAINT [ORDERS_fk0];

ALTER TABLE [DOGOVOR] WITH CHECK ADD CONSTRAINT [CLIENT_fk0] FOREIGN KEY ([CLIENT_ID]) REFERENCES [CLIENT]([CLIENT_ID]) ON UPDATE CASCADE;
ALTER TABLE [DOGOVOR] CHECK CONSTRAINT [CLIENT_fk0];

INSERT INTO [CLIENT] (NAME, ADRESS, PHONE) VALUES 
    ('ООО "Ирбис"', 'Москва, ул. Пушкина 8б', '+7777999555'),
    ('ООО "ААА"', 'Иркутск, ул. Лермонтова 18', '+88005553535'),
    ('ООО "ОАОАО"', 'Самара, ул. Банковая 1', '+749555599933')

INSERT INTO [DOGOVOR] (DOG_NUMBER, DATE, CLIENT_ID) VALUES 
    (8800, '2015-01-01', '1'),
    (8801, '2017-01-01', '2')

INSERT INTO [ORDERS] (DATE, ORDER_TERM, ORDER_OBJ, DOGOVOR_ID) VALUES 
    ('2020-10-05', '2021-10-05', 'Тонна угля', '1'),
    ('2020-11-01', '2021-11-10', 'Скрепки, бумага и ручки', '1'),
    ('2020-12-01', '2022-10-05', '800 тонн урана', '1')

SELECT TOP 1 
    O.DATE as 'Дата заказа', 
    O.ORDER_TERM as 'Срок выполнения заказа', 
    O.ORDER_OBJ as 'Содержание заказа', 
    C.NAME as 'Наименование клиента', 
    CONCAT('Договор №', D.DOG_NUMBER, ' от ', FORMAT (D.DATE, 'dd.MM.yyyy г.') ) as 'Данные договора'
        FROM ORDERS O 
        JOIN DOGOVOR D ON O.DOGOVOR_ID = D.DOGOVOR_ID
        JOIN CLIENT C ON C.CLIENT_ID = D.CLIENT_ID
        WHERE C.NAME = 'ООО "Ирбис"'
        ORDER BY O.DATE;
