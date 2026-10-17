-- 1. has_start: start with "ATG"
-- 2. has_stop: end by "TAA", "TAG", "TGA"
-- 3. has_atat: contain "ATAT"
-- 4. has_ggg: contain "GGG"

select *,
    if(dna_sequence like "ATG%", 1, 0) as "has_start",
    case when dna_sequence like "%TAA" then 1
         when dna_sequence like "%TAG" then 1
         when dna_sequence like "%TGA" then 1
         else 0 end as "has_stop",
    if(dna_sequence like "%ATAT%", 1, 0) as "has_atat",
    if(dna_sequence like "%GGG%", 1, 0) as "has_ggg"
from samples
order by sample_id