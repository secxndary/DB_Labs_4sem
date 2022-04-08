-- Найти сотрудников, у которых нет заказов стоимостью выше 5000, и отсортировать по городу, в котором находится офис

select s.EMPL_NUM [Сотрудник]		--, o.AMOUNT [Цена], offi.OFFICE [Офис], offi.CITY [Город]
from SALESREPS s
inner join ORDERS o
on o.REP = s.EMPL_NUM
inner join OFFICES offi
on s.REP_OFFICE = offi.OFFICE
where o.AMOUNT < 5000
group by s.EMPL_NUM, offi.CITY		--, o.AMOUNT, offi.OFFICE
order by offi.CITY
