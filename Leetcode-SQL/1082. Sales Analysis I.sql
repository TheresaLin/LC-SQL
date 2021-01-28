-- 問題: 列出最高總銷售額的seller，注意第一名可能很多人
-- Write an SQL query that reports the best seller by total sales price, If there is a tie, report them all.
-- 這題可以和1077題比較partiton by()，這題因為order by裡面有group by搭配的sum()，所以不使用partition by，用group by
-- 此題最好用dense_rank()+列出平名=1，因為可以排出多個第一名

select seller_id 
    from(select seller_id, dense_rank() over(order by sum(price) desc) "sell_rank" 
            from sales group by seller_id) A where sell_rank=1