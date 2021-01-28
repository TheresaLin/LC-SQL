-- 問題: 列出只賣在2019-01-01 到 2019-03-31 之間的商品
-- Write an SQL query that reports the products that were only sold in spring 2019. 
-- That is, between 2019-01-01 and 2019-03-31 inclusive.
-- 注意日期轉換字符cast(****-**-** as date)
select distinct s.product_id, p.product_name 
    from product p join sales s on p.product_id=s.product_id 
    where s.product_id not in(
        select product_id from sales 
            where sale_date not between cast('2019-01-01' as date) and cast('2019-03-31' as date)) 