
-- output: platform, experiment, num of exp

with platform_name as(
    SELECT 'Android' AS platform
    UNION ALL
    SELECT 'IOS' AS platform
    UNION ALL
    SELECT 'Web' AS platform
), experiment_name as(
    SELECT 'Reading' AS experiment_name
    UNION ALL
    SELECT 'Sports' AS activity
    UNION ALL
    SELECT 'Programming' AS activity
)

select platform, experiment_name, ifnull(count(experiment_id), 0) as "num_experiments"
from platform_name join experiment_name 
    left join experiments using(platform, experiment_name)
group by 1, 2
order by 1, 2