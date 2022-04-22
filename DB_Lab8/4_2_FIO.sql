declare @fullFIO varchar(100) = (select top 1 NAME from STUDENT where NAME like 'Валдайцев%')
print 'Полное ФИО:        ' + @fullFIO
declare @shortFIO varchar(100) = substring(@fullFIO, 0, charindex(' ', @fullFIO) + 1) 
+ substring(@fullFIO, charindex(' ', @fullFIO) + 1, 1) + '. '
+ substring(@fullFIO, charindex(' ', @fullFIO, charindex(' ', @fullFIO) + 1) + 1, 1) + '.'
print 'Сокращённое ФИО:   ' + @shortFIO