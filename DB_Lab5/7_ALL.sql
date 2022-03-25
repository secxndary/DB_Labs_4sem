select NOTE, SUBJECT
from PROGRESS
where NOTE >= ALL (select NOTE from PROGRESS where SUBJECT like 'สร');