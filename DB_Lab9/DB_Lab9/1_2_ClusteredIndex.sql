drop table #EXPLRE
create table #EXPLRE
(    
	TIND int,  
    TFIELD varchar(100) 
);


 checkpoint  --�������� ��
 DBCC DROPCLEANBUFFERS  --�������� �������� ���

-- ��� �������� ��������� ����� ����� 0,01
set nocount on
declare @I int = 0
while @I < 1000
begin
	insert #EXPLRE(TIND, TFIELD) 
	values (floor(20000 * rand()), replicate('������', 10))
	if (@I % 100 = 0)
		print @I
	set @I += 1
end


-- � ��� ��������� 0,03
select * from #EXPLRE where TIND between 1500 and 2500 order by TIND


-- ������ �������� �������
create clustered index IX_dbo_EXPLRE on #EXPLRE(TIND asc)


-- ���� ����� ����� �� CTRL + L ����������� ���������, ��� ����� ����� 0,003
-- �� ���� ��� ���� ������� � 10 ���