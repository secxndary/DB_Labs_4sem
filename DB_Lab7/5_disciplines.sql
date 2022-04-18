create view Дисциплины
as
select top 50
s.SUBJECT [Аббревиатура], s.SUBJECT_NAME [Название предмета], s.PULPIT [Кафедра]
from SUBJECT s
order by Аббревиатура