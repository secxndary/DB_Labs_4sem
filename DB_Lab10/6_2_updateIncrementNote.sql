declare cur cursor local dynamic for 
	select p.IDSTUDENT, s.NAME, p.NOTE from PROGRESS p
	join STUDENT s on s.IDSTUDENT = p.IDSTUDENT
	where p.IDSTUDENT = 1011
		FOR UPDATE
declare @id varchar(5), @nm varchar(50), @nt int

open cur
fetch cur into @id, @nm, @nt
update PROGRESS set NOTE = NOTE + 1 where CURRENT OF cur
print @id + ': ' + @nm + ' (оценка ' + cast(@nt as varchar) + ')'	-- увеличится оценка на 1
close cur