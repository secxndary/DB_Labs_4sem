select BDAY[���� ��������], DAY(BDAY)[���������� �����] 
from STUDENT a
where DAY(a.BDAY) = (select top 1 DAY(aa.BDAY)from STUDENT as aa);