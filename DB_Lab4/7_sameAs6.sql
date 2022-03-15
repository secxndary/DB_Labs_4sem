select isnull (TEACHER.TEACHER_NAME, '***') [Преподаватели], PULPIT.PULPIT_NAME[Кафедра]
from PULPIT left outer join TEACHER
on TEACHER.PULPIT = PULPIT.PULPIT