select FACULTY.FACULTY[Факультет без кафедр]
from FACULTY
where not exists (select * from PULPIT where PULPIT.FACULTY = FACULTY.FACULTY);