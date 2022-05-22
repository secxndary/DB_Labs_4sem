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
	values (floor(30000 * rand()), replicate ('������', 10))
	set @I += 1
end

-- ��� �������� ��������� ������ �������� ~0,14
select count(*) from #TASK2
select * from #TASK2

-- ������� �������������������� ������������ ��������� ������:
create index IX_dbo_TASK2 on #TASK2 (TKEY, CC)

-- ����� �������� ������� ������ ������ ���� ������ 0,05 (������� 3 ����)

-- �������������������� ������ �� ������������ 
-- ���������� ��� ���������� (��� �������, ����� ���
-- ������� ��� 0,03, � � �������� 0,13):
select * from #TASK2 where TKEY > 1500 and CC < 4500

-- ����� ��� ������ 1,1:
select * from #TASK2 order by TKEY, CC


-- ������, �������������������� ��������� 
-- ������ ������������ ��� ������������� ��������
-- (1,2 ��� �������, 0,006 � ��������)
-- ������� � �������� � 200 ���
select * from #TASK2 where TKEY = 556 and CC > 3