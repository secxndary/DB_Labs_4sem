--create view ��������
--as
select top(10) * from
		(select top(10) 
		convert(varchar, DAY(DATE_WEEK)) + '.0' + convert(varchar, MONTH(DATE_WEEK)) ����,
		LESSON ����,
		convert(varchar, IDGROUP) + ' ������' ������,
		AUDITORIUM + SUBJECT_NAME ������
		from TIMETABLE) ttbl
			pivot
			(max(������)
			for ������
			in ([3 ������], [4 ������], [5 ������])
			) pvt
		order by ����