-- ѕодсчитать среднюю цену товара дл€ каждого сотрудника и найти тех, у кого средн€€ цена товара больше 600 (8000)

select o.REP [—отрудник], round(avg(cast(o.AMOUNT as float(4))), 2) —редн€€_цена
from ORDERS o
group by o.REP
having round(avg(cast(o.AMOUNT as float(4))), 2) > 8000
order by —редн€€_цена desc