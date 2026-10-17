-- Write a solution to report the difference between the number of apples and oranges sold each day.


select sale_date,
    sum(if(fruit = 'apples', sold_num, 0)) - sum(if(fruit = 'oranges', sold_num, 0)) as "diff"
from sales
group by 1
order by 1