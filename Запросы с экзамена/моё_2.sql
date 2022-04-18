-- ќфисы в которых были заказы с 01.01.2007 до 01.01.2008

select offi.OFFICE [ќфис]
from OFFICES offi
inner join SALESREPS s
on s.REP_OFFICE = offi.OFFICE
inner join ORDERS o
on o.REP = s.EMPL_NUM
where o.ORDER_DATE between '2007-01-01' and '2008-01-01'
group by offi.OFFICE	