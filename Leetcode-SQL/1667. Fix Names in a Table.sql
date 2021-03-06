-- 問題: (讓名字字首大寫其他小寫)
-- Write an SQL query to fix the names so that only the first character is uppercase and the rest are lowercase.


-- 用substring()把字首改大寫，其他改小寫
-- 再用concat()把字首字尾合起來
select user_id, concat(upper(substring(name,1)), lower(substring(name,2))) "name" 
from users order by 1 
