-- ѕодсчитать количество проданных товаров дл€ каждого сотрудника и найти тех, кто продал больше 10 штук товаров

select count(*)  ол_во, REP
from ORDERS o
where o.AMOUNT in (select oo.AMOUNT from ORDERS oo where o.REP = oo.REP )
group by REP