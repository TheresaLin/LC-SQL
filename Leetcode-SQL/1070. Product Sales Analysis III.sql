-- 問題：列出所有產品第一年的資料
-- Write an SQL query that selects the product id, year, quantity, and price for the first year of every product sold.


-- 不能在主查詢就用min(year)會無法正確列出第一年的資料
-- 在where那邊搜出第一年的product_id,year
select product_id, year as "first_year", quantity, price from sales 
where (product_id, year) in (select product_id, min(year) from sales group by 1)