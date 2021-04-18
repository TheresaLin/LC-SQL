-- 問題: (由出現次數找中位數)
-- Write a query to find the median of all numbers and name the result as median.

-- 這題不簡單，創虛擬表用sum() over()去計算到自己的total_frequecy是多少
-- 然後分偶數total_freq和奇數total_freq的中位數如何處理
with A as(
select number, frequency, sum(frequency) over(order by number) as "total_freq" from numbers
)
-- Splitting median calculation by odd and even max(total_freq) with case when
select case when max(total_freq)%2 = 0 -- 偶數的total_freq
            then ((select number from A where total_freq >= (select max(total_freq)/2 from A) limit 1) + 
                  (select number from A where total_freq >= (select max(total_freq)/2+1 from A) limit 1))/2 
            else (select number from A where total_freq >= (select (max(total_freq)+1)/2 from A) limit 1) -- 奇數的total_freq
            end as "median" from A
