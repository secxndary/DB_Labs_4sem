select ФИО, Страна, count(*) [Количество книг]
from AUTHORS
inner join BOOKS
on BOOKS.Автор = AUTHORS.ФИО
group by AUTHORS.ФИО, AUTHORS.Страна
having count(*) >= 2