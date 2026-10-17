-- country avg call > avg call
with all_call as(
    select 
        caller_id as "call_id",
        duration
    from calls
    union all
    select 
        callee_id as "call_id",
        duration
    from calls    
)


select distinct co.name as "country"
from all_call c join person p on c.call_id = p.id 
    join country co on substring(p.phone_number, 1, 3) = co.country_code
group by co.name
having avg(duration) > (select avg(duration) from calls)