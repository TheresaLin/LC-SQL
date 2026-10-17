-- calculate the confirmation rate for each user, if null then 0


-- left join to get all the user_id
select s.user_id,
       round(ifnull(sum(if(action='confirmed',1,0))/(select count(action)),0),2) as "confirmation_rate"
from Signups s left join Confirmations c using(user_id)
group by 1
