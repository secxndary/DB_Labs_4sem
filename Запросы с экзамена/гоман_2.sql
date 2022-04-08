-- Найти 2 сотрудников, которые выполнили больше всего заказов в офисах с кредитным лимитом менее 30_000 (800_000)

select top 2 o.REP [Сотрудник], sum(o.QTY) Количество, offi.TARGET [Кредитный лимит]
from ORDERS o
inner join SALESREPS s
on s.EMPL_NUM = o.REP
inner join OFFICES offi
on offi.OFFICE = s.REP_OFFICE
where offi.TARGET < 800000
group by o.REP, offi.TARGET
order by sum(o.QTY) desc