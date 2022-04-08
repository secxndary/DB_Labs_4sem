-- Найти офисы, котоыре выполняли заказы клиентам с кредитным лимитом свыше 20000

select offi.OFFICE [Офис]		--, c.CREDIT_LIMIT, c.CUST_REP
from OFFICES offi
inner join SALESREPS s
on s.REP_OFFICE = offi.OFFICE
inner join ORDERS o
on o.REP = s.EMPL_NUM
inner join CUSTOMERS c
on c.CUST_REP = s.EMPL_NUM
where c.CREDIT_LIMIT > 20000
group by offi.OFFICE
--group by offi.OFFICE, c.CREDIT_LIMIT, c.CUST_REP