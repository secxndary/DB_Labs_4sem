select distinct SUBJECT [����������],
				NOTE [������],
				(select count(*) from PROGRESS as p2
				where p1.SUBJECT = p2.SUBJECT
				and p1.NOTE = p2.NOTE) [����������]
from PROGRESS as p1
group by SUBJECT, IDSTUDENT, NOTE
having p1.NOTE between 8 and 9
