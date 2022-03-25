select NOTE[Оценка], SUBJECT[Предмет]
from PROGRESS
where NOTE > ANY (select NOTE from PROGRESS where SUBJECT like 'ОАиП')
order by NOTE desc;