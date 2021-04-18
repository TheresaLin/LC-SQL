-- 問題: (找每間公司薪水中位數的人)
-- Write a SQL query to find the median salary of each company. Bonus points if you can solve it without using any built-in SQL functions.


-- 這題要用row_number()，不能用rank()，因為rank有相同salary會一樣排名的風險
-- 然後中位數就是count() over(partition by)/2
-- 如果company裡面的人總數是偶數，要跑出中間兩個人，奇數就只要一個人
select id, company, salary 
from(select id, company, salary, 
            row_number() over(partition by company order by salary desc, id desc) "salary_rank", 
            count(*) over(partition by company) "count_num" from employee)A 
where salary_rank >= count_num/2 and salary_rank <= count_num/2+1 