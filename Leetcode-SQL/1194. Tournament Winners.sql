-- 找每隊中分數最高的player，平手則id較小的那位
-- Write an SQL query to find the winner in each group.


-- 祝提虛擬表層層相扣，計算完總分然後排名然後再查詢
-- 虛擬表Ａ：先把第一個玩家第二個玩家放在同一欄比較好計算總分，用union all合併兩表
with A as(
    select first_player as "player_id", first_score as "score" from matches
    union all
    select second_player as "player_id", second_score as "score" from matches
), B as(
-- 虛擬表Ｂ：根據Ａ表整理的玩家和相對應的分數去計算每個隊伍每個玩家的總分是多少
    select group_id, A.player_id, sum(score) as "total_score" 
    from A join players p on A.player_id = p.player_id group by 1,2 
), C as(
-- 虛擬表Ｃ：根據Ｂ表整理每個玩家的總分，每隊依總分排名玩家，最高分排第一
    select group_id, player_id, total_score, row_number() over(partition by group_id order by total_score desc, player_id) as "score_rank" from B
)
-- 查詢每組第一名的人
select group_id, player_id from C where score_rank = 1