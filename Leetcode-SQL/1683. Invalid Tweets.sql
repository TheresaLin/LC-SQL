-- 問題: (列出content長度大於15的tewwt_id)
-- Write an SQL query to find the IDs of the invalid tweets. The tweet is invalid if the number of characters used in the content of the tweet is strictly greater than 15.

select tweet_id from tweets where length(content)>15
