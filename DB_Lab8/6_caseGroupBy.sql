select PROGRESS.IDSTUDENT [�������],
	case
		when NOTE between 9 and 10 then '����������'
		when NOTE between 6 and 8 then '�����'
		when NOTE between 4 and 5 then '������'
		else '�������� �� ���������'
	end ���������
from PROGRESS

group by PROGRESS.IDSTUDENT,
	case 
		when NOTE between 9 and 10 then '����������'
		when NOTE between 6 and 8 then '�����'
		when NOTE between 4 and 5 then '������'
		else '�������� �� ���������'
	end 