-- Ќайти сотрудников, у которых есть заказ стоимостью выше 2000, и отсортировать по убыванию стоимости заказа

select o.REP [—отрудник], o.AMOUNT [÷ена заказа]
from ORDERS o
where o.AMOUNT > 2000
order by o.AMOUNT desc