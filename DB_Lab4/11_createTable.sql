use Lab4;

create table TIMETABLE (
ID int not null primary key,
IDGROUP int not null foreign key references GROUPS(IDGROUP),
AUDITORIUM char(20) not null foreign key references AUDITORIUM(AUDITORIUM),
SUBJECT_NAME char(10) not null foreign key references SUBJECT(SUBJECT),
TEACHER char(10) not null foreign key references TEACHER(TEACHER),
DATE_WEEK date not null,
LESSON int not null
);