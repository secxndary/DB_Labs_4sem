

---------------------------  ��������� ������  -------------------------------

declare curL cursor local for (select p.IDSTUDENT, p.SUBJECT, p.NOTE from PROGRESS p)
print '==================  ��������� ������  =================='
print ''

declare @st varchar(10)
declare @sub varchar(10)
declare @note int
open curL
fetch curL into @st, @sub, @note
print '1. ������� �' + @st + ': ' + cast(@note as varchar) + ' �� ' + @sub

print '������� ��������� ������ ����� � ��������� ��������...'
go
declare @st varchar(10)
declare @sub varchar(10)
declare @note int
fetch curL into @st, @sub, @note
print '2. ������� �' + @st + ': ' + cast(@note as varchar) + ' �� ' + @sub
go




---------------------------  ���������� ������  -------------------------------


go
declare curG cursor global for (select p.IDSTUDENT, p.SUBJECT, p.NOTE from PROGRESS p)
print '=================  ���������� ������  =================='
print ''

declare @st varchar(10)
declare @sub varchar(10)
declare @note int
open curG
fetch curG into @st, @sub, @note
print '1. ������� �' + @st + ': ' + cast(@note as varchar) + ' �� ' + @sub

print '������� ��������� ������ ����� � ���������� ��������...'
go
declare @st varchar(10)
declare @sub varchar(10)
declare @note int
fetch curG into @st, @sub, @note
print '2. ������� �' + @st + ': ' + cast(@note as varchar) + ' �� ' + @sub

print ''
print '========================================================'
go

deallocate curG
go