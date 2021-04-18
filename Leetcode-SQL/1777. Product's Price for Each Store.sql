-- 問題: 由store欄位分出store1, store2, store3
-- Write an SQL query to find the price of each product in each store.

-- 這題技巧除了case when條件假設之外，前面加sum也很重要(可能因為group by才有意義)
select product_id, sum(case when store = 'store1' then price end) as "store1", 
                   sum(case when store = 'store2' then price end) as "store2", 
                   sum(case when store = 'store3' then price end) as "store3" 
from products group by 1