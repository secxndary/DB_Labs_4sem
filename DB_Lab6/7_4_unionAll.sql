select  FACULTY [Факультет],		-- механическое объединение строк
		PROFESSION [Специальность], 
		SUBJECT [Предмет], 
		round(avg(cast(p.NOTE as float(4))), 2) [Средний балл]

from PROGRESS as p inner join STUDENT as s
on p.IDSTUDENT = s.IDSTUDENT
inner join GROUPS as g
on g.IDGROUP = s.IDGROUP

where g.FACULTY = 'ИДиП'
group by FACULTY, PROFESSION, SUBJECT

UNION ALL

select  FACULTY [Факультет],
		PROFESSION [Специальность], 
		SUBJECT [Предмет], 
		round(avg(cast(p.NOTE as float(4))), 2) [Средний балл]

from PROGRESS as p inner join STUDENT as s
on p.IDSTUDENT = s.IDSTUDENT
inner join GROUPS as g
on g.IDGROUP = s.IDGROUP

where g.FACULTY = 'ХТиТ'
group by FACULTY, PROFESSION, SUBJECT