-- ���������� ���������� ��������� ������� ��� ������� ���������� � ����� ���, ��� ������ ������ 10 ���� �������

select count(*) ���_��, REP
from ORDERS o
where o.AMOUNT in (select oo.AMOUNT from ORDERS oo where o.REP = oo.REP )
group by REP