-- 找從１到最大號中間沒有出現的ID
-- Write an SQL query to find the missing customer IDs. The missing IDs are ones that are not in the Customers table but are in the range between 1 and the maximum customer_id present in the table.

-- Use recursive table to find ids from 1 to the maximum ids
with recursive A as(
    select 1 as "ids" from customers
    union all
    select ids + 1
    from A
    where ids < (select max(customer_id) as "ids" from customers)
)
-- Query id that does not appear
select distinct ids from A where ids not in (select customer_id as "ids" from customers)