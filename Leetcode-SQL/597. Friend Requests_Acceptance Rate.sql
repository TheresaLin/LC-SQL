-- 問題: (FriendRequest朋友送出的，RequestAccepted接受邀請的，算接受率) 
-- Write an SQL query to find the overall acceptance rate of requests, which is the number of acceptance divided by the number of requests. Return the answer rounded to 2 decimals places.
-- 
select round(
    ifnull(
        (select count(*) from (select distinct requester_id, accepter_id from RequestAccepted) as A) 
        / 
        (select count(*) from (select distinct sender_id, send_to_id from FriendRequest) as B),
     0), 
2) as accept_rate;
