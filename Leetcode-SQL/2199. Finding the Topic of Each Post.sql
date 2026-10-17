--考group_concat, concat or regulqr expression
-- left join on 
select post_id, 
    ifnull(group_concat(distinct topic_id),'Ambiguous!') as "topic"
from posts p left join keywords 
    on concat(' ',lower(p.content),' ') like concat('% ', lower(word), ' %')
group by 1