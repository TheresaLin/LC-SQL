
-- free -> paid
-- free : avg daily activity rate 
-- paid : avg daily activity rate
-- order by user_id 
-- 1. filter out the user cancel after free_trail
-- 2. calculation

with all_act as(
select *, 
    lead(activity_type, 1) over(partition by user_id order by activity_date) as "next_activity"
from userActivity    
), non_include_user as(
    select distinct user_id
    from all_act
    where activity_type = "free_trial" and next_activity = "cancelled"
)

-- main query: filter out the users not buying the paln after free trail
-- calculate the trial_avg_duration and paid_avg_duration
select user_id,
    round(sum(if(activity_type='free_trial',activity_duration,0))/sum(if(activity_type='free_trial', 1, 0)), 2) as "trial_avg_duration",
    round(sum(if(activity_type='paid',activity_duration,0))/sum(if(activity_type='paid', 1, 0)), 2) as "paid_avg_duration"
from UserActivity

where user_id not in (select user_id from non_include_user)
group by user_id


----------------- sol 2 (without virtual table)---------------------
-- free -> paid
-- free : avg daily activity rate 
-- paid : avg daily activity rate
-- order by user_id 


-- main query: filter out the users not buying the paln after free trail
-- calculate the trial_avg_duration and paid_avg_duration
select user_id,
    round(sum(if(activity_type='free_trial',activity_duration,0))/sum(if(activity_type='free_trial', 1, 0)), 2) as "trial_avg_duration",
    round(sum(if(activity_type='paid',activity_duration,0))/sum(if(activity_type='paid', 1, 0)), 2) as "paid_avg_duration"
from UserActivity
group by user_id
having paid_avg_duration is not null