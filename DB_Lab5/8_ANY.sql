select NOTE[������], SUBJECT[�������]
from PROGRESS
where NOTE > ANY (select NOTE from PROGRESS where SUBJECT like '����')
order by NOTE desc;