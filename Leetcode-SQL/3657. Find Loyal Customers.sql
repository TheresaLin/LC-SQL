-- >=30 days, >=3 purchase, refund rate<20%
-- refunds/total trans
-- order by customer_id

-- 1. max(transaction_date) - min(transaction_date) group by customer_id
-- 2. count(transaction_id) >= 3 group by customer_id
-- 3. count(refund) / count(all trans) < 20% group by customer_id

with filtered_customer as (
    select customer_id,
        min(transaction_date) as "min_date", 
        max(transaction_date) as "max_date",
        sum(if(transaction_type = "refund", 1, 0)) as "refund_num",
        count(transaction_id) as "total_trans"
    from customer_transactions
    group by customer_id
    having datediff(max_date, min_date) >= 30 and total_trans >= 3 and
         refund_num/total_trans < 0.2 
)

-- main query
select customer_id
from filtered_customer
-- where datediff(max_date, min_date) >= 30 and total_trans >= 3 and
--         refund_num/total_trans < 0.2 