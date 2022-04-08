-- Ќайти товары, которые не заказывали сотрудники офисов ¬осточного региона

select PRODUCT_ID [ID товара]			-- ¬ыбрать товары
from PRODUCTS p
where  not exists   (select * from ORDERS o					-- которые не заказывали
					where o.PRODUCT = p.PRODUCT_ID
					and o.PRODUCT in
						(select	o.PRODUCT from ORDERS o			-- не заказывали сотрудники
						inner join SALESREPS s
						on s.EMPL_NUM = o.REP
						and s.REP_OFFICE in 
							(select REP_OFFICE from SALESREPS s		-- сотрудники ¬осточного региона
							inner join OFFICES o
							on s.REP_OFFICE = o.OFFICE and o.REGION like ('Eastern'))))