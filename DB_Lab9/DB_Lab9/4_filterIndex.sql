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
	values (floor(30000 * rand()), replicate ('������', 10))
	set @I += 1
end

-- �������������������� ������������ ������ ������������
-- ��� ���������� � ������ where (��� ������� ����� 0,14)
select TKEY from #TASK4 where TKEY between 5000 and 19999 
select TKEY from #TASK4 where TKEY > 15000 and  TKEY < 20000  
select TKEY from #TASK4 where TKEY = 17000

-- ����������� ������:
create index IX_dbo_TASK4_FILTER on #TASK4 (TKEY) where (TKEY > 15000 and TKEY < 20000)

-- �� ����� ������ ������ ������ � ����� �� �������� ���� ������ 0,006 (27 ���)