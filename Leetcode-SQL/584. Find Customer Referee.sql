-- 題目：超簡單！就是找referee_id不是2或是空值的name

select name
from Customer
where referee_id != 2 or referee_id is null