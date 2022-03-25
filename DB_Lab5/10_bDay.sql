select BDAY[Дата рождения], DAY(BDAY)[Одинаковое число] 
from STUDENT a
where DAY(a.BDAY) = (select top 1 DAY(aa.BDAY)from STUDENT as aa);