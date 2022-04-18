create view Аудитории (Номер)
as

select a.AUDITORIUM [Аудитория]
from AUDITORIUM a
where a.AUDITORIUM_TYPE like 'ЛК%';

go
insert Аудитории values('200-3а')
insert Аудитории values('100-3а')
update Аудитории set Номер = '324-1' where Номер = '236-1'
delete from Аудитории where Номер = '100-3а'
delete from AUDITORIUM where AUDITORIUM = '100-3а'