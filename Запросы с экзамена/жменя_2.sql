-- Найти 3 товара, которые заказываи меньше всего

select top 3 o.PRODUCT [Товар], sum(o.QTY) [Кол-во заказов]
from ORDERS o
group by o.PRODUCT
order by sum(o.QTY) asc