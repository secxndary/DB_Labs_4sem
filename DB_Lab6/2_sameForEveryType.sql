select  AUDITORIUM_TYPE.AUDITORIUM_TYPENAME [Тип аудитории],
		max(AUDITORIUM_CAPACITY) [Макс. вместимость],
		min(AUDITORIUM_CAPACITY) [Мин. вместимость],
		avg(AUDITORIUM_CAPACITY) [Сред. вместимость],
		sum(AUDITORIUM_CAPACITY) [Сумм. вместимость],
		count(*) [Количество]
from AUDITORIUM inner join AUDITORIUM_TYPE
on AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE
group by AUDITORIUM_TYPE.AUDITORIUM_TYPENAME;