declare @total integer = (select sum(AUDITORIUM_CAPACITY) from AUDITORIUM),
		@count integer,
		@avg real,
		@countLess integer,
		@percent numeric (12,5)


print 'Total capacity: ' + cast(@total as char)
print '================================'

if @total > 200
begin
select @count = (select count(*) from AUDITORIUM)
select @avg  =  (select avg(AUDITORIUM_CAPACITY) from AUDITORIUM)
select @countLess = (select count(*) from AUDITORIUM where AUDITORIUM_CAPACITY < @avg)
select @percent = cast(@countLess as real) / cast(@count as real)

print 'Count of auditoriums:    ' + cast (@count as char)
print 'Average capacity:        ' + cast (@avg as char)
print 'Count of less than avg:  ' + cast (@countLess as char)
print 'Percent of them:         ' + cast (@percent as char)
end


else 
print 'Total capacity: ' + cast(@total as char)