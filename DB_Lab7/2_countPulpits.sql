create view [���-�� ������]
as
select f.FACULTY_NAME [���������], count(*) [���-�� ������]
from FACULTY f join PULPIT p
on f.FACULTY = p.FACULTY
group by f.FACULTY_NAME