-- 問題: (兩個表bonus,employee) Select all employee's name and bonus whose bonus is < 1000.
-- employee表內有但bonus表內沒有的人也要列出，所以要用employee left outer join bonus(概念:https://www.w3schools.com/sql/sql_join_left.asp)
-- bonus為空用IS NULL

select name, bonus from employee e left outer join bonus b on e.empid = b.empid 
where bonus<1000 or bonus IS NULL