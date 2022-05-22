drop table #EXPLRE
create table #EXPLRE
(    
	TIND int,  
    TFIELD varchar(100) 
);


 checkpoint  --фиксация БД
 DBCC DROPCLEANBUFFERS  --очистить буферный кэш

-- без индексов стоимость будет равна 0,01
set nocount on
declare @I int = 0
while @I < 1000
begin
	insert #EXPLRE(TIND, TFIELD) 
	values (floor(20000 * rand()), replicate('строка', 10))
	if (@I % 100 = 0)
		print @I
	set @I += 1
end


-- а тут стоимость 0,03
select * from #EXPLRE where TIND between 1500 and 2500 order by TIND


-- теперь создадим индексы
create clustered index IX_dbo_EXPLRE on #EXPLRE(TIND asc)


-- если после этого на CTRL + L просмотреть стоимость, она будет равна 0,003
-- то есть код стал быстрее в 10 раз