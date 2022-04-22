declare cur cursor local dynamic for 
	select p.IDSTUDENT, s.NAME, p.NOTE from PROGRESS p
	join STUDENT s on s.IDSTUDENT = p.IDSTUDENT
	where p.NOTE < 4
		FOR UPDATE
declare @id varchar(5), @nm varchar(50), @nt int


open cur
fetch cur into @id, @nm, @nt
print @id + ': ' + @nm + ' (оценка ' + cast(@nt as varchar) + ')'
delete PROGRESS where CURRENT OF cur	-- не запускать, все удалится
delete STUDENT where CURRENT OF cur
close cur