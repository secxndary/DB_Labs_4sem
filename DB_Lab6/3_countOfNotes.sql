select *
from (select case 
			when NOTE between 4 and 5 then '4-5'
			when NOTE between 6 and 7 then '6-7'
			when NOTE between 8 and 9 then '8-9'
			else '10'
			end [Оценки], count(*) [Количество]

from PROGRESS group by case
			when NOTE between 4 and 5 then '4-5'
			when NOTE between 6 and 7 then '6-7'
			when NOTE between 8 and 9 then '8-9'
			else '10'
			end) as T

order by case [Оценки]
			when '4-5' then 3
			when '6-7' then 2
			when '8-9' then 1
			else 0
			end