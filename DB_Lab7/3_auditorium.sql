create view ��������� (�����)
as

select a.AUDITORIUM [���������]
from AUDITORIUM a
where a.AUDITORIUM_TYPE like '��%';

go
insert ��������� values('200-3�')
insert ��������� values('100-3�')
update ��������� set ����� = '324-1' where ����� = '236-1'
delete from ��������� where ����� = '100-3�'
delete from AUDITORIUM where AUDITORIUM = '100-3�'