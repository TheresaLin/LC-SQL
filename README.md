# LC-SQL

### 刪除數據 `delete()`
```sql 
DELETE FROM table_name
WHERE condition;
```
練習題 : [196. Delete Duplicate Emails](./Leetcode-SQL/196.%20Delete%20Duplicate%20Emails.sql)、

基本架構 : [Delete方式](https://www.mysqltutorial.org/mysql-delete-statement.aspx)


### `Select()`底下: 不重複`Distinct()`、 排名`Rank()`、 小數點`Round()`、 絕對值abs()
* `Distinct()`
  
  * `Distinct()`練習題 : [596. Classes More Than 5 Students](./Leetcode-SQL/596.%20Classes%20More%20Than%205%20Students.sql)
  
* `Rank()`
    * 要多一列排名要用`Rank() Over(Partition by 要分類的組 Order by 要排序的數值)`
      * `Rank()`練習題 : [178. Rank Scores](./Leetcode-SQL/178.%20Rank%20Scores.sql)
    * `dense_rank()`
      * `dense_rank()` 練習題 : [1076. Project Employees II](./Leetcode-SQL/1076.%20Project%20Employees%20II.sql)、[1077. Project Employees III](./Leetcode-SQL/1077.%20Project%20Employees%20III.sql)、[1082. Sales Analysis I](./Leetcode-SQL/1082.%20Sales%20Analysis%20I.sql)
      *  排名不記算重複的名次 EX:11233 (`rank`的話11344)
      *  重複的名次都會列出 `rank`和`max`就不會
    
  
* `Round()`
  * `Round(欄位,小數點後幾位)`
  * `Round()`練習題 : [597. Friend Requests_Acceptance Rate](./Leetcode-SQL/597.%20Friend%20Requests_Acceptance%20Rate)

* `abs()`
  * 絕對值:`abs(seat1,seat2)=1`用於兩個座位在隔壁
  * `abs()`練習題 : [603. Consecutive Available Seats](./Leetcode-SQL/603.%20Consecutive%20Available%20Seats.sql)

### `where`底下: `between`
* `beween`:
  * 兩數之間: `beween 0 and 1000`
  * 兩個日期之間: `between cast(20**-**-** as date) and cast(20**-**-** as date)`
    * `beween`練習題 : [1084. Sales Analysis III](./Leetcode-SQL/1084.%20Sales%20Analysis%20III.sql)



### `Group by()` 和 `Having()`
`Having()` 只有在 `Group by()`的情況下才用
```sql
SELECT 
    select_list
FROM 
    table_name
WHERE 
    search_condition
GROUP BY 
    group_by_expression
HAVING 
    group_condition;
```


* Having: [596. Classes More Than 5 Students](./Leetcode-SQL/596.%20Classes%20More%20Than%205%20Students.sql)

基本架構 : [Having用途](https://www.mysqltutorial.org/mysql-having.aspx)


### 兩張表連結 `join()`

* 普通`Join`: [603. Consecutive Available Seats](./Leetcode-SQL/603.%20Consecutive%20Available%20Seats.sql)
* `Left Join`: [577. Employee Bonus](./Leetcode-SQL/577.%20Employee%20Bonus.sql)


基本架構 : [Join多種方式](https://www.mysqltutorial.org/mysql-join/)、[Having用途](https://www.mysqltutorial.org/mysql-having.aspx)



## Reference
[MySQL Tutorial](https://www.mysqltutorial.org/mysql-delete-statement.aspx)