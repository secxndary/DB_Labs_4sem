-- ���������� ���-�� �������, ���������� ������������ ������� �����, � ������������� �� �������� ����� ���� �������

select count(*) ���_��, ord.REP [��������], sum(ord.AMOUNT) [����� �����], offi.OFFICE [����]
from ORDERS ord
inner join SALESREPS sales
on sales.EMPL_NUM = ord.REP
inner join OFFICES offi 
on offi.MGR = sales.MANAGER
where ord.REP in (select EMPL_NUM from SALESREPS s inner join OFFICES offi on offi.MGR = s.MANAGER)
--and sales.REP_OFFICE = offi.OFFICE
--and sales.REP_OFFICE in (select OFFICE from OFFICES offi)
group by ord.REP, offi.OFFICE
order by sum(ord.AMOUNT) desc