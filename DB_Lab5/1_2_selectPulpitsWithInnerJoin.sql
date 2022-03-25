select PULPIT.PULPIT_NAME[Кафедры с факультета с профессией с технологиями]		
from FACULTY inner join PULPIT
on FACULTY.FACULTY = PULPIT.FACULTY
and FACULTY.FACULTY in (select PROFESSION.FACULTY from PROFESSION where (PROFESSION_NAME like '%технологи%'));