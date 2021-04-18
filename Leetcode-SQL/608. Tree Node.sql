-- 問題：找出Root, Inner, Leaf(沒有父節點代表是root,沒有子節點代表是Leaf,有父節點且有子節點就是inner)
-- Write a query to print the node id and the type of the node.


-- 先結合同一張表並且用left join，id代表本身，parent代表父節點，child代表子節點
-- 並用case when把有沒有父、子節點分類（沒有父節點代表是root,沒有子節點代表是Leaf,有父節點且有子節點就是inner）
select distinct id, (case when parent is Null then "Root"
                          when child is Null then "Leaf"
                     else "Inner" end) as "Type"
from( select t1.id, t1.p_id as "parent", t2.id as "child" from tree t1 left join tree t2 on t1.id = t2.p_id ) A
