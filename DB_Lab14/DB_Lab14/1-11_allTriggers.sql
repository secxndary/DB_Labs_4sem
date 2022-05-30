---------------------------  0. Create Table  ---------------------------

create table TR_AUDIT
(
	ID int identity(1, 1),										-- ID
	STMT varchar(20) check (STMT in ('INS', 'DEL', 'UPD')),		-- DML operator name
	TRNAME varchar(50),											-- trigger name
	CC varchar(300)												-- comment
)




--------------------------  1. INSERT Trigger  --------------------------

create trigger TR_TEACHER_INS on TEACHER after insert			-- ВЕРНУТЬ
as declare @TEACHER char(10), @TEACHER_NAME varchar(100),
		   @GENDER char(1), @PULPIT char(20), @IN varchar(300)
print 'Выполнена операция INSERT'
set @TEACHER = (select TEACHER from INSERTED)
set @TEACHER_NAME = (select TEACHER_NAME from INSERTED)
set @GENDER = (select GENDER from INSERTED)
set @PULPIT = (select PULPIT from INSERTED)
set @IN = ltrim(rtrim(@TEACHER)) + ' ' + ltrim(rtrim(@TEACHER_NAME)) + 
		  ' ' + ltrim(rtrim(@GENDER)) + ' ' + ltrim(rtrim(@PULPIT))
insert into TR_AUDIT (STMT, TRNAME, CC) values ('INS', 'TR_TEACHER_INS', @IN)



insert into TEACHER values ('БЛДД', 'Белодед Николай Иванович', 'м', 'ИСиТ')
select * from TR_AUDIT order by ID







--------------------------  2. DELETE Trigger  --------------------------

create trigger TR_TEACHER_DEL on TEACHER after delete
as declare @TEACHER char(10), @TEACHER_NAME varchar(100),
		   @GENDER char(1), @PULPIT char(20), @IN varchar(300)
print 'Выполнена операция DELETE'
set @TEACHER = (select TEACHER from DELETED)
set @TEACHER_NAME = (select TEACHER_NAME from DELETED)
set @GENDER = (select GENDER from DELETED)
set @PULPIT = (select PULPIT from DELETED)
set @IN = ltrim(rtrim(@TEACHER)) + ' ' + ltrim(rtrim(@TEACHER_NAME)) + 
		  ' ' + ltrim(rtrim(@GENDER)) + ' ' + ltrim(rtrim(@PULPIT))
insert into TR_AUDIT (STMT, TRNAME, CC) values ('DEL', 'TR_TEACHER_DEL', @IN)



delete from TEACHER where TEACHER = 'БЛДД'
select * from TR_AUDIT order by ID






--------------------------  3. UPDATE Trigger  --------------------------

create trigger TR_TEACHER_UPD on TEACHER after update
as declare @TEACHER char(10), @TEACHER_NAME varchar(100),
		   @GENDER char(1), @PULPIT char(20), @IN varchar(300)
print 'Выполнена операция UPDATE'

set @TEACHER = (select TEACHER from DELETED where TEACHER is not null)
set @TEACHER_NAME = (select TEACHER_NAME from DELETED where TEACHER_NAME is not null)
set @GENDER = (select GENDER from DELETED where GENDER is not null)
set @PULPIT = (select PULPIT from DELETED where PULPIT is not null)
set @IN = ltrim(rtrim(@TEACHER)) + ' ' + ltrim(rtrim(@TEACHER_NAME)) + 
		  ' ' + ltrim(rtrim(@GENDER)) + ' ' + ltrim(rtrim(@PULPIT)) + ' -> '

set @TEACHER = (select TEACHER from INSERTED where TEACHER is not null)
set @TEACHER_NAME = (select TEACHER_NAME from INSERTED where TEACHER_NAME is not null)
set @GENDER = (select GENDER from INSERTED where GENDER is not null)
set @PULPIT = (select PULPIT from INSERTED where PULPIT is not null)
set @IN = @IN + ltrim(rtrim(@TEACHER)) + ' ' + ltrim(rtrim(@TEACHER_NAME)) + 
		  ' ' + ltrim(rtrim(@GENDER)) + ' ' + ltrim(rtrim(@PULPIT))

insert into TR_AUDIT (STMT, TRNAME, CC) values ('UPD', 'TR_TEACHER_UPD', @IN)



update TEACHER set TEACHER_NAME = 'Делобед Николай Иванович' where TEACHER = 'БЛДД'
select * from TR_AUDIT order by ID







-----------------------------  4. DML Trigger  -----------------------------

create trigger TR_TEACHER on TEACHER after insert, update, delete			-- ВЕРНУТЬ
as declare @TEACHER char(10), @TEACHER_NAME varchar(100),
		   @GENDER char(1), @PULPIT char(20), @IN varchar(300)

if (select count(*) from INSERTED) > 0 and (select count(*) from DELETED) > 0
begin
	print 'Выполнена операция UPDATE'
	set @TEACHER = (select TEACHER from DELETED where TEACHER is not null)
	set @TEACHER_NAME = (select TEACHER_NAME from DELETED where TEACHER_NAME is not null)
	set @GENDER = (select GENDER from DELETED where GENDER is not null)
	set @PULPIT = (select PULPIT from DELETED where PULPIT is not null)
	set @IN = ltrim(rtrim(@TEACHER)) + ' ' + ltrim(rtrim(@TEACHER_NAME)) + 
			  ' ' + ltrim(rtrim(@GENDER)) + ' ' + ltrim(rtrim(@PULPIT)) + ' -> '

	set @TEACHER = (select TEACHER from INSERTED where TEACHER is not null)
	set @TEACHER_NAME = (select TEACHER_NAME from INSERTED where TEACHER_NAME is not null)
	set @GENDER = (select GENDER from INSERTED where GENDER is not null)
	set @PULPIT = (select PULPIT from INSERTED where PULPIT is not null)
	set @IN = @IN + ltrim(rtrim(@TEACHER)) + ' ' + ltrim(rtrim(@TEACHER_NAME)) + 
			  ' ' + ltrim(rtrim(@GENDER)) + ' ' + ltrim(rtrim(@PULPIT))

	insert into TR_AUDIT (STMT, TRNAME, CC) values ('UPD', 'TR_TEACHER', @IN)
end

if (select count(*) from INSERTED) > 0 and (select count(*) from DELETED) = 0
begin
	print 'Выполнена операция INSERT'
	set @TEACHER = (select TEACHER from INSERTED)
	set @TEACHER_NAME = (select TEACHER_NAME from INSERTED)
	set @GENDER = (select GENDER from INSERTED)
	set @PULPIT = (select PULPIT from INSERTED)
	set @IN = ltrim(rtrim(@TEACHER)) + ' ' + ltrim(rtrim(@TEACHER_NAME)) + 
			  ' ' + ltrim(rtrim(@GENDER)) + ' ' + ltrim(rtrim(@PULPIT))
	insert into TR_AUDIT (STMT, TRNAME, CC) values ('INS', 'TR_TEACHER', @IN)
end

if (select count(*) from INSERTED) = 0 and (select count(*) from DELETED) > 0
begin
	print 'Выполнена операция DELETE'
	set @TEACHER = (select TEACHER from DELETED)
	set @TEACHER_NAME = (select TEACHER_NAME from DELETED)
	set @GENDER = (select GENDER from DELETED)
	set @PULPIT = (select PULPIT from DELETED)
	set @IN = ltrim(rtrim(@TEACHER)) + ' ' + ltrim(rtrim(@TEACHER_NAME)) + 
			  ' ' + ltrim(rtrim(@GENDER)) + ' ' + ltrim(rtrim(@PULPIT))
	insert into TR_AUDIT (STMT, TRNAME, CC) values ('DEL', 'TR_TEACHER', @IN)
end




insert into TEACHER values ('НРКВЧ', 'Наркевич Аделина Сергеевна', 'ж', 'ИСиТ')
delete from TEACHER where TEACHER = 'НРКВЧ'
update TEACHER set TEACHER_NAME = 'Белодед Николай Иванович' where TEACHER = 'БЛДД'
select * from TR_AUDIT order by ID







-----------------------------  5. Columns constraint  -----------------------------

insert into TEACHER values ('кто то там', 'тестовый челик', 'н', 'ПОиТ')
select * from TR_AUDIT order by ID	--не выполняется из-за ограничения целостности check(GENDER)






-----------------------------  6. Triggers Priority  -----------------------------

create trigger TR_TEACHER_DEL1 on TEACHER after delete
as declare @TEACHER char(10), @TEACHER_NAME varchar(100),
		   @GENDER char(1), @PULPIT char(20), @IN varchar(300)
print 'DELETE Trigger 1'
set @IN = 'Trigger Normal Priority'
insert into TR_AUDIT (STMT, TRNAME, CC) values ('DEL', 'TR_TEACHER_DEL1', @IN)


create trigger TR_TEACHER_DEL2 on TEACHER after delete
as declare @TEACHER char(10), @TEACHER_NAME varchar(100),
		   @GENDER char(1), @PULPIT char(20), @IN varchar(300)
print 'DELETE Trigger 2'
set @IN = 'Trigger Low Priority'
insert into TR_AUDIT (STMT, TRNAME, CC) values ('DEL', 'TR_TEACHER_DEL2', @IN)


create trigger TR_TEACHER_DEL3 on TEACHER after delete
as declare @TEACHER char(10), @TEACHER_NAME varchar(100),
		   @GENDER char(1), @PULPIT char(20), @IN varchar(300)
print 'DELETE Trigger 3'
set @IN = 'Trigger Highest Priority'
insert into TR_AUDIT (STMT, TRNAME, CC) values ('DEL', 'TR_TEACHER_DEL3', @IN)


------------------  Check All Triggers  ------------------

select t.name, e.type_desc 
from sys.triggers t join  sys.trigger_events e  
on t.object_id = e.object_id  
where OBJECT_NAME(t.parent_id) = 'TEACHER' and e.type_desc = 'DELETE'


--------------------  Change Priority  -------------------

exec SP_SETTRIGGERORDER @triggername = 'TR_TEACHER_DEL3', @order = 'First', @stmttype = 'DELETE'
exec SP_SETTRIGGERORDER @triggername = 'TR_TEACHER_DEL2', @order = 'Last',  @stmttype = 'DELETE'


---------------------  Check changes  --------------------

delete from TEACHER where TEACHER = 'БЛДД'
select * from TR_AUDIT order by ID









----------------------------  7. Triggers Transactions  ----------------------------

create trigger TR_TEACHER_TRAN on TEACHER after insert					-- ВЕРНУТЬ
as declare @TEACHER char(10), @TEACHER_NAME varchar(100),
		   @GENDER char(1), @PULPIT char(20), @IN varchar(300)
print 'Transaction Trigger'
set @TEACHER = (select TEACHER from INSERTED)
set @TEACHER_NAME = (select TEACHER_NAME from INSERTED)
set @GENDER = (select GENDER from INSERTED)
set @PULPIT = (select PULPIT from INSERTED)
set @IN = ltrim(rtrim(@TEACHER)) + ' ' + ltrim(rtrim(@TEACHER_NAME)) + 
		  ' ' + ltrim(rtrim(@GENDER)) + ' ' + ltrim(rtrim(@PULPIT))
if @TEACHER_NAME like '%дед%'
begin
	insert into TR_AUDIT (STMT, TRNAME, CC) values 
	('INS', 'TR_TEACHER_TRAN', 'Это всё равно не добавится в таблицу')
	raiserror('Невозможно добавить некоторого деда. Он сам приходит', 10, 1)
	rollback
end



insert into TEACHER values ('ДЛББ', 'Чернодед Николай Иванович', 'м', 'ИСиТ')
select * from TR_AUDIT order by ID








----------------------------  8. Instead Of Triggers  ----------------------------

create trigger TR_TEACHER_INSTEAD_OF on TEACHER instead of delete
as raiserror('Удаление запрещено, дядя', 10, 1)
return


set nocount on
delete from TEACHER where TEACHER = 'МРЗ'
select * from TR_AUDIT order by ID	-- новый триггер не добавился ибо удаление не произошло








-----------------------------  9. DDL Block Trigger  -----------------------------

create trigger TR_TEACHER_DDL on database 
for DDL_DATABASE_LEVEL_EVENTS  as   
declare @EVENT_TYPE varchar(50) = EVENTDATA().value('(/EVENT_INSTANCE/EventType)[1]', 'varchar(50)')
declare @OBJ_NAME varchar(50) = EVENTDATA().value('(/EVENT_INSTANCE/ObjectName)[1]', 'varchar(50)')
declare @OBJ_TYPE varchar(50) = EVENTDATA().value('(/EVENT_INSTANCE/ObjectType)[1]', 'varchar(50)')
if @OBJ_NAME = 'TEACHER' 
begin
	print 'Тип события: ' + cast(@EVENT_TYPE as varchar)
	print 'Имя объекта: ' + cast(@OBJ_NAME as varchar)
	print 'Тип объекта: ' + cast(@OBJ_TYPE as varchar)
	raiserror('Операции с таблицей TEACHER запрещены.', 16, 1)
	rollback  
end


alter table TEACHER drop column TEACHER_NAME	-- выполнение запрещено









-----------------------------  11*. Weather Table  -----------------------------
use tempdb

drop trigger TR_WEATHER
drop table WEATHER

create table WEATHER
(
	CITY varchar(30),
	DATE_FROM datetime,
	DATE_TO datetime,
	TEMP float
)


create trigger TR_WEATHER on WEATHER for insert, update
as declare @CITY varchar(30), @FROM datetime, @TO datetime, @TEMP float
set @CITY = (select CITY from INSERTED)
set @FROM = (select DATE_FROM from INSERTED)
set @TO = (select DATE_TO from INSERTED)
set @TEMP = (select TEMP from INSERTED)

declare @COUNT_ERROR int = (select count(*) from WEATHER 
							where CITY = @CITY 
							and (@FROM between DATE_FROM and DATE_TO) 
							and (@TO between DATE_FROM and DATE_TO))
if @COUNT_ERROR > 1
begin
	raiserror('Ошибка! Невозможно добавить прогноз погоды на существующее расписание.', 16, 1)
	rollback
end
return




insert into WEATHER values ('Минск', '01-01-2022 00:00', '01-01-2022 23:59', -10)
insert into WEATHER values ('Минск', '02-01-2022 00:00', '02-01-2022 23:59', -10)
insert into WEATHER values ('Минск', '01-01-2022 00:00', '01-01-2022 23:59', -2)
insert into WEATHER values ('Минск', '01-01-2022 00:00', '01-01-2022 21:59', -10)

select * from WEATHER