-- Подсчитать кол-во товаров, заказанных сотрудниками каждого офиса, и отсортировать по убыванию суммы всех заказов

select count(*) Кол_во, sum(ord.AMOUNT) [Общая сумма], sales.REP_OFFICE [Офис]
from ORDERS ord
inner join SALESREPS sales
on sales.EMPL_NUM = ord.REP
group by sales.REP_OFFICE
order by sum(ord.AMOUNT) desc