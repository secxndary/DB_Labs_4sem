-- ����� ������, ������� �� ���������� ���������� �� ������ ���������� �������

select PRODUCT_ID [ID ������]
from PRODUCTS p
where not exists    (select * from SALESREPS s
					inner join OFFICES f on s.REP_OFFICE = f.OFFICE and f.REGION = 'Eastern'
					inner join ORDERS o on o.REP = s.EMPL_NUM and o.PRODUCT = p.PRODUCT_ID)