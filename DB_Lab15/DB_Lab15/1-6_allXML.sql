
--------------------------------  0. RAW (TEACHER)  --------------------------------

-- ��� ��� ����� �������� ���� � �������, ������ ������ ���������� = ������� <row>, ������� 
-- �������� - �������� ����� �� ��������. ������� elements ������ ������� ���������� ���������
select ltrim(rtrim(t.TEACHER)) ������������, ltrim(rtrim(t.TEACHER_NAME)) ���,
	   ltrim(rtrim(t.GENDER)) ���, ltrim(rtrim(t.PULPIT)) �������
from TEACHER t 
where PULPIT = '����'
for xml raw('TEACHER'), type, root('TEACHERS_ISIT')





-------------------------------  1. PATH (TEACHER)  -------------------------------

-- ��� ����� ���� ��������� ��� �������� ���������, � ��� ��������� ("@atribut")
select ltrim(rtrim(t.TEACHER)) as "@ID", ltrim(rtrim(t.GENDER)) as "@GENDER",
	   ltrim(rtrim(t.TEACHER_NAME)) FIO, ltrim(rtrim(t.PULPIT)) PULPIT
from TEACHER t 
where PULPIT = '����'
for xml path ('TEACHER'), type, root('TEACHERS_ISIT')		--, elements	-- ��� ����� �� ������






-------------------------------  2. AUTO (AUDITORIUM)  -------------------------------

-- ��� ����� ������� ��������� �������� (AUDITORIUM_TYPE -> AUDITORIUM)
select ltrim(rtrim(AUDITORIUM.AUDITORIUM)) AUDITORIUM, 
	   ltrim(rtrim(AUDITORIUM_TYPE.AUDITORIUM_TYPE)) AUDITORIUM_TYPE,
	   AUDITORIUM_TYPE.AUDITORIUM_TYPENAME , AUDITORIUM.AUDITORIUM_CAPACITY 
from AUDITORIUM 
join AUDITORIUM_TYPE on AUDITORIUM_TYPE.AUDITORIUM_TYPE = AUDITORIUM.AUDITORIUM_TYPE
where AUDITORIUM_TYPE.AUDITORIUM_TYPENAME like '%�����%'
for xml auto, type, root('LECTION_AUDITORIUMS')






------------------------------  3. XML INSERT (TEACHER)  ------------------------------

--������ xml ���� �� ������ � ������� ������� TEACHER. �������� 0 = �������� �������� ��� �������
declare @docHandle int = 0,
        @xml varchar(2000) = '<?xml version="1.0" encoding="windows-1251" ?>
       <TEACHERS_ISIT> 
       <TEACHER TEACHER="����" TEACHER_NAME="���� ����������" GENDER="�" PULPIT="����" /> 
       <TEACHER TEACHER="����" TEACHER_NAME="���� �����������" GENDER="�" PULPIT="����" /> 
       <TEACHER TEACHER="����" TEACHER_NAME="���� ��������" GENDER="�" PULPIT="����" /> 
       </TEACHERS_ISIT>'
    exec sp_xml_preparedocument @docHandle output, @xml
    select * from openxml(@docHandle, '/TEACHERS_ISIT/TEACHER', 0)	--"insert TEACHER" to insert
    with ([TEACHER] char(5), [TEACHER_NAME] varchar(100), [GENDER] char(1), [PULPIT] char(20))	--TEACHER
    exec sp_xml_removedocument @docHandle





-------------------------------  4. XML INFO (STUDENT)  -------------------------------

delete from STUDENT where NAME = '�������� ���� �������������'


insert STUDENT (IDGROUP, NAME, BDAY, INFO) values
(5, '�������� ���� �������������', '2002-08-12', 
'<STUDENT>
	<PASSPORT SERIES="KH" NUMBER="2982505" DATE="21.01.2016" />
	<PHONE>442184582</PHONE>
	<ADRESS>
		<COUNTRY>��������</COUNTRY>
		<CITY>������</CITY>
		<STREET>����� ��������</STREET>
		<HOUSE>42</HOUSE>
		<APPARTEMENT>13</APPARTEMENT>
	</ADRESS>
</STUDENT>')


update STUDENT set INFO = 
'<STUDENT>
	<PASSPORT SERIES="KH" NUMBER="2982505" DATE="21.01.2016" />
	<PHONE>442184582</PHONE>
	<ADRESS>
		<COUNTRY>��������</COUNTRY>
		<CITY>������</CITY>
		<STREET>����� ��������</STREET>
		<HOUSE>42</HOUSE>
		<APPARTEMENT>1203</APPARTEMENT>
	</ADRESS>
</STUDENT>'
where INFO.value('(/STUDENT/ADRESS/APPARTEMENT)[1]', 'varchar(10)') = cast(13 as varchar(10))


select  NAME [���],
		INFO.value('(/STUDENT/PASSPORT/@SERIES)[1]', 'varchar(10)') �����,
		INFO.value('(/STUDENT/PASSPORT/@NUMBER)[1]', 'varchar(10)') �����,
		INFO.query('/STUDENT/ADRESS') �����
from STUDENT
where NAME = '�������� ���� �������������'








------------------------------  4. XML SCHEMA (STUDENT)  ----------------------------

drop xml schema collection Student

create xml schema collection Student as 
N'<?xml version="1.0" encoding="utf-16" ?>
<xs:schema attributeFormDefault="unqualified" elementFormDefault="qualified" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<xs:element name="STUDENT">  
		<xs:complexType>
			<xs:sequence>
				<xs:element name="PASSPORT" maxOccurs="1" minOccurs="1">
					<xs:complexType>
						<xs:attribute name="SERIES" type="xs:string" use="required" />
						<xs:attribute name="NUMBER" type="xs:unsignedInt" use="required"/>
						<xs:attribute name="DATE"  use="required" >  
							<xs:simpleType> 
								<xs:restriction base ="xs:string">
									<xs:pattern value="[0-9]{2}.[0-9]{2}.[0-9]{4}"/>
								</xs:restriction>
							</xs:simpleType>
						</xs:attribute>
					</xs:complexType> 
				</xs:element>
				<xs:element maxOccurs="3" name="PHONE" type="xs:unsignedInt"/>
				<xs:element name="ADRESS">
					<xs:complexType>
						<xs:sequence>
							<xs:element name="COUNTRY" type="xs:string" />
							<xs:element name="CITY" type="xs:string" />
							<xs:element name="STREET" type="xs:string" />
							<xs:element name="HOUSE" type="xs:string" />
							<xs:element name="APPARTEMENT" type="xs:string" />
						</xs:sequence>
					</xs:complexType>
				</xs:element>
			</xs:sequence>
		</xs:complexType>
	</xs:element>
</xs:schema>'


-- ��������� ����� � ������� �������
alter table STUDENT alter column INFO xml(Student)


-- �������� �������� �����
insert STUDENT(IDGROUP, NAME, BDAY, INFO) values
(5, '���������� ���', '2003-03-19', 
'<STUDENT>
	<PASSPORT SERIES="MB" NUMBER="2841943" DATE="11.07.2017" />
	<PHONE>293341834</PHONE>
	<ADRESS>
		<COUNTRY>��������</COUNTRY>
		<CITY>�����</CITY>
		<STREET>��������</STREET>
		<HOUSE>76</HOUSE>
		<APPARTEMENT>142</APPARTEMENT>
	</ADRESS>
</STUDENT>')


-- ��������� �������� �� ��������
insert STUDENT(IDGROUP, NAME, BDAY, INFO) values
(5, '������������ ��� 1 (DATE)', '2003-03-19', 
'<STUDENT>
	<PASSPORT SERIES="MB" NUMBER="2841943" DATE="2005-12-04" />
	<PHONE>293341834</PHONE>
	<ADRESS>
		<COUNTRY>��������</COUNTRY>
		<CITY>�����</CITY>
		<STREET>��������</STREET>
		<HOUSE>76</HOUSE>
		<APPARTEMENT>142</APPARTEMENT>
	</ADRESS>
</STUDENT>')

insert STUDENT(IDGROUP, NAME, BDAY, INFO) values
(5, '������������ ��� 2 (PHONES)', '2003-03-19', 
'<STUDENT>
	<PASSPORT SERIES="MB" NUMBER="2841943" DATE="11.07.2017" />
	<PHONE>293341834</PHONE>
	<PHONE>293341834</PHONE>
	<PHONE>293341834</PHONE>
	<PHONE>293341834</PHONE>
	<ADRESS>
		<COUNTRY>��������</COUNTRY>
		<CITY>�����</CITY>
		<STREET>��������</STREET>
		<HOUSE>76</HOUSE>
		<APPARTEMENT>142</APPARTEMENT>
	</ADRESS>
</STUDENT>')

insert STUDENT(IDGROUP, NAME, BDAY, INFO) values
(5, '������������ ��� 3 (COUNTRY)', '2003-03-19', 
'<STUDENT>
	<PASSPORT SERIES="MB" NUMBER="2841943" DATE="11.07.2017" />
	<PHONE>293341834</PHONE>
		<COUNTRY>��������</COUNTRY>
	<ADRESS>
		<CITY>�����</CITY>
		<STREET>��������</STREET>
		<HOUSE>76</HOUSE>
		<APPARTEMENT>142</APPARTEMENT>
	</ADRESS>
</STUDENT>')

insert STUDENT(IDGROUP, NAME, BDAY, INFO) values
(5, '������������ ��� 3 (PASSPORT)', '2003-03-19', 
'<STUDENT>
	<PHONE>293341834</PHONE>
	<ADRESS>
		<COUNTRY>��������</COUNTRY>
		<CITY>�����</CITY>
		<STREET>��������</STREET>
		<HOUSE>76</HOUSE>
		<APPARTEMENT>142</APPARTEMENT>
	</ADRESS>
</STUDENT>')