select AUDITORIUM_CAPACITY, AUDITORIUM_TYPE
from AUDITORIUM as a
where AUDITORIUM_CAPACITY = 
(select top(1) aa.AUDITORIUM_CAPACITY from AUDITORIUM as aa
where aa.AUDITORIUM_TYPE = a.AUDITORIUM_TYPE
order by AUDITORIUM_CAPACITY desc);