create view [���-�� ������ SCHEMABINDING] with schemabinding
as
select f.FACULTY_NAME [���������], count(*) [���-�� ������]
from dbo.FACULTY f join dbo.PULPIT p
on f.FACULTY = p.FACULTY
group by f.FACULTY_NAME;


alter table PULPIT alter column PULPIT decimal;

--delete from [���-�� ������ SCHEMABINDING] where ��������� = '���������� ������������ �������'

