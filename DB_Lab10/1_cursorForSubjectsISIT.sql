declare @out varchar(300) = ''
declare @str char(20)
declare cur cursor for (select SUBJECT from SUBJECT where PULPIT = '����')

open cur
fetch cur into @str
print '���������� �� ����:'
while @@FETCH_STATUS = 0
begin
	set @out = rtrim(@str) + '; ' + @out
	fetch cur into @str
end
print @out
deallocate cur