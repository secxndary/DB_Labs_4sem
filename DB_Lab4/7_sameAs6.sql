select isnull (TEACHER.TEACHER_NAME, '***') [�������������], PULPIT.PULPIT_NAME[�������]
from PULPIT left outer join TEACHER
on TEACHER.PULPIT = PULPIT.PULPIT