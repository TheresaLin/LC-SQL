-- 1. get last year spend
-- 2. calculate the YoY rate
-- 3  group by year and product

with trans_year as(
    select year(transaction_date) as "year",
        product_id,
        sum(spend) as "curr_year_spend"
    from user_transactions
    group by 1, 2
), trans_pre_year as(
    select year,
        product_id,
        curr_year_spend,
        lag(curr_year_spend, 1) over(partition by product_id order by year) as "prev_year_spend"
    from trans_year
)

-- main query
select *,
    round((curr_year_spend/prev_year_spend-1)*100, 2) as "yoy_rate"
from trans_pre_year
order by product_id, year

