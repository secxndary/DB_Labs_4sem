select  AUDITORIUM_TYPE [��� ���������], 
		AUDITORIUM_CAPACITY [�����������],
		case 
			when a.AUDITORIUM like '%-1' then '1'
			when a.AUDITORIUM like '%-2' then '2'
		end [������],
		count(*) [����������]
from AUDITORIUM as a

group by AUDITORIUM_TYPE, AUDITORIUM_CAPACITY,
	case 
		when a.AUDITORIUM like '%-1' then '1'
		when a.AUDITORIUM like '%-2' then '2'
	end with rollup