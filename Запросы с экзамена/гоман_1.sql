-- Найти среднюю цену заказа для каждого офиса

select  offi.OFFICE [Офис], round(avg(cast(o.AMOUNT as float(4))), 2) Средняя_цена
from ORDERS o
inner join SALESREPS s
on s.EMPL_NUM = o.REP
inner join OFFICES offi
on offi.OFFICE = s.REP_OFFICE
group by offi.OFFICE