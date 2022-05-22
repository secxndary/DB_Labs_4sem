drop table #TASK3

create table #TASK3
(
	TKEY int,
	CC int identity(1, 1),
	TF varchar(100)
)

set nocount on
declare @I int = 0
while @I < 15000
begin
	insert #TASK3(TKEY, TF) 
	values (floor(30000 * rand()), replicate ('строка', 10))
	set @I += 1
end

-- без индекса 0,13
select CC from #TASK3 where TKEY > 15000

-- с индексом 0,02 (выигрыш 6 раз)
create index IX_dbo_TASK3_TKEY_CC on #TASK3(TKEY) include (CC)