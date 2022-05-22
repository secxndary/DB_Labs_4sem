drop table #TASK4

create table #TASK4
(
	TKEY int,
	CC int identity(1, 1),
	TF varchar(100)
)

set nocount on
declare @I int = 0
while @I < 15000
begin
	insert #TASK4(TKEY, TF) 
	values (floor(30000 * rand()), replicate ('строка', 10))
	set @I += 1
end

-- некластеризированный фильтруемный индекс используется
-- при фильтрации в секции where (без индекса везде 0,14)
select TKEY from #TASK4 where TKEY between 5000 and 19999 
select TKEY from #TASK4 where TKEY > 15000 and  TKEY < 20000  
select TKEY from #TASK4 where TKEY = 17000

-- фильтруемый индекс:
create index IX_dbo_TASK4_FILTER on #TASK4 (TKEY) where (TKEY > 15000 and TKEY < 20000)

-- по итогу только второй запрос с таким же условием стал весить 0,006 (27 раз)