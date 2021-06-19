-- Write an SQL query to find employee_id of all employees that directly or indirectly report their work to the head of the company.

-- 作法一：
-- 虛擬機Ａ：先用join找出manager=1的人 進階找上層manager=1的manager
with A as(
    select e2.employee_id from employees e1 
                          join employees e2 on e1.employee_id = e2.manager_id 
    where e1.employee_id = 1 or e1.manager_id = 1 )
-- 最後搜manager_id有間接連接到1且排除employee_id=1
select employee_id from employees where manager_id in (select employee_id from A) 
                                    and employee_id != 1

-- 作法二：
-- 和作法一很像，只是用三層where in去搜條件而已
select employee_id from employees 
where employee_id != manager_id 
  and manager_id in (select employee_id as "manager_id" from employees 
                     where manager_id = 1 or manager_id in (select employee_id as "manager_id" 
                                                            from employees where manager_id = 1))

-- 作法三：
-- 使用with recursive去做遞歸
-- 第一個select的n是anchor number代表開始值
-- 然後union all 第二個select為recursive number，代表一次跳多少格
-- where 是設定n的限制
with recursive cte as (
    select employee_id, 1 as n
    from   employees
    where  manager_id=1 and employee_id<>1
    union all
    select a.employee_id, n+1 as n
    from   employees a join cte b on (b.employee_id=a.manager_id) 
    where  n+1<4
)
select employee_id from cte
