/*
В базе есть две таблицы

 "REFERENCE" - список справочников системы:

    ref_id	            descr
1q2w3e4r-004	Коэффициенты индексации
1q2w3e4r-005	Коэффициенты льгот


"REFERENCE_VALUE" – таблица, содержащая значения справочников REFERENCE.
Таблица "REFERENCE_VALUE" состоит из следующих колонок:
•	REF_ID - идентификатор справочника,
•	DESCR - описание,
•	VALUE - значение,
•	REF_VALUE_ID - идентификатор записи.

Добавьте значения из таблицы, в справочник «Коэффициенты льгот»
Пенсионеры	        0,3
Многодетные семьи	0,2

  Для каждой записи должен присваиваться уникальный идентификатор.
*/
CREATE TABLE [REFERENCE] (
    ref_id int PRIMARY KEY CLUSTERED IDENTITY (1, 1),
    descr nvarchar(255) NOT NULL,
);

CREATE TABLE [REFERENCE_VALUE] (
    REF_VALUE_ID int PRIMARY KEY CLUSTERED IDENTITY (1, 1),
    REF_ID int NOT NULL,
    DESCR nvarchar(255) NOT NULL,
    VALUE decimal(8,8) NOT NULL,
);

ALTER TABLE [REFERENCE_VALUE] WITH CHECK ADD CONSTRAINT [REFERENCE_VALUE_fk0] FOREIGN KEY ([REF_ID]) REFERENCES [REFERENCE]([ref_id]) ON UPDATE CASCADE;
ALTER TABLE [REFERENCE_VALUE] CHECK CONSTRAINT [REFERENCE_VALUE_fk0];

INSERT INTO [REFERENCE] (descr) VALUES 
    ('Коэффициенты индексации'), ('Коэффициенты льгот');

INSERT INTO [REFERENCE_VALUE] (DESCR, "VALUE", REF_ID) 
    SELECT 'Пенсионеры', '0.3', ref_id FROM dbo.REFERENCE 
    WHERE descr = 'Коэффициенты льгот';

INSERT INTO [REFERENCE_VALUE] (DESCR, "VALUE", REF_ID)
    SELECT 'Многодетные семьи', '0.2', ref_id FROM dbo.REFERENCE 
    WHERE descr = 'Коэффициенты льгот';
