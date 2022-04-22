declare @i int = 1

while @i < 100
begin
print @i
set @i = @i * 2
if (@i > 50)
	return
end