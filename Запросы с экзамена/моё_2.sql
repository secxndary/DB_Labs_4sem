-- Офисы в которых были заказы с 01.01.2007 до 01.01.2008

select OFFICES.OFFICE [Офис]	--ORDERS.ORDER_DATE [Дата заказа]
from OFFICES 
inner join ORDERS 
on OFFICES.MGR = ORDERS.REP
where ORDERS.ORDER_DATE between '2007-01-01' and '2008-01-01'
group by OFFICES.OFFICE