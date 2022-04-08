-- ���������� ���-�� �������, ���������� ������������ ������� �����, � ������������� �� �������� ����� ���� �������

select count(*) ���_��, sum(ord.AMOUNT) [����� �����], sales.REP_OFFICE [����]
from ORDERS ord
inner join SALESREPS sales
on sales.EMPL_NUM = ord.REP
group by sales.REP_OFFICE
order by sum(ord.AMOUNT) desc