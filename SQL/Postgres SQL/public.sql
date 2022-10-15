---SQL-запрос, который возвращает объем продаж в количественном выражении 
---в разрезе сотрудников за период с 01.10.2013 по 07.10.2013
---Данные отсортировать по фамилии и имени сотрудника.
SELECT Sellers.surname "ФАМИЛИЯ", Sellers.name "ИМЯ", SUM (Sales.quantity) "Кол-во"
FROM Sales, Sellers
   WHERE Sellers.ID = Sales.ID AND Sales.date
 BETWEEN TO_DATE('01.10.2013','DD.MM.YYYY') AND TO_DATE('07.10.2013','DD.MM.YYYY')
      GROUP BY Sellers.name, Sellers.Surname;


--На основании созданного в первом задании запроса написать SQL-запрос, 
--который возвращает процент объема продаж в разрезе сотрудников
--и продукции за период с 01.10.2013 по 07.10.2013:
--Процент продаж сотрудником данного вида продукции
--(продажи сотрудника данной продукции/общее число продаж данной продукции).
--В выборку должна попадать продукция, поступившая за период с 07.09.2013 по 07.10.2013.
--Данные отсортировать по наименованию продукции, фамилии и имени сотрудника.
select
 r.Name, r.Surname, p.Name, (100. * sum(s.Quantity)) / sum(sum(s.Quantity)) over (partition by p.Name) "Volume %"
from
 Sales s join
 Sellers r on r.ID = s.IDSeller join
 Products p on p.ID = s.IDProduct join
 Arrivals ar on P.ID = ar.IDProduct
where
 (s.Date between TO_DATE('01.10.2013','DD.MM.YYYY') AND TO_DATE('07.10.2013','DD.MM.YYYY'))
and
 (ar.Date between TO_DATE('07.09.2013','DD.MM.YYYY') AND TO_DATE('07.10.2013','DD.MM.YYYY'))
group by
 r.Name, r.Surname, p.Name;