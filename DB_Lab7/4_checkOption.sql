create view ����������_��������� (�����, �����������)
as

select a.AUDITORIUM [���������], a.AUDITORIUM_CAPACITY [�����������]
from AUDITORIUM a
where a.AUDITORIUM_CAPACITY > 40 with check option

delete from ����������_��������� where ����� = '1234'
insert into ����������_��������� values('145', 10)
insert into ����������_��������� values('12345678', 80)