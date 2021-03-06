select PROGRESS.NOTE[??????], STUDENT.NAME[??? ????????], SUBJECT.SUBJECT[??????????],
PULPIT.PULPIT[???????], FACULTY.FACULTY[?????????], 
GROUPS.PROFESSION[?????????????],

case
when (PROGRESS.NOTE = 6) then '?????'
when (PROGRESS.NOTE = 7) then '????'
when (PROGRESS.NOTE = 8) then '??????'
else '?? ????? 6 ? 8'
end [??????????]

from PROGRESS 
inner join STUDENT on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
inner join SUBJECT on PROGRESS.SUBJECT = SUBJECT.SUBJECT
inner join PULPIT on SUBJECT.PULPIT = PULPIT.PULPIT
inner join FACULTY on FACULTY.FACULTY = PULPIT.FACULTY
inner join PROFESSION on PROFESSION.FACULTY = FACULTY.FACULTY
inner join GROUPS on GROUPS.PROFESSION = PROFESSION.PROFESSION

where PROGRESS.NOTE between 6 and 8
group by PROGRESS.NOTE, STUDENT.NAME, SUBJECT.SUBJECT, PULPIT.PULPIT, FACULTY.FACULTY, GROUPS.PROFESSION

order by
(
	case 
		when (PROGRESS.NOTE = 6) then 3
		when (PROGRESS.NOTE = 7) then 1
		when (PROGRESS.NOTE = 8) then 2
	end 
)