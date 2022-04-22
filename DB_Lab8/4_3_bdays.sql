declare @student table (ФИО varchar(100), [День рождения] varchar(50), Возраст integer)

declare @name varchar(100) = (select top 1 s.NAME from STUDENT s where month(s.BDAY) = month(getdate()) + 1)
declare @bday varchar(100) = (select top 1 s.BDAY from STUDENT s where month(s.BDAY) = month(getdate()) + 1)
declare @age int = datediff(year, @bday, getdate())
insert @student values(@name, @bday, @age)

declare @bday2 varchar(100) = (select top 1 s.BDAY from STUDENT s where month(s.BDAY) = month(getdate()) + 1 order by s.IDSTUDENT desc)
declare @name2 varchar(100) = (select top 1 s.NAME from STUDENT s where s.BDAY = @bday2)
declare @age2 int = datediff(year, @bday2, getdate())
insert @student values(@name2, @bday2, @age)

select * from @student
