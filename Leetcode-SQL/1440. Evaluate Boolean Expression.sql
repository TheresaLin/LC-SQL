-- 根據variable表給的x, y去判斷式子是否成立
-- Write an SQL query to evaluate the boolean expressions in Expressions table.

-- if()假設條件裡，除了列出式子還要包含出現在式子中的operator
-- left_operand 和 right_operand 都要連結到variable表上
select left_operand, operator, right_operand, 
       if(operator = '>' and v1.value > v2.value or
          operator = '=' and v1.value = v2.value or
          operator = '<' and v1.value < v2.value, "true", "false") as "value"
from expressions e join variables v1 on e.left_operand = v1.name join variables v2 on e.right_operand = v2.name