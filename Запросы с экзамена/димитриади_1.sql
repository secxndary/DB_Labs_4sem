-- ����� �����������, � ������� ��� ������� ���������� ���� 5000, � ������������� �� ������, � ������� ��������� ����

select s.EMPL_NUM [���������]
from SALESREPS s
inner join ORDERS o
on o.REP = s.EMPL_NUM
inner join OFFICES offi
on s.REP_OFFICE = offi.OFFICE
group by s.EMPL_NUM, o.AMOUNT

except

select s.EMPL_NUM
from SALESREPS s
inner join ORDERS o
on o.REP = s.EMPL_NUM
inner join OFFICES offi
on s.REP_OFFICE = offi.OFFICE
where o.AMOUNT > 5000
group by s.EMPL_NUM, o.AMOUNT



--order by s.EMPL_NUM

--except 

--select s.EMPL_NUM [���������]		, o.AMOUNT [����], offi.OFFICE [����], offi.CITY [�����]
--from SALESREPS s
--inner join ORDERS o
--on o.REP = s.EMPL_NUM
--inner join OFFICES offi
--on s.REP_OFFICE = offi.OFFICE 
--where o.AMOUNT > 5000
--where o.AMOUNT not in
--(select AMOUNT from ORDERS where AMOUNT > 5000)
