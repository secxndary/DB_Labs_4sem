-- Найти самый дорогой товар, проданный каждым сотрудником и отсортировать по значению цены товара

select REP [Продавец], PRODUCT [Продукт], AMOUNT [Стоимость]
from ORDERS o
where o.AMOUNT = 
(select top(1) oo.AMOUNT from ORDERS oo
where oo.REP = o.REP
order by AMOUNT desc)
order by AMOUNT desc