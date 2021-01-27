-- 問題: (排名) Write a SQL query to rank scores.
-- 要多一列排名要用rank() over(partition by 要分類的組 order by 要排序的數值)，dense_rank()不算重複的名次

-- 後面多個order by時間複雜度居然降低了 
select score "score", dense_rank() over(order by score desc) "Rank" from Scores order by score desc;
-- 這個一樣能跑出來但是運行時間較長
select score "score", dense_rank() over(order by score desc) "Rank" from Scores;