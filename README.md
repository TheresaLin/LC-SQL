# LC-SQL

### 刪除數據 `delete`
```sql 
DELETE FROM table_name
WHERE condition;
```
練習題 : [196. Delete Duplicate Emails](./Leetcode-SQL/196.%20Delete%20Duplicate%20Emails.sql)、

基本架構 : [Delete方式](https://www.mysqltutorial.org/mysql-delete-statement.aspx)


### `Select`底下: 不重複`Distinct`、 排名`Rank()`、`Over(Partition by)`、 小數點`Round()`、 絕對值`abs()`、`ifnull()`
* `Distinct()`
  
  * `Distinct()`練習題 : [596. Classes More Than 5 Students](./Leetcode-SQL/596.%20Classes%20More%20Than%205%20Students.sql)
  
* `Rank()`
    * 要多一列排名要用`Rank() Over(Partition by 要分類的組 Order by 要排序的數值)`
      * `Rank()`練習題 : [178. Rank Scores](./Leetcode-SQL/178.%20Rank%20Scores.sql)
    * `dense_rank()`
      * `dense_rank()` 練習題 : [1076. Project Employees II](./Leetcode-SQL/1076.%20Project%20Employees%20II.sql)、[1077. Project Employees III](./Leetcode-SQL/1077.%20Project%20Employees%20III.sql)、[1082. Sales Analysis I](./Leetcode-SQL/1082.%20Sales%20Analysis%20I.sql)
      *  排名不記算重複的名次 EX:11233 (`rank`的話11344)
      *  重複的名次都會列出 `rank`和`max`就不會  
* `Over(Partition by)` 
  * 用於select裡面分類
  * `over(partition by)`練習題 : [1303. Find the Team Size](./Leetcode-SQL/1303.%20Find%20the%20Team%20Size)
* `Round()`
  * `Round(欄位,小數點後幾位)`
  * `Round()`練習題 : [597. Friend Requests_Acceptance Rate](./Leetcode-SQL/597.%20Friend%20Requests_Acceptance%20Rate)

* `abs()`
  * 絕對值:`abs(seat1,seat2)=1`用於兩個座位在隔壁
  * `abs()`練習題 : [603. Consecutive Available Seats](./Leetcode-SQL/603.%20Consecutive%20Available%20Seats.sql)
  
* `ifnull()`
  * 是否為空值 : `ifnull(某欄,某欄為空的話要列出什麼值)`
  * `ifnull()`練習題 : [1142. User Activity for the Past 30 Days II](./Leetcode-SQL/1142.%20User%20Activity%20for%20the%20Past%2030%20Days%20II.sql)

### `where`底下: `between`、`not in`
* `beween`:
  * 兩數之間: `beween 0 and 1000`
  * 兩個日期之間: `between cast(20**-**-** as date) and cast(20**-**-** as date)` 或 `datediff('****-**-**',日期欄位名) < or = or > 相差天數`
  * `beween`練習題 : [1084. Sales Analysis III](./Leetcode-SQL/1084.%20Sales%20Analysis%20III.sql)、[1141. User Activity for the Past 30 Days I](./Leetcode-SQL/1141.%20User%20Activity%20for%20the%20Past%2030%20Days%20I.sql)、[1142. User Activity for the Past 30 Days II](./Leetcode-SQL/1142.%20User%20Activity%20for%20the%20Past%2030%20Days%20II.sql)
* ‵`in` and `not in`:
  * 用於替除掉not in(要剃除的人) 
  * 練習題 : [1083. Sales Analysis II](./Leetcode-SQL/1083.%20Sales%20Analysis%20II.sql)、[1350. Students With Invalid Departments](./Leetcode-SQL/1350.%20Students%20With%20Invalid%20Departments)



### `Group by` 和 `Having`和`gorup_concat()`
* `Having` 只有在 `Group by`的情況下才用，用於分完組別後增加的條件
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
 * `having`練習題: [596. Classes More Than 5 Students](./Leetcode-SQL/596.%20Classes%20More%20Than%205%20Students.sql)、[1327. List the Products Ordered in a Period](./Leetcode-SQL/1327.%20List%20the%20Products%20Ordered%20in%20a%20Period)

  基本架構 : [Having用途](https://www.mysqltutorial.org/mysql-having.aspx)

* `Group_Concat`
  只有在group by條件下使用，用於，用於把同一組的數據放進該組同一欄位內，`separator`用於數據間的分隔
```sql
GROUP_CONCAT(
    DISTINCT expression
    ORDER BY expression
    SEPARATOR sep
);
```
* `group_concat`練習題: [1484. Group Sold Products By The Date](./Leetcode-SQL/1484.%20Group%20Sold%20Products%20By%20The%20Date)

 基本架構 : [group_concat使用方法](https://www.mysqltutorial.org/mysql-group_concat/)


### 兩張表連結 `join`

* 普通`Join`(`inner join`): [603. Consecutive Available Seats](./Leetcode-SQL/603.%20Consecutive%20Available%20Seats.sql)
* `Left Join`: [577. Employee Bonus](./Leetcode-SQL/577.%20Employee%20Bonus.sql)、[1241. Number of Comments per Post](./Leetcode-SQL/1241.%20Number%20of%20Comments%20per%20Post)、[1350. Students With Invalid Departments](./Leetcode-SQL/1350.%20Students%20With%20Invalid%20Departments)

* `Cross Join`: [1280. Students and Examinations](./Leetcode-SQL/1280.%20Students%20and%20Examinations.sql)

* `join`誤區 : [1148. Article Views I](./Leetcode-SQL/1148.%20Article%20Views%20I.sql)

基本架構 : [Join多種方式](https://www.mysqltutorial.org/mysql-join/)、[Having用途](https://www.mysqltutorial.org/mysql-having.aspx)

### 聯集`Union`

`Union`: 沒有重複值(only distinct values)
```sql
SELECT column_name(s) FROM table1
UNION
SELECT column_name(s) FROM table2;
```
`Union All`: 會有重複值(duplicate values)
```sql
SELECT column_name(s) FROM table1
UNION ALL
SELECT column_name(s) FROM table2;
```
* 練習題: [1435. Create a Session Bar Chart](./Leetcode-SQL/1435.%20Create%20a%20Session%20Bar%20Chart.sql) 
  
基本架構 :[Union用法](https://www.w3schools.com/sql/sql_union.asp)


### 假設條件情況`Case`

Like an IF-THEN-ELSE statement. If there is no ELSE part and no conditions are true, it returns NULL.
```sql
CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    WHEN conditionN THEN resultN
    ELSE result
END;
```
* 練習題: [1179. Reformat Department Table](./Leetcode-SQL/1179.%20Reformat%20Department%20Table.sql)、[1211. Queries Quality and Percentage](./Leetcode-SQL/1211.%20Queries%20Quality%20and%20Percentage.sql)、[1294. Weather Type in Each Country](./Leetcode-SQL/1294.%20Weather%20Type%20in%20Each%20Country.sql)、[1322. Ads Performance](./Leetcode-SQL/1322.%20Ads%20Performance.sql)

### 虛擬表`with virtual_table as()`
製作虛擬表，用於當表中沒有需要的欄位時
```sql
WITH Orders_CTE (Order_id, Number_of_Orders)
AS
(
SELECT Items_purchased, COUNT(Order_id) as Number_of_Orders
FROM orders
GROUP BY Items_purchased
)
SELECT AVG(Number_of_Orders) AS "Average Orders Per Category"
FROM Orders_CTE;
```
* 練習題: [1435. Create a Session Bar Chart](./Leetcode-SQL/1435.%20Create%20a%20Session%20Bar%20Chart.sql)

基本架構 :[with用法](https://www.educba.com/sql-with-clause/)
## Reference
[MySQL Tutorial](https://www.mysqltutorial.org/mysql-delete-statement.aspx)