begin try
declare @i int = 1
set @i = @i / 0
end try

begin catch
print 'ERROR!'
print 'Error number:    ' + cast(ERROR_NUMBER() as varchar)
print 'Error severity:  ' + cast(ERROR_SEVERITY() as varchar)
print 'Error line:      ' + cast(ERROR_LINE() as varchar)
print 'Error state:     ' + cast(ERROR_STATE() as varchar)
print 'Error message:   ' + cast(ERROR_MESSAGE() as varchar)
end catch