-- ����� �����������, � ������� ���� ����� ���������� ���� 2000, � ������������� �� �������� ��������� ������

select o.REP [���������], o.AMOUNT [���� ������]
from ORDERS o
where o.AMOUNT > 2000
order by o.AMOUNT desc