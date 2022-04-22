declare @idgr integer = 14			-- заменить это число на другие группы
declare @count integer = (select count(*) from STUDENT where IDGROUP = @idgr)
declare @avg numeric(5,2)

if (@count > 5)
begin
set @avg = (select avg (cast (p.NOTE as real)) from STUDENT s join PROGRESS p on s.IDSTUDENT = p.IDSTUDENT)
print '—редний балл в ' + cast(@idgr as varchar) + ' группе Ч ' + cast(@avg as varchar)
end
else 
print ' ол-во учеников в ' + cast(@idgr as varchar) + ' группе Ч ' + cast(@count as varchar) + ' человек.'
