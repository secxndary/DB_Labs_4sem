declare cur cursor local static for (select a.AUDITORIUM, a.AUDITORIUM_TYPE, a.AUDITORIUM_CAPACITY from AUDITORIUM a)
declare @name varchar(10)
declare @type varchar(5)
declare @cap int

open cur
print '���-�� �����: ' + cast(@@cursor_rows as char)
update AUDITORIUM set AUDITORIUM_TYPE = '��-�' where AUDITORIUM = '1234567'		--�� ���������
fetch cur into @name, @type, @cap
while @@FETCH_STATUS = 0
begin
	print @name + ' ' + @type + ' ' + cast(@cap as char) 
	fetch cur into @name, @type, @cap
end
close cur