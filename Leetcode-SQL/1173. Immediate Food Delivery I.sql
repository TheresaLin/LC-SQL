-- 問題: Write an SQL query to find the percentage of immediate orders in the table, rounded to 2 decimal places.

select round(
        (select count(delivery_id) from delivery where order_date=customer_pref_delivery_date)
        /count(delivery_id)*100,2) "immediate_percentage" from delivery

