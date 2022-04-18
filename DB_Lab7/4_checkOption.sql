create view Лекционные_аудитории (Номер, Вместимость)
as

select a.AUDITORIUM [Аудитория], a.AUDITORIUM_CAPACITY [Вместимость]
from AUDITORIUM a
where a.AUDITORIUM_CAPACITY > 40 with check option

delete from Лекционные_аудитории where Номер = '1234'
insert into Лекционные_аудитории values('145', 10)
insert into Лекционные_аудитории values('12345678', 80)