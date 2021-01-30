-- 問題: Write an SQL query that reports the number of posts reported yesterday for each report reason. Assume today is 2019-07-05.

select extra "report_reason", count(distinct post_id) "report_count" 
    from actions where action = 'report'and action_date = '2019-07-04' 
    group by extra 