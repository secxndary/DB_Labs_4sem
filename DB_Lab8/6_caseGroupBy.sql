select PROGRESS.IDSTUDENT [—тудент],
	case
		when NOTE between 9 and 10 then 'неверо€тен'
		when NOTE between 6 and 8 then 'хорош'
		when NOTE between 4 and 5 then 'неплох'
		else 'увидимс€ на пересдаче'
	end –езультат
from PROGRESS

group by PROGRESS.IDSTUDENT,
	case 
		when NOTE between 9 and 10 then 'неверо€тен'
		when NOTE between 6 and 8 then 'хорош'
		when NOTE between 4 and 5 then 'неплох'
		else 'увидимс€ на пересдаче'
	end 