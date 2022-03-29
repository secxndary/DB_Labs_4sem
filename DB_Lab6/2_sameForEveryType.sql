select  AUDITORIUM_TYPE.AUDITORIUM_TYPENAME [��� ���������],
		max(AUDITORIUM_CAPACITY) [����. �����������],
		min(AUDITORIUM_CAPACITY) [���. �����������],
		avg(AUDITORIUM_CAPACITY) [����. �����������],
		sum(AUDITORIUM_CAPACITY) [����. �����������],
		count(*) [����������]
from AUDITORIUM inner join AUDITORIUM_TYPE
on AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE
group by AUDITORIUM_TYPE.AUDITORIUM_TYPENAME;