-- 問題: (列出溫度比前一天大的id) Write an SQL query to find all dates' id with higher temperature compared to its previous dates (yesterday).
-- 技巧: 使用datediff(date1, date2) 是date1-date2的天數 然後後面那天date1氣溫要比前一天date2高

select w1.id from weather w1 join weather w2 on datediff(w1.recordDate, w2.recordDate) = 1 
                                             AND w1.Temperature > w2.Temperature


