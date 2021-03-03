-- 問題: (算出每台machine的平均運行時間)
-- There is a factory website that has several machines each running the same number of processes. 
-- Write an SQL query to find the average time each machine takes to complete a process.

-- 這題有點特別，平均運行時間用end-start，在此用case when，start的timestamp加上負號然後就可以算sum(end-start)
select machine_id, round(sum(case when activity_type = "start" then -timestamp else timestamp end)/
                         count(distinct process_id),3) as "processing_time" 
from activity group by 1