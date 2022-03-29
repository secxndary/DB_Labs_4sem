select  f.FACULTY [Факультет],
		g.PROFESSION [Специальность],
		p.SUBJECT [Дисциплина],
		round(avg(cast(p.NOTE as float(4))), 2) [Средняя оценка]

from FACULTY f inner join GROUPS g
on f.FACULTY = g.FACULTY
inner join STUDENT s
on s.IDGROUP = g.IDGROUP
inner join PROGRESS p
on p.IDSTUDENT = s.IDSTUDENT

group by cube (g.PROFESSION, p.SUBJECT), f.FACULTY;