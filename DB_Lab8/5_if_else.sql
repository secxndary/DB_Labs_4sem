declare @idgr integer = 14			-- �������� ��� ����� �� ������ ������
declare @count integer = (select count(*) from STUDENT where IDGROUP = @idgr)
declare @avg numeric(5,2)

if (@count > 5)
begin
set @avg = (select avg (cast (p.NOTE as real)) from STUDENT s join PROGRESS p on s.IDSTUDENT = p.IDSTUDENT)
print '������� ���� � ' + cast(@idgr as varchar) + ' ������ � ' + cast(@avg as varchar)
end
else 
print '���-�� �������� � ' + cast(@idgr as varchar) + ' ������ � ' + cast(@count as varchar) + ' �������.'
