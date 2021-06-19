-- Write an SQL query to find the total score for each gender at each day.


-- 這題很簡單只要用sum() over()就可以以性別分類,算出累加的points
select gender, day, 
       sum(score_points) over(partition by gender order by day) as "total" from scores