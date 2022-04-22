declare cur cursor local dynamic for 
	select p.IDSTUDENT, p.SUBJECT, p.NOTE from PROGRESS p FOR UPDATE
declare @id varchar(10), @sub varchar(15), @nt int


open cur
fetch cur into @id, @sub, @nt
print @id + ' студент Ц ' + rtrim(cast(@sub as varchar)) + ' (оценка ' + cast(@nt as varchar) + ')'
delete PROGRESS where CURRENT OF cur	-- удалитс€ строка, не запускать, все работает

fetch cur into @id, @sub, @nt
update PROGRESS set NOTE = NOTE + 1 where CURRENT OF cur
print ''
print @id + ' студент Ц ' + rtrim(cast(@sub as varchar)) + ' (оценка ' + cast(@nt as varchar) + ')'

close cur