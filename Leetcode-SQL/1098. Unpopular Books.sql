-- 問題：列出出版超過一個月，且去年銷售少於10本的書
-- Write an SQL query that reports the books that have sold less than 10 copies in the last year, 
-- excluding books that have been available for less than 1 month from today. Assume today is 2019-06-23.

-- 首先先排除一個月內出版的書，再排除去年銷售大於10本的書
select distinct book_id, name from books
where book_id not in (select distinct book_id 
                      from books where available_from > '2019-05-23') and
      book_id not in (select book_id from orders 
                      where dispatch_date between '2018-06-23' and '2019-06-23' group by 1 
                      having sum(quantity) >= 10 )


-- 別人的寫法，先join on把一年內銷售的書列出:datediff(日期,dispatch_date)<365,如果沒有代表去年完全0銷售，所以要用ifNull()排除
-- 再用where把出版超過30天的書都納入，最後用having排除銷售<10本的書
select b.book_id, name
from books b left join orders o on b.book_id = o.book_id
and IfNull(Datediff('2019-06-23', O.dispatch_date),0) < 365  
-- Put the requirement in "On" to keep the Null value which needs to be converted to 0 copy

where Datediff('2019-06-23', available_from) > 30
-- Put the requirement in "Where" to remove the books
  
group by 1  having IfNull(sum(quantity),0) < 10
-- Make sure Null values are included.