drop procedure PRINT_REPORT;
go
create procedure PRINT_REPORT
	@fac char(10) = null, @pul char(10) = null
	as declare @faculty char(50), @pulpit char(10), @subject char(10), @cnt_teacher int;
		declare @temp_fac char(50), @temp_pul char(10), @list varchar(100), 
			@DISCIPLINES char(12) = 'Дисциплины: ', @DISCIPLINES_NONE char(16) = 'Дисциплины: нет.';
	begin try
		if (@pul is not null 
			and not exists (select FACULTY from PULPIT where PULPIT = @pul))
			raiserror('Ошибка в параметрах', 11, 1);

		declare @count int = 0;

		declare EX8 cursor local static 
			for select FACULTY.FACULTY, PULPIT.PULPIT, SUBJECT.SUBJECT, count(TEACHER.TEACHER)
			from FACULTY 
				inner join PULPIT on FACULTY.FACULTY = PULPIT.FACULTY
				left outer join SUBJECT on PULPIT.PULPIT = SUBJECT.PULPIT
				left outer join TEACHER on PULPIT.PULPIT = TEACHER.PULPIT
			where FACULTY.FACULTY = isnull(@fac, FACULTY.FACULTY)
				and PULPIT.PULPIT = isnull(@pul, PULPIT.PULPIT)
			group by FACULTY.FACULTY, PULPIT.PULPIT, SUBJECT.SUBJECT
			order by FACULTY asc, PULPIT asc, SUBJECT asc;

		open EX8;
			fetch EX8 into @faculty, @pulpit, @subject, @cnt_teacher;
			while @@FETCH_STATUS = 0
				begin 
					print 'Факультет ' + rtrim(@faculty) + ': ';
					set @temp_fac = @faculty;
					while (@faculty = @temp_fac)
						begin
							print char(9) + 'Кафедра ' + rtrim(@pulpit) + ': ';
							set @count += 1;
							print char(9) + char(9) + 'Количество преподавателей: ' + rtrim(@cnt_teacher) + '.';
							set @list = @DISCIPLINES;

							if(@subject is not null)
								begin
									if(@list = @DISCIPLINES)
										set @list += rtrim(@subject);
									else
										set @list += ', ' + rtrim(@subject);
								end;
							if (@subject is null) set @list = @DISCIPLINES_NONE;

							set @temp_pul = @pulpit;
							fetch EX8 into @faculty, @pulpit, @subject, @cnt_teacher;
							while (@pulpit = @temp_pul)
								begin
									if(@subject is not null)
										begin
											if(@list = @DISCIPLINES)
												set @list += rtrim(@subject);
											else
												set @list += ', ' + rtrim(@subject);
										end;
									fetch EX8 into @faculty, @pulpit, @subject, @cnt_teacher;
									if(@@FETCH_STATUS != 0) break;
								end;
							if(@list != @DISCIPLINES_NONE)
								set @list += '.';
							print char(9) + char(9) + @list;
							if(@@FETCH_STATUS != 0) break;
						end;
				end;
		close EX8;
		deallocate EX8;
		return @count;
	end try
	begin catch
		print 'Номер ошибки: ' + convert(varchar, error_number());
		print 'Сообщение: ' + error_message();
		print 'Уровень: ' + convert(varchar, error_severity());
		print 'Метка: ' + convert(varchar, error_state());
		print 'Номер строки: ' + convert(varchar, error_line());
		if error_procedure() is not null
			print 'Имя процедуры: ' + error_procedure();
		return -1;
	end catch;
go

declare @temp_8_1 int;
exec @temp_8_1 = PRINT_REPORT null, null;
select @temp_8_1;

declare @temp_8_2 int;
exec @temp_8_2 = PRINT_REPORT 'ИТ', null;
select @temp_8_2;

declare @temp_8_3 int;
exec @temp_8_3 = PRINT_REPORT null, 'ПОиСОИ';
select @temp_8_3;

declare @temp_8_4 int;
exec @temp_8_4 = PRINT_REPORT null, 'testing';
select @temp_8_4;