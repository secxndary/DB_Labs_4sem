-- ����� 3 ������, ������� ��������� ������ �����

select top 3 o.PRODUCT [�����], sum(o.QTY) [���-�� �������]
from ORDERS o
group by o.PRODUCT
order by sum(o.QTY) asc