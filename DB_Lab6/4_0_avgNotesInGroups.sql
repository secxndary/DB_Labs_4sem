select  f.FACULTY [���������],
		g.PROFESSION [�������������],
		(2014 - g.YEAR_FIRST) [����],
		round(avg(cast(p.NOTE as float(4))), 2) [������� ������]
from FACULTY f inner join GROUPS g
on f.FACULTY = g.FACULTY
inner join STUDENT s
on s.IDGROUP = g.IDGROUP
inner join PROGRESS p
on p.IDSTUDENT = s.IDSTUDENT
group by f.FACULTY, g.PROFESSION, g.YEAR_FIRST;