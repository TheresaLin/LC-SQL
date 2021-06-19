-- Write an SQL query to find the start and end number of continuous ranges in table Logs.


-- 此題參照1225題就會做得很快，用rank減log_id連續數字就會被分在同一組，藉此找min and max求start and end
with A as(
    select log_id, log_id - rank() over(order by log_id) as "team" from logs
    )
select min(log_id) as "start_id", max(log_id) as "end_id" from A group by team