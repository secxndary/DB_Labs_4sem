select  GROUPS.FACULTY [���������], 
		STUDENT.IDGROUP [������],
		count(*) [���-�� ���������]
from STUDENT, GROUPS
where GROUPS.IDGROUP = STUDENT.IDGROUP
group by rollup (GROUPS.FACULTY, STUDENT.IDGROUP)