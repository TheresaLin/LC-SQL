-- 問題: (每個product的total quantity)Write an SQL query that reports the total quantity sold for every product id.
-- 因為有兩張表所以join了
select s.product_id, sum(quantity) "total_quantity" from product p join sales s on p.product_id=s.product_id 
                                                    group by product_id
-- 後來發現一張表就可以解決的
select product_id, sum(quantity) "total_quantity" from sales group by product_id