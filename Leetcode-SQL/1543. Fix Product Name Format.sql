-- 問題: (主要是改資料的格式)
-- Write an SQL query to report
--      product_name in lowercase without leading or trailing white spaces.
--      sale_date in the format ('YYYY-MM') 
--      total the number of times the product was sold in this month.
--      Return the result table ordered by product_name in ascending order, in case of a tie order it by sale_date in ascending order.

-- 要點: trim():用於去除空格，date_format(, '%Y-%m')
select trim(lower(product_name)) as "product_name", 
        date_format(sale_date, '%Y-%m') as "sale_date", 
        count(sale_id) as "total" 
from sales group by 1,2 order by 1,2