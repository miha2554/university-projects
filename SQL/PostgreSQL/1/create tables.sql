
--Список всех пользователей, созданных за последние 5 лет
--SELECT fullName as Пользователи from users where createdAt >= current_date - interval '5 years';

--Топ-5 пользователей, у которых наибольшее количество продаж за последние полгода
--SELECT fullName as Пользователи from users u JOIN sales s on u.userId = s.userId JOIN products p on p.productId = s.productId WHERE p.isActive = 'yes' ORDER BY amount DESC LIMIT 5;

--Название самого продаваемого продукта месяца за последний год

/*SELECT DISTINCT ON(Месяц) date_part('month', saleDate) Месяц, name Продукт
from products p JOIN sales s on p.productId = s.productId 
WHERE ((date_trunc('month', current_date) <= date_trunc('month',s.saleDate) + interval '1 year'))
group by date_part('month', saleDate), name
order by Месяц, Продукт asc;
*/

--Топ-3 департаментов, у которых больше всего продаж с комментарием, содержащим слово “отказ”
--SELECT description from deps d JOIN users u on d.depId = u.depId JOIN sales s on u.userId = s.userId WHERE saleComment LIKE '%отказ%' LIMIT 3;

--Все продажи, созданные в пятницу 13-го
--select * from sales where ((EXTRACT(DOW FROM saleDate) = '5') AND (EXTRACT(DAY FROM saleDate) = '13'));

--Сообщение покупателю “Ваш заказ № %saleId% от %saleDate% на сумму %sum% принят менеджером %fullName%. Ожидаемая дата доставки %сегодня+3 календарных дня%”
--SET lc_monetary TO "ru_RU.UTF-8";
--select ('Ваш заказ №' || saleId ||' от ' || saleDate::date || ' на сумму ' || s.amount * p.price || ' принят менеджером ' || fullName || '. Ожидаемая дата доставки ' || (saleDate + interval '3 day')::date || '.') as Сообщения
--from sales s join users u on s.userId = u.userId join products p on p.productId = s.productId;

--Вывести среднюю сумму продаж по каждому департаменту в разрезе каждого месяца
/*select description, date_part('month', saleDate) Месяц, (sum(amount*price))/(count(amount*price)) Средняя_сумма_продаж
from deps d JOIN users u on d.depId = u.depId JOIN sales s on u.userId = s.userId JOIN products p on s.productId = p.productId
group by date_part('month', saleDate), d.depId
order by 1 asc;
*/

--Максимальную сумму продаж в разрезе дней недели (названия дней недели вывести по-русски)
/*set lc_time = 'ru_RU';
select to_char(saleDate, 'TMDay') as День_недели, (max(amount*price)) Максимальная_сумма_продаж
from users u JOIN sales s on u.userId = s.userId JOIN products p on s.productId = p.productId
group by to_char(saleDate, 'TMDay');
*/


