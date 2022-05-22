--drop table #TASK5

create table #TASK5
(
	TKEY int,
	CC int identity(1, 1),
	TF varchar(100)
)

set nocount on
declare @I int = 0
while @I < 15000
begin
	insert #TASK5(TKEY, TF) 
	values (floor(30000 * rand()), replicate ('������', 10))
	set @I += 1
end

create index #TASK5_TKEY on #TASK5(TKEY)
--drop index #TASK5_TKEY on #TASK5

INSERT top(10000) #TASK5(TKEY, TF) select TKEY, TF from #TASK5;

-- ������� ������ ��� ��������� ������������ �������� (��������� ������� tempdb)
SELECT  OBJECT_NAME(T1.object_id) AS NameTable,
        T2.name AS IndexName,
        T1.avg_fragmentation_in_percent AS Fragmentation
FROM sys.dm_db_index_physical_stats (DB_ID(), NULL, NULL, NULL, NULL) AS T1
LEFT JOIN sys.indexes AS T2 ON T1.object_id = T2.object_id AND T1.index_id = T2.index_id


-- ������������ ������� ����� 97%
select avg_fragmentation_in_percent [������������(%)]
from   sys.dm_db_index_physical_stats (DB_ID(N'TEMPDB'),
	   OBJECT_ID(N'#TASK5'), NULL, NULL, NULL) ss
--join   sys.indexes ii on ss.object_id = ii.object_id and ss.index_id = ii.index_id
--where  name is not null


-- ������������� ���� ������������ 1,78%
alter index #TASK5_TKEY on #TASK5 reorganize

-- ����������� �� ���� ������������ 0%
alter index  #TASK5_TKEY on #TASK5 rebuild with (online = off)



----------------------  6 �������  ------------------------

drop index #TASK5_TKEY on #TASK5
drop index IX_TASK6 on #TASK5


create index IX_TASK6 on #TASK5 (TKEY) with (fillfactor	= 10)


set nocount on
declare @I int = 0
while @I < 15000
begin
	insert #TASK5(TKEY, TF) 
	values (floor(30000 * rand()), replicate ('������', 10))
	set @I += 1
end



SELECT  OBJECT_NAME(T1.object_id) AS NameTable,
        T2.name AS IndexName,
        T1.avg_fragmentation_in_percent AS Fragmentation
FROM sys.dm_db_index_physical_stats (DB_ID(), NULL, NULL, NULL, NULL) AS T1
LEFT JOIN sys.indexes AS T2 ON T1.object_id = T2.object_id AND T1.index_id = T2.index_id