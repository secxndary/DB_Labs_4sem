create view [Офисы без таргетов + insert] (Офис, Город, Регион, Менеджер)
as
select o.OFFICE[Офис], o.CITY [Город], o.REGION [Регион], o.MGR [Менеджер]
from OFFICES o

insert into [Офисы без таргетов + insert] values (20, 'Minsk', 'Belarus', 104);
