-- 問題: (計算每天不同品牌的車的lead_id和partner_id數量)
-- Write an SQL query that will, for each date_id and make_name, return the number of distinct lead_id's and distinct partner_id's.

select date_id, make_name, count(distinct lead_id) as "unique_leads", count(distinct partner_id) as "unique_partners" 
from DailySales group by 1,2 