use Lab3;
create table ������
(
	ID_������ int primary key,
	�������_������ int foreign key references ������(�������),
	���_���������� char(5) foreign key references ����������(���_����������),
	����������_���������� int not null,
	����_������ money,
	����_������ date,
	���������� nvarchar(40)
);