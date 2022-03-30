select  GROUPS.FACULTY [Факультет], 
		STUDENT.IDGROUP [Группа],
		count(*) [Кол-во студентов]
from STUDENT, GROUPS
where GROUPS.IDGROUP = STUDENT.IDGROUP
group by rollup (GROUPS.FACULTY, STUDENT.IDGROUP)