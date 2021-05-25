-- 問題：seller第二個賣出的商品是否是他最喜歡的品牌
-- Write an SQL query to find for each user, whether the brand of the second item (by date) they sold is their favorite brand. 
-- If a user sold less than two items, report the answer for that user as no. It is guaranteed that no seller sold more than one item on a day.


-- 解法一：這是我原始的想法不過有點繞路
-- 技巧：查詢item_brand rather than item_id(因為一個商品名居然有多個id)
-- 虛擬表Ａ：每個賣家分組按照時間列出第一個賣出、第二個賣出...的商品名
-- 連接到item表去查商品名(不要用item_id，剛開始用id查找繞了超多彎路)
with A as(
    select seller_id, item_brand, 
           row_number() over(partition by seller_id order by order_date) as "order_rank" 
    from orders o join items i on o.item_id = i.item_id 
), B as( 
-- 虛擬表Ｂ：列所有賣家名，並寫死“２”在每個2nd_order欄位裡(其實這步可以省略)
    select user_id, "2" as 2nd_order from users
), C as(
-- 虛擬表Ｃ：利用Ａ、Ｂ表查出每位賣家第二個賣出的商品名
    select user_id, item_brand 
    from A right join B on A.seller_id = B.user_id and A.order_rank = B.2nd_order
), D as(
-- 虛擬表Ｄ：列出所有賣家最愛的品牌名(這步其實也可省略)
    select user_id, favorite_brand from users u join items i on u.favorite_brand = i.item_brand
)

-- 合併Ｃ、Ｄ表，比對賣家第二筆賣出的商品是否是他的最愛
select distinct C.user_id as "seller_id", 
       if(C.item_brand = D.favorite_brand, "yes", "no") as "2nd_item_fav_brand" 
from C left join D on C.user_id = D.user_id order by 1




-- 解法二：這是比較簡易且快速的解法
-- 一樣不能需要查找item_brand instead of item_id(因為一個商品名居然有多個id)
-- 虛擬表Ａ：每個賣家分組按照時間列出第一個賣出、第二個賣出...的商品名
-- 連接到item表去查商品名(不要用item_id，剛開始用id查找繞了超多彎路)
with A as(
    select seller_id, item_brand, 
           row_number() over(partition by seller_id order by order_date) as "order_rank" 
    from orders o join items i on o.item_id = i.item_id 
), B as(
-- 虛擬表Ｂ：利用Ａ表查出每位賣家第二個賣出的商品名
    select seller_id, item_brand from A where order_rank = 2
)

-- 合併users表和Ｂ表，比對賣家第二筆賣出的商品是否是他的最愛
select user_id as "seller_id", if(favorite_brand = item_brand, "yes", "no") as "2nd_item_fav_brand" 
from users u left join B on u.user_id = B.seller_id
