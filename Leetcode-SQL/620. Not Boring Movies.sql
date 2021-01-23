-- 問題: (不無聊又是奇數的電影，評分從高至低排列)
-- Please write a SQL query to output movies with an odd numbered ID and a description that is not 'boring'. Order the result by rating.
-- 可以用 mod(id,2)=1 或 id%2=1 來表示奇數，由高至低記得加desc

select * from cinema where description != "boring" and id%2=1 order by rating desc