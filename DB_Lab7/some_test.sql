create view [����� ��� �������� + insert] (����, �����, ������, ��������)
as
select o.OFFICE[����], o.CITY [�����], o.REGION [������], o.MGR [��������]
from OFFICES o

insert into [����� ��� �������� + insert] values (20, 'Minsk', 'Belarus', 104);
