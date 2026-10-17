-- 這題規則很多:(1)店的產品都要超過3個
-- (2) 需要找出每家店imbalance ratio: 最低價產品得數量/最高價產品的數量
-- (3) 最低價產品得數量 > 最高價產品的數量

-- sol1 : 用max, min
-- 1. count the num of prodcut for each stores > 3 diff
-- 2. quantity for most expensive/ cheapest product
-- order by imbalance_ration desc, store_name asc
with pass_store as(
    select *
    from inventory
    where store_id in (
        select store_id
        from inventory
        group by 1
        having count(distinct product_name) >= 3
    )
),  price_table as(
    select store_id, 
        max(price) as max_price,
        min(price) as min_price
    from pass_store
    group by store_id
),  exp_table as(
    select ps.store_id, product_name as "most_exp_product", quantity as "most_exp_quan"
    from pass_store ps join price_table pt on ps.store_id = pt.store_id and ps.price = pt.max_price
),  cheap_table as(
    select ps.store_id, product_name as "cheapest_product", quantity as "cheapest_quan"
    from pass_store ps join price_table pt on ps.store_id = pt.store_id and ps.price = pt.min_price
)


-- main query: imbalance ratio = cheap/expensive
-- requirement: cheap_quan > most_exp_quan

select e.store_id, store_name, location, 
    most_exp_product,
    cheapest_product,
    round(cheapest_quan/most_exp_quan, 2) as "imbalance_ratio"

from exp_table e join cheap_table c on e.store_id = c.store_id
                 join stores s  on e.store_id = s.store_id
where cheapest_quan > most_exp_quan
order by 6 desc, 2

-- sol 2: 用rank 
-- 1. count the num of prodcut for each stores > 3 diff
-- 2. quantity for most expensive/ cheapest product
-- order by imbalance_ration desc, store_name asc
with pass_store as(
    select *
    from inventory
    where store_id in (
        select store_id
        from inventory
        group by 1
        having count(distinct product_name) >= 3
    )
),  expensive_table as(
    select inventory_id, store_id, product_name, quantity, 
        rank() over(partition by store_id order by price desc) as high_rnk
    from pass_store
), cheap_table as(
    select inventory_id, store_id, product_name, quantity, 
        rank() over(partition by store_id order by price) as "low_rnk"
    from pass_store
)

-- main query: imbalance ratio = cheap/expensive
-- requirement: cheap_quan > most_exp_quan
select e.store_id, store_name, location, 
    e.product_name as "most_exp_product",
    c.product_name as "cheapest_product",
    round(c.quantity/e.quantity,2) as "imbalance_ratio"

from expensive_table e join cheap_table c join stores s on e.store_id = c.store_id and e.store_id = s.store_id
where e.high_rnk = 1 and c.low_rnk = 1 and c.quantity > e.quantity
order by 6 desc, 2