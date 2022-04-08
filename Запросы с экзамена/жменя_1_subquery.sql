-- ����� ������, ������� �� ���������� ���������� ������ ���������� �������

select PRODUCT_ID [ID ������]			-- ������� ������
from PRODUCTS p
where  not exists   (select * from ORDERS o					-- ������� �� ����������
					where o.PRODUCT = p.PRODUCT_ID
					and o.PRODUCT in
						(select	o.PRODUCT from ORDERS o			-- �� ���������� ����������
						inner join SALESREPS s
						on s.EMPL_NUM = o.REP
						and s.REP_OFFICE in 
							(select REP_OFFICE from SALESREPS s		-- ���������� ���������� �������
							inner join OFFICES o
							on s.REP_OFFICE = o.OFFICE and o.REGION like ('Eastern'))))