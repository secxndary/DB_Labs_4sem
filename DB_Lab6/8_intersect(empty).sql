select  FACULTY [���������],
		PROFESSION [�������������], 
		SUBJECT [�������], 
		round(avg(cast(p.NOTE as float(4))), 2) [������� ����]

from PROGRESS as p inner join STUDENT as s
on p.IDSTUDENT = s.IDSTUDENT
inner join GROUPS as g
on g.IDGROUP = s.IDGROUP

where g.FACULTY = '����'
group by FACULTY, PROFESSION, SUBJECT

INTERSECT	--������ �������, �.�. ��� ������� ����� �� ������������

select  FACULTY [���������],
		PROFESSION [�������������], 
		SUBJECT [�������], 
		round(avg(cast(p.NOTE as float(4))), 2) [������� ����]

from PROGRESS as p inner join STUDENT as s
on p.IDSTUDENT = s.IDSTUDENT
inner join GROUPS as g
on g.IDGROUP = s.IDGROUP

where g.FACULTY = '����'
group by FACULTY, PROFESSION, SUBJECT