-- 問題：
-- Write an SQL query to generate a report of period_state for each continuous interval of days in the period from 2019-01-01 to 2019-12-31.


-- For the virtual table A：把failed和succeeded表合在一起，並新增state欄位，搜索2019年內的時間
with A as(
    select * from 
            (select fail_date as "date", "failed" as "state" from failed
             union all
             select success_date as "date", "succeeded" as "state" from succeeded) A
    where date between "2019-01-01" and "2019-12-31" 
), B as(
-- For the virtual table B：把Ａ表的日期排序－state分處完後的日期排序，以下舉個例子
-- failed : [1(1) 2(2) 3(3)] [6(4) 7(5)] [9(6)]
-- succeeded : [4(1) 5(2)] [8(3)]
-- 以中括弧為一組，會發現每組的日期排序(小括號前的數字)－state分類完再日期排序(小括號內的數字)都會是相等的值
-- failed相減完：[0 0 0] [2 2] [3]
-- succeeded相減完：[3 3] [5]
    select state, date, 
           rank() over(order by date) - rank() over(partition by state order by date) as "rnk" 
    from A
)

-- 最後得到Ｂ表就以state和rnk分組
select state as "period_state", min(date) as "start_date", max(date) as "end_date" from B group by 1, rnk order by 2