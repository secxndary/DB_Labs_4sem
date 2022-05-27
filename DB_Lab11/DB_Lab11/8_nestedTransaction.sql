begin tran
	insert AUDITORIUM_TYPE values ('ЛБ-М', 'какой то тип')
	begin tran
		update AUDITORIUM set AUDITORIUM = '1234' where AUDITORIUM_TYPE = 'ЛК-К'
		commit
	if @@TRANCOUNT > 0
rollback

select (select count(*) from AUDITORIUM where AUDITORIUM_TYPE = 'ЛБ-М') Аудитории,
	   (select count(*) from AUDITORIUM_TYPE where AUDITORIUM_TYPE = 'ЛБ-М') Тип