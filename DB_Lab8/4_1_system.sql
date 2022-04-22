declare @z numeric(5, 3), @t float, @x float, @sin numeric(5, 3), @4tx numeric(5, 3), @1ex numeric(5, 3)
set @t = 1
set @x = 1.2		-- заменить на другие числа

if (@t > @x) 
	set @z = sin(@t) * sin(@t)
else if (@t < @x)
	set @z = 4 * (@t + @x)
else 
	set @z = 1 - exp(@x - 2)

print 'z = ' + cast(@z as char)