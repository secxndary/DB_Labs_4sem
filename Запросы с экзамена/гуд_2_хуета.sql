-- Найти самый дорогой товар, проданный каждым сотрудником и отсортировать по значению цены товара

select o.PRODUCT [Товар], o.AMOUNT[Цена], o.REP [Сотрудник]
from ORDERS o
where o.REP = (select top(1) s.REP from ORDERS s 
where s.REP = o.REP
order by s.AMOUNT);