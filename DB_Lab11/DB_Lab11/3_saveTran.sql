declare @point varchar(3)

begin try
	begin tran
		delete from AUDITORIUM where AUDITORIUM = '123-1'
		set @point = 'p1'; save tran @point
		insert into AUDITORIUM values('test1', '��-�', 40, 'test1')
		set @point = 'p2'; save tran @point
		insert into AUDITORIUM values('test1', '��-�', 50, 'test2')
		set @point = 'p3'; save tran @point
	commit tran
end try
begin catch
	print '������! ' + error_message()
	if @@TRANCOUNT > 0
	begin
		print '����������� �����: ' + cast(@point as varchar)
		rollback tran @point
		commit tran
	end
end catch