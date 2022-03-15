select isnull (TEACHER.TEACHER_NAME, '***') [Преподаватели], PULPIT.PULPIT_NAME[Кафедра]
from TEACHER right outer join PULPIT
on TEACHER.PULPIT = PULPIT.PULPIT