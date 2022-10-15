/*
Составьте sql-запрос для изменения данных в таблице с объектами “OBJECT”.

Для объекта c наименованием (NAME) “Автомобиль LADA”, изменить значения следующих данных: 
•	поле: CUR_COAST, значение: 525,44;
•	поле: HOLDER, значение: ООО «Ирбис»;
•	поле: UPDATE_TIME, значение должно отображать фактическое время выполнения изменений. 

При написании запроса, учесть типы данных столбцов:
•	CUR_COAST - Decimal(18,2);
•	UPDATE_TIME - DateTime;
•	NAME - NVARCHAR(100);
•	HOLDER - NVARCHAR(100).
*/

CREATE TABLE [OBJECT] (
    id int PRIMARY KEY CLUSTERED IDENTITY (1, 1),
    CUR_COAST Decimal(18,2) NOT NULL,
    UPDATE_TIME DateTime NOT NULL,
    NAME nvarchar(100) NOT NULL,
    HOLDER nvarchar(100) NOT NULL
);

INSERT INTO [OBJECT] (CUR_COAST, UPDATE_TIME, NAME, HOLDER) VALUES 
    ('906.344', '2017-05-08 15:35:29.123', 'Автомобиль LADA', 'Юрий М. П.'),
    ('5556.101', '2016-05-08 15:35:29.123', 'Ракета SpaceX Falcon', 'Маск И.'),
    ('106.931', '2017-05-08 15:35:29.123', 'Футбольный мяч', 'Кошкин С. В.');

SELECT [id]
      ,[CUR_COAST]
      ,[UPDATE_TIME]
      ,[NAME]
      ,[HOLDER]
  FROM [OBJECT]

UPDATE [OBJECT]
    SET CUR_COAST = '525.44',
        HOLDER = 'ООО "Ирбис"',
        UPDATE_TIME =  GETDATE()
    WHERE NAME = 'Автомобиль LADA';

SELECT [id]
      ,[CUR_COAST]
      ,[UPDATE_TIME]
      ,[NAME]
      ,[HOLDER]
  FROM [OBJECT] 
