-- 問題: (列出每個project中employee有最高資歷的)
-- Write an SQL query that reports the most experienced employees in each project. 
-- In case of a tie, report all employees with the maximum number of experience years.
-- 主要寫過1076就會寫這題了一樣用dense)rank()
-- 比較值得注意的是搭配partition by，因為order by裡面沒有用group by()的count()、max()之類的，可以和第1082題做比較
-- 此題最好用dense_rank()+列出平名=1，因為可以排出多個第一名
select project_id, employee_id 
    from(select project_id, p.employee_id,
         dense_rank() over(partition by project_id order by experience_years desc) "r" 
                from project p join employee e on p.employee_id=e.employee_id) A where r = 1