select distinct PULPIT.PULPIT_NAME[������� � ���������� � ���������� � ������������]		
from FACULTY inner join PULPIT
on FACULTY.FACULTY = PULPIT.FACULTY
inner join PROFESSION
on PROFESSION.FACULTY = FACULTY.FACULTY
where PROFESSION_NAME like '%���������%';