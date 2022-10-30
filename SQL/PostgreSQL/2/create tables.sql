/*
1.	Sellers – продавцы продукции:
●	ID – идентификатор продавца;
●	Surname – фамилия продавца;
●	Name – имя продавца.
2.	Products – продукция:
●	ID – идентификатор продукта;
●	Name – наименование продукта;
●	Price – цена за единицу продукта.
3.	Sales – продажи продукции:
●	ID – идентификатор;
●	IDSel – поле ID из таблицы Sellers;
●	IDProd – поле ID из таблицы Products;
●	Date – дата продажи продукции;
●	Quantity – объем проданной продукции.
4.	Arrivals – поступление продукции:
●	ID – идентификатор;
●	IDProd – поле ID из таблицы Products;
●	Date – дата поступления продукции;
●	Quantity – объем поступившей продукции
*/
DROP TABLE IF EXISTS Sellers CASCADE;
CREATE TABLE Sellers(
    ID SERIAL PRIMARY KEY,
    Surname VARCHAR(50),
    name VARCHAR(50)
);

DROP TABLE IF EXISTS Products CASCADE;
CREATE TABLE Products(
    ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Price FLOAT
);

DROP TABLE IF EXISTS Sales CASCADE;
CREATE TABLE Sales(
    ID SERIAL PRIMARY KEY,
    IDSeller INT,
    IDProduct INT,
    Date DATE,
    Quantity FLOAT,
    FOREIGN KEY (IDSeller) REFERENCES Sellers ON DELETE CASCADE,
    FOREIGN KEY (IDProduct) REFERENCES Products ON DELETE CASCADE
);

DROP TABLE IF EXISTS Arrivals;
CREATE TABLE Arrivals(
    ID SERIAL PRIMARY KEY,
    IDProduct INT,
    DATE DATE,
    Quantity FLOAT,
    FOREIGN KEY (IDProduct) REFERENCES Products ON DELETE CASCADE,
    FOREIGN KEY (IDProduct) REFERENCES Sales ON DELETE CASCADE
);
INSERT INTO Sellers (Surname, Name)
VALUES ('Дядя','Фёдор'),
       ('Кот','Матроскин'),
       ('Почтальон','Печкин'),
       ('Корова','Гаврюша'),
       ('Птенчик','Галчонок'),
       ('Пёс','Шарик');
INSERT INTO Products (Name, Price)
VALUES ('Молоко', 20.0),
       ('Пирожок', 25.0),
       ('Велосипед', 60.0),
       ('Конверт', 10.0);
INSERT INTO Sales (IDSeller,IDProduct,Date, Quantity)
VALUES (1, 1, '1998-12-22', 75.0),
       (2, 2, '2000-06-06', 95.0),
       (3, 3, '2013-10-01', 15.0),
       (4, 4, '2013-10-05', 170.0),
       (5, 1, '2013-10-07', 55.0),
       (6, 2, '2022-07-02', 90.0);
INSERT INTO Arrivals (IDProduct, Date, Quantity)
VALUES (1, '1998-12-12', 123.0),
       (2, '2000-06-02', 223.0),
       (3, '2013-09-03', 73.0),
       (4, '2013-10-01', 214.0),
       (1, '2013-10-03', 326.0),
       (2, '2022-07-01', 512.0);