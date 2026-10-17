-- order by borrower desc, title 
-- 1. total_copies - (number of copies was not returned yet group by book_id)
-- 2. result

with borrow_num as(
    select book_id, 
        title,
        author,
        genre,
        publication_year,
        total_copies,
        sum(if(return_date is null, 1, 0)) as "current_borrowers"
    from borrowing_records b join library_books l using(book_id)
    group by book_id     
)
-- main query
select book_id, 
    title,
    author,
    genre,
    publication_year,
    current_borrowers
from borrow_num
where total_copies - current_borrowers = 0
order by 6 desc, 2