--create view Расписос
--as
select top(10) * from
		(select top(10) 
		convert(varchar, DAY(DATE_WEEK)) + '.0' + convert(varchar, MONTH(DATE_WEEK)) День,
		LESSON Пара,
		convert(varchar, IDGROUP) + ' группа' Группа,
		AUDITORIUM + SUBJECT_NAME Ячейка
		from TIMETABLE) ttbl
			pivot
			(max(Ячейка)
			for Группа
			in ([3 группа], [4 группа], [5 группа])
			) pvt
		order by Пара