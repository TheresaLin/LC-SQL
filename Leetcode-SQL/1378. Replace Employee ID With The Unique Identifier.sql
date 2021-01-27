-- 問題: Write an SQL query to show the unique ID of each user, If a user doesn't have a unique ID replace just show null.
-- left join和left outer join用法一樣，但是left join會比left outer join時間複雜度還低(優先使用left join)
select unique_id,name from employees e left join employeeUNI UNI on UNI.id = e.id

select unique_id,name from employees e left outer join employeeUNI UNI on UNI.id = e.id