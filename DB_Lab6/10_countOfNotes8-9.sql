select distinct SUBJECT [Дисциплина],
				NOTE [Оценка],
				(select count(*) from PROGRESS as p2
				where p1.SUBJECT = p2.SUBJECT
				and p1.NOTE = p2.NOTE) [Количество]
from PROGRESS as p1
group by SUBJECT, IDSTUDENT, NOTE
having p1.NOTE between 8 and 9
