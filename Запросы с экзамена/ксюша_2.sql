-- ���������� ������� ���� ������ ��� ������� ���������� � ����� ���, � ���� ������� ���� ������ ������ 600 (8000)

select o.REP [���������], round(avg(cast(o.AMOUNT as float(4))), 2) �������_����
from ORDERS o
group by o.REP
having round(avg(cast(o.AMOUNT as float(4))), 2) > 8000
order by �������_���� desc