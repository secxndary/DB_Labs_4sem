declare @group integer = 4
declare @dow date
set @dow = 
(select top 1 p.PDATE from PROGRESS p 
join STUDENT s on s.IDSTUDENT = p.IDSTUDENT
where s.IDGROUP = @group and p.SUBJECT = 'ясад')
print @dow