select  f.FACULTY [Факультет],
		g.PROFESSION [Специальность],
		(2014 - g.YEAR_FIRST) [Курс],
		round(avg(cast(p.NOTE as float(4))), 2) [Средняя оценка]
from FACULTY f inner join GROUPS g
on f.FACULTY = g.FACULTY
inner join STUDENT s
on s.IDGROUP = g.IDGROUP
inner join PROGRESS p
on p.IDSTUDENT = s.IDSTUDENT
group by f.FACULTY, g.PROFESSION, g.YEAR_FIRST;