select PULPIT.PULPIT_NAME[������� � ���������� � ���������� � ������������]		
from FACULTY inner join PULPIT
on FACULTY.FACULTY = PULPIT.FACULTY
and FACULTY.FACULTY in (select PROFESSION.FACULTY from PROFESSION where (PROFESSION_NAME like '%���������%'));