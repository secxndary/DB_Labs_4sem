declare @out varchar(300) = ''
declare @str char(20)
declare cur cursor for (select SUBJECT from SUBJECT where PULPIT = 'ИСиТ')

open cur
fetch cur into @str
print 'Дисциплины на ИСиТ:'
while @@FETCH_STATUS = 0
begin
	set @out = rtrim(@str) + '; ' + @out
	fetch cur into @str
end
print @out
deallocate cur