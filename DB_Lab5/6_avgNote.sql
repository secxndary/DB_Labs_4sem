select top 1 
(select avg(NOTE) from PROGRESS where SUBJECT like 'ясад')[ясад],
(select avg(NOTE) from PROGRESS where SUBJECT like 'нюХо')[нюХо],
(select avg(NOTE) from PROGRESS where SUBJECT like 'йц')[йц]
from PROGRESS;