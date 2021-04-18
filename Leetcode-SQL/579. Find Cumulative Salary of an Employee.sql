-- 問題: (算連續三個月的累加薪水，並去除掉最近的一個月)
-- Write a SQL to get the cumulative sum of an employee's salary over a period of 3 months 
-- but exclude the most recent month.


-- 先把最後一個月去除掉，subquery查出最後一個月，並且必定要連結外面query的id 
-- sum() over()可以實現隨著月份累加salary
-- rows between 2 preceding and current row代表前兩列及當前列
select id, month, sum(salary) over(partition by id order by month 
                                   rows between 2 preceding and current row) as "salary" 
from employee e1 
where month not in (select max(month) from employee e2 
                    where e1.id=e2.id group by id) 
order by 1 asc, 2 desc