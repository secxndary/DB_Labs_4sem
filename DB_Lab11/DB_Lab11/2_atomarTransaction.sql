begin try
	begin tran
		delete from AUDITORIUM where AUDITORIUM = '123-1'
		insert into AUDITORIUM values('test0', 'ËÊ-Ê', 40, 'test1')
		insert into AUDITORIUM values('test0', 'ËÁ-Ê', 50, 'test2')
	commit tran
end try
begin catch
	print 'Îøèáêà! ' + error_message()
	if @@TRANCOUNT > 0
		rollback tran
end catch