

---------------------------  ЛОКАЛЬНЫЙ КУРСОР  -------------------------------

declare curL cursor local for (select p.IDSTUDENT, p.SUBJECT, p.NOTE from PROGRESS p)
print '==================  ЛОКАЛЬНЫЙ КУРСОР  =================='
print ''

declare @st varchar(10)
declare @sub varchar(10)
declare @note int
open curL
fetch curL into @st, @sub, @note
print '1. Студент №' + @st + ': ' + cast(@note as varchar) + ' по ' + @sub

print 'Попытка выполнить другой пакет с локальным курсором...'
go
declare @st varchar(10)
declare @sub varchar(10)
declare @note int
fetch curL into @st, @sub, @note
print '2. Студент №' + @st + ': ' + cast(@note as varchar) + ' по ' + @sub
go




---------------------------  ГЛОБАЛЬНЫЙ КУРСОР  -------------------------------


go
declare curG cursor global for (select p.IDSTUDENT, p.SUBJECT, p.NOTE from PROGRESS p)
print '=================  ГЛОБАЛЬНЫЙ КУРСОР  =================='
print ''

declare @st varchar(10)
declare @sub varchar(10)
declare @note int
open curG
fetch curG into @st, @sub, @note
print '1. Студент №' + @st + ': ' + cast(@note as varchar) + ' по ' + @sub

print 'Попытка выполнить другой пакет с глобальным курсором...'
go
declare @st varchar(10)
declare @sub varchar(10)
declare @note int
fetch curG into @st, @sub, @note
print '2. Студент №' + @st + ': ' + cast(@note as varchar) + ' по ' + @sub

print ''
print '========================================================'
go

deallocate curG
go