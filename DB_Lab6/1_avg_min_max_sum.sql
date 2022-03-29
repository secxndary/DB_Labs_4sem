select  min(AUDITORIUM_CAPACITY) [Мин. вместимость],
		max(AUDITORIUM_CAPACITY) [Макс. вместимость],
		avg(AUDITORIUM_CAPACITY) [Средн. вместимость],
		sum(AUDITORIUM_CAPACITY) [Сумм. вместимость],
		count(*) [Количество]
from AUDITORIUM;