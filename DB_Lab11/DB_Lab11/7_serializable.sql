-- A ---
set transaction isolation level SERIALIZABLE 
begin transaction 
	delete AUDITORIUM where AUDITORIUM = '1234'
    insert AUDITORIUM values ('1234', '��-�', 10, '���')
    update AUDITORIUM set AUDITORIUM_NAME = '���' where AUDITORIUM = '1234'
    select AUDITORIUM from AUDITORIUM where AUDITORIUM = '1234'
-------------------------- t1 -----------------
	select AUDITORIUM from AUDITORIUM where AUDITORIUM = '1234'
-------------------------- t2 ------------------ 
commit 	

--- B ---	
begin transaction 	  
	delete AUDITORIUM where AUDITORIUM_NAME = '���'; 
    insert AUDITORIUM values ('1234', '��-�', 10, '���')
    update AUDITORIUM set AUDITORIUM_NAME = '���' where AUDITORIUM = '1234'
    select AUDITORIUM from AUDITORIUM  where AUDITORIUM = '1234'
-------------------------- t1 --------------------
commit

select AUDITORIUM from AUDITORIUM  where AUDITORIUM = '1234'
-------------------------- t2 -------------------