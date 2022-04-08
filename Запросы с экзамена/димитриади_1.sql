-- ����� �����������, � ������� ��� ������� ���������� ���� 5000, � ������������� �� ������, � ������� ��������� ����

select s.EMPL_NUM [���������]		--, o.AMOUNT [����], offi.OFFICE [����], offi.CITY [�����]
from SALESREPS s
inner join ORDERS o
on o.REP = s.EMPL_NUM
inner join OFFICES offi
on s.REP_OFFICE = offi.OFFICE
where o.AMOUNT < 5000
group by s.EMPL_NUM, offi.CITY		--, o.AMOUNT, offi.OFFICE
order by offi.CITY
