-- 1. Recognize the amount is odd or even
-- 2. sum them up group by date
-- order by date

select transaction_date,
    sum(if(amount%2 = 1, amount, 0)) as "odd_sum",
    sum(if(amount%2 = 0, amount, 0)) as "even_sum"
from transactions
group by 1
order by 1