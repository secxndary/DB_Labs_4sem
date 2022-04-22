declare @ch char(1) = 's',						-- сразу
		@varch varchar(15) = 'hello world',		-- сразу
		@date datetime,							-- set
		@time time(3),							-- set
		@int int,								-- select
		@sint smallint,							-- select
		@tint tinyint,							-- empty
		@num numeric(12,5),						-- select
		@capacity integer						-- select-запрос


set @date = getdate()
set @time = '12:30:15.123'

select @int = 1234
select @sint = 1
select @capacity = (select avg(AUDITORIUM_CAPACITY) from AUDITORIUM)
select @num = 124123.3213


print 'char:           ' + @ch
print 'varchar:        ' + @varch
print 'int:            ' + cast(@int as char)
print 'smallint:      ' + cast(@sint as char)
print 'numeric(12,5):  ' + cast(@num as char)

--select @date [Date], @time [Time], @capacity [Avg capacity], @tint [Empty]