-- ����� ����� ������� �����, ��������� ������ ����������� � ������������� �� �������� ���� ������

select REP [��������], PRODUCT [�������], AMOUNT [���������]
from ORDERS o
where o.AMOUNT = 
(select top(1) oo.AMOUNT from ORDERS oo
where oo.REP = o.REP
order by AMOUNT desc)
order by AMOUNT desc