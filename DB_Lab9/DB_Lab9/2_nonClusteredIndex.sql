drop table #TASK2

create table #TASK2
(
	TKEY int,
	CC int identity(1, 1),
	TF varchar(100)
)

set nocount on
declare @I int = 0
while @I < 15000
begin
	insert #TASK2(TKEY, TF) 
	values (floor(30000 * rand()), replicate ('строка', 10))
	set @I += 1
end

-- без индексов стоимость каждой операции ~0,14
select count(*) from #TASK2
select * from #TASK2

-- создаем некластеризированный неуникальный составной индекс:
create index IX_dbo_TASK2 on #TASK2 (TKEY, CC)

-- после создания индекса первый запрос стал весить 0,05 (выигрыш 3 раза)

-- некластеризированный индекс не оптимизирует 
-- фильтрацию или сортировку (что странно, здесь без
-- индекса вес 0,03, а с индексом 0,13):
select * from #TASK2 where TKEY > 1500 and CC < 4500

-- здесь вес всегда 1,1:
select * from #TASK2 order by TKEY, CC


-- однако, некласетризированный составной 
-- индекс подключается при фиксированном значении
-- (1,2 без индекса, 0,006 с индексом)
-- выигрыш в скорости в 200 раз
select * from #TASK2 where TKEY = 556 and CC > 3