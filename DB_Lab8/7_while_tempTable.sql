drop table #temp
create table #temp (tid integer, tstr varchar(20), tnum numeric(10,3))

declare @i int = 0
while (@i < 10)
begin
insert into #temp values(@i, 'Запись №' + cast(@i as varchar), 100*rand())
set @i = @i + 1
end

select * from #temp