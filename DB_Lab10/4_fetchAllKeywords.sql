declare cur cursor local dynamic scroll for 
	select row_number() over (order by p.SUBJECT), p.IDSTUDENT, p.SUBJECT, p.NOTE from PROGRESS p
declare @rn int, @id varchar(10), @sub varchar(15), @nt int
open cur

fetch cur into @rn, @id, @sub, @nt
print 'First:    ' + cast(@rn as varchar) + '. ' + @id + ' студент – ' + rtrim(cast(@sub as varchar)) + ' (оценка ' + cast(@nt as varchar) + ')'

fetch next from cur into @rn, @id, @sub, @nt
print 'Next:     ' + cast(@rn as varchar) + '. ' + @id + ' студент – ' + rtrim(cast(@sub as varchar)) + ' (оценка ' + cast(@nt as varchar) + ')'

fetch relative 8 from cur into @rn, @id, @sub, @nt
print '8 rel:    ' + cast(@rn as varchar) + '. ' + @id + ' студент – ' + rtrim(cast(@sub as varchar)) + ' (оценка ' + cast(@nt as varchar) + ')'

fetch absolute -20 from cur into @rn, @id, @sub, @nt
print '-20 abs:  ' + cast(@rn as varchar) + '. ' + @id + ' студент – ' + rtrim(cast(@sub as varchar)) + ' (оценка ' + cast(@nt as varchar) + ')'

fetch prior from cur into @rn, @id, @sub, @nt
print 'Prior:    ' + cast(@rn as varchar) + '. ' + @id + ' студент – ' + rtrim(cast(@sub as varchar)) + ' (оценка ' + cast(@nt as varchar) + ')'

fetch last from cur into @rn, @id, @sub, @nt
print 'Last:     ' + cast(@rn as varchar) + '. ' + @id + ' студент – ' + rtrim(cast(@sub as varchar)) + ' (оценка ' + cast(@nt as varchar) + ')'


close cur