select ���, ������, count(*) [���������� ����]
from AUTHORS
inner join BOOKS
on BOOKS.����� = AUTHORS.���
group by AUTHORS.���, AUTHORS.������
having count(*) >= 2