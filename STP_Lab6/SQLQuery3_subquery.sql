select a.*, b.Count
from AUTHORS as a,
(select Author, count(*) as Count
from BOOKS group by Author
having count(*) >= 2) as b
where a.Name = b.Author