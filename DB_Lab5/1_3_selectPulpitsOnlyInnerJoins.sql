select distinct PULPIT.PULPIT_NAME[Кафедры с факультета с профессией с технологиями]		
from FACULTY inner join PULPIT
on FACULTY.FACULTY = PULPIT.FACULTY
inner join PROFESSION
on PROFESSION.FACULTY = FACULTY.FACULTY
where PROFESSION_NAME like '%технологи%';