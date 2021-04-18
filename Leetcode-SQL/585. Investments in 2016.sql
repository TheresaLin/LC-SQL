-- 計算TIV_2016的總量，來自不同的TIV_2015且經緯度都不同(latitude and longitude are different)
-- Write a query to print the sum of all total investment values in 2016 (TIV_2016), to a scale of 2 decimal places, for all policy holders who meet the following criteria:
-- (1)Have the same TIV_2015 value as one or more other policyholders.
-- (2)Are not located in the same city as any other policyholder (i.e.: the (latitude, longitude) attribute pairs must be unique).


-- 首先TIV_2015是不同的，所以in(group by TIV_2015然後總數超過一個)代表有重複的TIV_2015都列處考量，替除掉只有出現一次的
-- 再來利用經緯度相加和相減可以同時比對兩筆數據(也可以用group_concat把兩筆數據集合在一起)
-- 然後not in(同個地點且同個TIV_2015)
select round(sum(TIV_2016),2) as "TIV_2016" from insurance i 
where TIV_2015 in (select TIV_2015 from insurance group by 1 having count(*)>1) and 
      (lat+lon, lat-lon) not in (select lat+lon, lat-lon from insurance i2 where i.Pid != i2.Pid)
