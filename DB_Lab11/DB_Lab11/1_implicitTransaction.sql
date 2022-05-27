if exists (select * from sys.objects where object_id = object_id('dbo.X'))
	drop table X

set nocount on
declare @count int, @flag varchar = 'c'
set implicit_transactions on
create table X(num int)
insert X values (1), (2), (3)
set @count = (select count(*) from X)
print 'Кол-во строк в таблице Х: ' + cast(@count as varchar)
if @flag = 'c' 
	commit
else
	rollback
set implicit_transactions off

if exists (select * from sys.objects where object_id = object_id('dbo.X'))
	print 'Таблица Х реальна'
else
	print 'Погодите, это не реально'
