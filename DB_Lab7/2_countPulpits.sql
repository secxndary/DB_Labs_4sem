create view [Кол-во кафедр]
as
select f.FACULTY_NAME [Факультет], count(*) [Кол-во кафедр]
from FACULTY f join PULPIT p
on f.FACULTY = p.FACULTY
group by f.FACULTY_NAME