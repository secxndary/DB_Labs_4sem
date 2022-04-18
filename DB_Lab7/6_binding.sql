create view [Кол-во кафедр SCHEMABINDING] with schemabinding
as
select f.FACULTY_NAME [Факультет], count(*) [Кол-во кафедр]
from dbo.FACULTY f join dbo.PULPIT p
on f.FACULTY = p.FACULTY
group by f.FACULTY_NAME;


alter table PULPIT alter column PULPIT decimal;

--delete from [Кол-во кафедр SCHEMABINDING] where Факультет = 'Технология органических веществ'

