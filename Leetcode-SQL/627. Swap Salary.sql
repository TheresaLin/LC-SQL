-- 問題: update性別男女交換
-- Given a table salary, such as the one below, that has m=male and f=female values. Swap all f and m values (i.e., change all f values to m and vice versa) with a single update statement and no intermediate temp table.
-- update 表格 set 欄位 where
update salary set sex = if(sex='m','f','m')


