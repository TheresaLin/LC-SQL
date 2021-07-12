-- 依照每個商品每年列出銷售額
-- Write an SQL query to report the Total sales amount of each item for each year, with corresponding product name, product_id, product_name and report_year.



-- Ａ表遞歸，把每個product的開始日期結束日期的每一天都遍歷出來
with recursive A as (
    select product_id, period_start as "all_date", period_end, average_daily_sales from sales
    union all
    select product_id, date_add(all_date, interval 1 day), period_end, average_daily_sales
    from A
    where all_date < period_end
)

-- 最後把遍歷出的依照product和年份加總
select A.product_id, product_name, date_format(all_date, "%Y")as "report_year", 
       sum(average_daily_sales) as "total_amount" 
from A join product p on A.product_id = p.product_id group by 1,3 order by 1,3