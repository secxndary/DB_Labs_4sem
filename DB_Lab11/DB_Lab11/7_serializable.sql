-- A ---
set transaction isolation level SERIALIZABLE 
begin transaction 
	delete AUDITORIUM where AUDITORIUM = '1234'
    insert AUDITORIUM values ('1234', 'ËÊ-Ê', 10, 'Ëó÷')
    update AUDITORIUM set AUDITORIUM_NAME = 'Ëó÷' where AUDITORIUM = '1234'
    select AUDITORIUM from AUDITORIUM where AUDITORIUM = '1234'
-------------------------- t1 -----------------
	select AUDITORIUM from AUDITORIUM where AUDITORIUM = '1234'
-------------------------- t2 ------------------ 
commit 	

--- B ---	
begin transaction 	  
	delete AUDITORIUM where AUDITORIUM_NAME = 'Ëó÷'; 
    insert AUDITORIUM values ('1234', 'ËÊ-Ê', 10, 'Ëó÷')
    update AUDITORIUM set AUDITORIUM_NAME = 'Ëó÷' where AUDITORIUM = '1234'
    select AUDITORIUM from AUDITORIUM  where AUDITORIUM = '1234'
-------------------------- t1 --------------------
commit

select AUDITORIUM from AUDITORIUM  where AUDITORIUM = '1234'
-------------------------- t2 -------------------