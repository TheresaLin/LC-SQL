-- 問題：比較department_month_avg_salary有沒有比month_avg_salary高，有的話表示higher，一樣表示same，比較小表示lower
-- Write a query to display the comparison result (higher/lower/same) of the average salary of employees in a department to the company's average salary.

-- 先搜尋兩張表Ａ(dep_avg，特別注意group by的順序)、Ｂ(mon_avg)
-- 最後用case when來定義comparision那一欄
-- 如果不想要from兩個表那麼複雜，可以用with虛擬表，最後再call建的虛擬表
select A.pay_month, A.department_id, case when A.dep_avg > B.mon_avg then "higher"
                                          when A.dep_avg < B.mon_avg then "lower"
                                          else "same" end as "comparison"
from (select date_format(pay_date, '%Y-%m') as "pay_month", department_id, avg(amount) as "dep_avg" 
      from salary s join employee e on s.employee_id = e.employee_id group by 2,1) A 
join (select date_format(pay_date, '%Y-%m') as "pay_month", avg(amount) as "mon_avg" 
      from salary s join employee e on s.employee_id = e.employee_id group by 1) B 
on A.pay_month = B.pay_month



-- 用with的寫法
with A as(
select date_format(pay_date, '%Y-%m') as "pay_month", department_id, avg(amount) as "dep_avg" 
      from salary s join employee e on s.employee_id = e.employee_id group by 2,1
),
b as(
select date_format(pay_date, '%Y-%m') as "pay_month", avg(amount) as "mon_avg" 
      from salary s join employee e on s.employee_id = e.employee_id group by 1
)

select A.pay_month, A.department_id, case when A.dep_avg > B.mon_avg then "higher"
                                          when A.dep_avg < B.mon_avg then "lower"
                                          else "same" end as "comparison"
from A join B on A.pay_month = B.pay_month




-- use (1) virtual table to print the average salary for each month
-- (2) calculate the avg salary in department 
with avg_salary as(
    select date_format(pay_date, "%Y-%m") as "pay_month", avg(amount) as avg_salary
    from salary
    group by 1
), avg_salary_dep as(
    select date_format(pay_date, "%Y-%m") as "pay_month", department_id, 
         avg(amount) as dep_avg_salary
    from salary join employee using(employee_id)
    group by 1, 2
)
-- main query: compare the ave_salary
select pay_month, department_id, 
    case when dep_avg_salary < avg_salary then "lower"
         when dep_avg_salary = avg_salary then "same"
         else "higher" end as "comparison"
from avg_salary join avg_salary_dep using(pay_month)