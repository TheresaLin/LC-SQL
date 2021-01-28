-- 問題: (找有最多employee的project)
-- Write an SQL query that reports all the projects that have the most employees.
-- 這題有點賤(approved但卻wrong)，因為答案可能有好幾個project有同樣數目且最多的employee，用max()和rank()不行，它們只會列出一個
-- 所以此題最好用dense_rank()+列出平名=1，因為可以排出多個第一名

select project_id 
       from(select project_id, dense_rank() over(order by count(employee_id) desc)"pro_rank" 
                from project group by project_id) A 
       where pro_rank = 1