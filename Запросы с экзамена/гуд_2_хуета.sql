-- ����� ����� ������� �����, ��������� ������ ����������� � ������������� �� �������� ���� ������

select o.PRODUCT [�����], o.AMOUNT[����], o.REP [���������]
from ORDERS o
where o.REP = (select top(1) s.REP from ORDERS s 
where s.REP = o.REP
order by s.AMOUNT);