declare cur cursor local static for
	select f.FACULTY, p.PULPIT, count(t.TEACHER_NAME), s.SUBJECT
	from FACULTY f 
	join PULPIT p on p.FACULTY = f.FACULTY
	join SUBJECT s on s.PULPIT = p.PULPIT
	join TEACHER t on t.PULPIT = p.PULPIT
	group by f.FACULTY, p.PULPIT, s.SUBJECT


declare @fc varchar(10), @pl varchar(10), @cn int, @sb varchar(10)

open cur
fetch cur into @fc, @pl, @cn, @sb
print '���������: ' + cast(@fc as varchar) + char(13) + char(9) + '�������: ' + cast(@pl as varchar) + char(13) + char(9) + char(9) + '���������� ��������������: ' + cast(@cn as varchar) + char(13) + char(9) + char(9) + '����������: ' + cast(@sb as varchar)
close cur