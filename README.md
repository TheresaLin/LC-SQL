# LC-SQL

## 刪除數據 `delete`
```sql 
DELETE FROM table_name
WHERE condition;
```
* 練習題 : [196. Delete Duplicate Emails](./Leetcode-SQL/196.%20Delete%20Duplicate%20Emails.sql)、

* 基本架構 : [Delete方式](https://www.mysqltutorial.org/mysql-delete-statement.aspx)


## `Select`底下
* [不重複 `Distinct`](#Distinct()) 
* [`Max`、`min`、`avg`、`sum`](#maxminavgsum)
* [小數點`Round()`](#round)
* [絕對值`abs()`](#abs)
* [次方`power()`](#power)
* [開根號`sqrt()`](#sqrt)
* [`ifnull()`](#ifnull)
* [去除空格`trim()`](#trim)
* [換日期格式`date_format()`](#date_formatdate-format)
* [擷取資料片段`substring()`](#substringcolumn-第幾位-終點位)
* [資料合在同一個欄位`concat()`](#concat)
* [窗口函數Window Function](#窗口函數window-function)
  * [排名 `Rank()`](#rank)
  * [前筆數據`lag()` 後筆數據`lead()`](#lag和lead)
  * [算行數`row_num()`](#算行數row_number)
  * [`Over (Partition by Order by)`](#overpartition-by)

### `Distinct()`
* `Distinct()`練習題 : [596. Classes More Than 5 Students](./Leetcode-SQL/596.%20Classes%20More%20Than%205%20Students.sql)

### `Max`、`min`、`avg`、`sum`
正常情況要在`group by`的情況下才能用
* `min`練習題: [550. Game Play Analysis IV](./Leetcode-SQL/550.%20Game%20Play%20Analysis%20IV.sql)

### `Round()`
* `Round(欄位,小數點後幾位)`
* `Round()`練習題 : [597. Friend Requests_Acceptance Rate](./Leetcode-SQL/597.%20Friend%20Requests_Acceptance%20Rate.sql)

### `abs()`
* 絕對值:`abs(seat1,seat2)=1`用於兩個座位在隔壁
* `abs()`練習題 : [603. Consecutive Available Seats](./Leetcode-SQL/603.%20Consecutive%20Available%20Seats.sql)

### `power()`
* 次方：`power(某值,幾次方)`
* `power()`練習題 :[612. Shortest Distance in a Plane](./Leetcode-SQL/612.%20Shortest%20Distance%20in%20a%20Plane.sql)

### `sqrt()`
* 開根號：`sqrt(要開根號的值)`
* `sqrt()`練習題 :[612. Shortest Distance in a Plane](./Leetcode-SQL/612.%20Shortest%20Distance%20in%20a%20Plane.sql)

### `ifnull()`
* 是否為空值 : `ifnull(某欄,某欄為空的話要列出什麼值)`
* `ifnull()`練習題 : [1142. User Activity for the Past 30 Days II](./Leetcode-SQL/1142.%20User%20Activity%20for%20the%20Past%2030%20Days%20II.sql)、[1098. Unpopular Books](./Leetcode-SQL/1098.%20Unpopular%20Books.sql)

### `trim()`
* 去除空格
* 練習題: [1543. Fix Product Name Format](./Leetcode-SQL/1543.%20Fix%20Product%20Name%20Format.sql)
  
### `date_format(date, format)`
* 更改日期格式
* 練習題: [1543. Fix Product Name Format](./Leetcode-SQL/1543.%20Fix%20Product%20Name%20Format.sql)、[1565. Unique Orders and Customers Per Month](./Leetcode-SQL/1565.%20Unique%20Orders%20and%20Customers%20Per%20Month.sql)
* 基本架構 : [各種format的語法](https://www.w3schools.com/sql/func_mysql_date_format.asp)

### `substring(column, 第幾位, 終點位)`
* 擷取資料的某些部分(第幾位到第幾位)
* 練習題: [1565. Unique Orders and Customers Per Month](./Leetcode-SQL/1565.%20Unique%20Orders%20and%20Customers%20Per%20Month.sql)、[1667. Fix Names in a Table](1667.%20Fix%20Names%20in%20a%20Table.sql)
### `concat()`
* 把兩個資料結合在同一欄位中
* 練習題:  [1667. Fix Names in a Table](1667.%20Fix%20Names%20in%20a%20Table.sql)


## 窗口函數Window Function
### `Over(Partition by)` 
* 用於select裡面分類
* 前面可以是sum/count/max/min/rank...
```sql
sum/count/max/min/rank() over (<partition_definition> <order_definition>)
```
* `sum/count/max/min() over(partition by)`練習題 : [1303. Find the Team Size](./Leetcode-SQL/1303.%20Find%20the%20Team%20Size.sql)、[579. Find Cumulative Salary of an Employee](./Leetcode-SQL/579.%20Find%20Cumulative%20Salary%20of%20an%20Employee.sql)、[1097. Game Play Analysis V](./Leetcode-SQL/1097.%20Game%20Play%20Analysis%20V.sql)
* 基本架構: [窗口函數中文講解](https://dbaplus.cn/news-11-2258-1.html)、[MySQL document](https://dev.mysql.com/doc/refman/8.0/en/window-functions-frames.html)
### `Rank()`
* 要多一列排名要用`Rank() Over(Partition by 要分類的組 Order by 要排序的數值)`
```sql
rank() over (<partition_definition> <order_definition>)
```
* `Rank()`練習題 : [178. Rank Scores](./Leetcode-SQL/178.%20Rank%20Scores.sql)
### `dense_rank()`
*  排名不記算重複的名次 EX:11233 (`rank`的話11344)
*  重複的名次都會列出 `rank`和`max`就不會  
```sql
dense_rank() over (<partition_definition> <order_definition>)
```
*  `dense_rank()` 練習題 : [1076. Project Employees II](./Leetcode-SQL/1076.%20Project%20Employees%20II.sql)、[1077. Project Employees III](./Leetcode-SQL/1077.%20Project%20Employees%20III.sql)、[1082. Sales Analysis I](./Leetcode-SQL/1082.%20Sales%20Analysis%20I.sql)、[184. Department Highest Salary](./Leetcode-SQL/184.%20Department%20Highest%20Salary.sql)、[185. Department Top Three Salaries](./Leetcode-SQL/185.%20Department%20Top%20Three%20Salaries.sql)、[1112. Highest Grade For Each Student](./Leetcode-SQL/1112.%20Highest%20Grade%20For%20Each%20Student.sql)

### 算行數`Row_number()`
跟`rank()`很像，可以藉由order by排序。唯一不同是，`rank()`如果值一樣就會排名一樣，但`row_num()`不會，他都會有編號
```sql
ROW_NUMBER() OVER (<partition_definition> <order_definition>)
```
* 練習題 : [569. Median Employee Salary](./Leetcode-SQL/569.%20Median%20Employee%20Salary.sql)
* 基本架構 : [使用row_number](https://www.mysqltutorial.org/mysql-window-functions/mysql-row_number-function/)
### `lag()`和`lead()`
* 找當前數據的前一筆數據`lag() Over(Partition by 要分類的組 Order by 要排序的數值)`
* 找當前數據的後一筆數據`lead() Over(Partition by 要分類的組 Order by 要排序的數值)`
* 練習題 : [180. Consecutive Numbers](./Leetcode-SQL/180.%20Consecutive%20Numbers.sql)、[1097. Game Play Analysis V](./Leetcode-SQL/1097.%20Game%20Play%20Analysis%20V.sql)
* 基本架構 : [如何使用lag和lead](https://www.mysqltutorial.org/mysql-window-functions/mysql-lag-function/)

### `Preceding` and `Following`
* 指定當前行的前後行
```sql
#窗口範圍是當前行的兩筆加當前行，共三筆紀錄
ROWS BETWEEN 2 PRECEDING AND CURRENT ROW 

#窗口範圍是當前行、前一行、後一行一共三行記錄
ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING 

#窗口範圍是當前行到分區中的最後一行
ROWS UNBOUNDED FOLLOWING 

#窗口範圍是當前分區中所有行，等同於不寫
ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING 
```
* 練習題 : [579. Find Cumulative Salary of an Employee](./Leetcode-SQL/579.%20Find%20Cumulative%20Salary%20of%20an%20Employee.sql)
* 基本架構 : [需要搜preceding找關鍵字](https://dbaplus.cn/news-11-2258-1.html)


## `where`底下
* [`between`](#between)
* [`in`和`not in`](#in-and-not-in)
* [正規表達式`RegExp`](#regexpregular-expressions)
### `between`:
* 兩數之間: `beween 0 and 1000`
* 兩個日期之間: `between cast(20**-**-** as date) and cast(20**-**-** as date)` 或 `datediff('****-**-**',日期欄位名) < or = or > 相差天數` 或 `between '20**-**-**' and '20**-**-**'`
* `beween`練習題：[1084. Sales Analysis III](./Leetcode-SQL/1084.%20Sales%20Analysis%20III.sql)、[1141. User Activity for the Past 30 Days I](./Leetcode-SQL/1141.%20User%20Activity%20for%20the%20Past%2030%20Days%20I.sql)、[1142. User Activity for the Past 30 Days II](./Leetcode-SQL/1142.%20User%20Activity%20for%20the%20Past%2030%20Days%20II.sql)
* `datediff`練習題：[1098. Unpopular Books](./Leetcode-SQL/1098.%20Unpopular%20Books.sql)、[1107. New Users Daily Count](./Leetcode-SQL/1107.%20New%20Users%20Daily%20Count.sql)
```sql
datediff('****-**-**',日期欄位名) < or = or > 相差天數
```
### `in` and `not in`:
* 用於替除掉not in(要剃除的人) 
* 練習題 : [1083. Sales Analysis II](./Leetcode-SQL/1083.%20Sales%20Analysis%20II.sql)、[1350. Students With Invalid Departments](./Leetcode-SQL/1350.%20Students%20With%20Invalid%20Departments.sql)、[1581. Customer Who Visited but Did Not Make Any Transactions](./Leetcode-SQL/1581.%20Customer%20Who%20Visited%20but%20Did%20Not%20Make%20Any%20Transactions.sql)、[185. Department Top Three Salaries](./Leetcode-SQL/185.%20Department%20Top%20Three%20Salaries.sql)、[1112. Highest Grade For Each Student](./Leetcode-SQL/1112.%20Highest%20Grade%20For%20Each%20Student.sql)

### `regexp`(Regular Expressions):
* 正規表達式用於辨別大量字符、單詞等
* 可以來搜索電子郵件、IP、電話號碼等
```sql
SELECT 
    column_list
FROM
    table_name
WHERE
    string_column REGEXP pattern
```
* 練習題 :[1517. Find Users With Valid E-Mails](./Leetcode-SQL/1517.%20Find%20Users%20With%20Valid%20E-Mails.sql)、[1527. Patients With a Condition](./Leetcode-SQL/1527.%20Patients%20With%20a%20Condition.sql)
* 基本架構: [基於正規表達式Regexp的搜尋](https://www.yiibai.com/mysql/regular-expression-regexp.html)、[MySQL Documnent of Regular Expressions](https://dev.mysql.com/doc/refman/8.0/en/regexp.html)


## 以日期為條件
除了用between，如果是指定某月可以用 `month(date)=**`
* 練習題 : [1511. Customer Order Frequency](./Leetcode-SQL/1511.%20Customer%20Order%20Frequency.sql)


## 兩張表連結 `join`

* 普通`Join`(`inner join`): [603. Consecutive Available Seats](./Leetcode-SQL/603.%20Consecutive%20Available%20Seats.sql)
* `Left Join`: [577. Employee Bonus](./Leetcode-SQL/577.%20Employee%20Bonus.sql)、[1241. Number of Comments per Post](./Leetcode-SQL/1241.%20Number%20of%20Comments%20per%20Post.sql)、[1350. Students With Invalid Departments](./Leetcode-SQL/1350.%20Students%20With%20Invalid%20Departments.sql)、[608. Tree Node](./Leetcode-SQL/608.%20Tree%20Node.sql)

* `Cross Join`: [1280. Students and Examinations](./Leetcode-SQL/1280.%20Students%20and%20Examinations.sql)

* `join`同一張表: [1731. The Number of Employees Which Report to Each Employee](./Leetcode-SQL/1731.%20The%20Number%20of%20Employees%20Which%20Report%20to%20Each%20Employee.sql)
* `join`誤區 : [1148. Article Views I](./Leetcode-SQL/1148.%20Article%20Views%20I.sql)

* 基本架構 : [Join多種方式](https://www.mysqltutorial.org/mysql-join/)、[Having用途](https://www.mysqltutorial.org/mysql-having.aspx)


## 聯集`Union`

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
* 練習題: [1435. Create a Session Bar Chart](./Leetcode-SQL/1435.%20Create%20a%20Session%20Bar%20Chart.sql)、[602. Friend Requests II Who Has the Most Friends](./Leetcode-SQL/602.%20Friend%20Requests%20II%20Who%20Has%20the%20Most%20Friends.sql)、[1127. User Purchase Platform](./Leetcode-SQL/1127.%20User%20Purchase%20Platform.sql)
  
* 基本架構 :[Union用法](https://www.w3schools.com/sql/sql_union.asp)


## `Group by` 和 `Having`和`Group_Concat()`
### `Having` 
只有在 `Group by`的情況下才用，用於分完組別後增加的條件
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
* `having`練習題: [596. Classes More Than 5 Students](./Leetcode-SQL/596.%20Classes%20More%20Than%205%20Students.sql)、[1327. List the Products Ordered in a Period](./Leetcode-SQL/1327.%20List%20the%20Products%20Ordered%20in%20a%20Period.sql)、[1511. Customer Order Frequency](./Leetcode-SQL/1511.%20Customer%20Order%20Frequency.sql)、[570. Managers with at Least 5 Direct Reports](./Leetcode-SQL/570.%20Managers%20with%20at%20Least%205%20Direct%20Reports.sql)、[1098. Unpopular Books](./Leetcode-SQL/1098.%20Unpopular%20Books.sql)、[1126. Active Businesses](./Leetcode-SQL/1126.%20Active%20Businesses.sql)
* 基本架構 : [Having用途](https://www.mysqltutorial.org/mysql-having.aspx)

### `Group_Concat`
  只有在group by條件下使用，用於把同一組的數據放進該組同一欄位內，`separator`用於數據間的分隔
```sql
GROUP_CONCAT(
    DISTINCT expression
    ORDER BY expression
    SEPARATOR sep
);
```
* `group_concat`練習題: [1484. Group Sold Products By The Date](./Leetcode-SQL/1484.%20Group%20Sold%20Products%20By%20The%20Date.sql)

* 基本架構 : [group_concat使用方法](https://www.mysqltutorial.org/mysql-group_concat/)

## 傳送指定行數的資料 `Limit` 和 `Offset`
LIMIT 接受一個或兩個數字參數。參數必須是一個整數常量。如果給定兩個參數，第一個參數指定第一個返回記錄行的偏移量，第二個參數指定返回記錄行的最大數目。
```sql 
-- limit是給幾個數據，offset是指定某行的下一行，如果要第一名就不用設offset
SELECT * FROM table LIMIT [offset,] rows | rows OFFSET offset

--這是兩個參數，第一個是偏移量，第二個是數目
select * from employee limit 3, 7; // 返回4-11行
select * from employee limit 3,1; // 返回第4行

--一個參數
select * from employee limit 3; // 返回前3行
```
* 練習題: [176. Second Highest Salary](./Leetcode-SQL/176.%20Second%20Highest%20Salary.sql)、[177. Nth Highest Salary](./Leetcode-SQL/177.%20Nth%20Highest%20Salary.sql)、[574. Winning Candidate](./Leetcode-SQL/574.%20Winning%20Candidate.sql)
* 基本框架: [limit offset中文使用方法](https://blog.csdn.net/AinUser/article/details/72803175)、[limit offset英文使用方法](https://www.guru99.com/limit.html)
  
## 假設條件情況`IF`
```sql
IF(expression ,expr_true, expr_false);
```
* 練習題：[626. Exchange Seats](./Leetcode-SQL/626.%20Exchange%20Seats.sql)、[1045. Customers Who Bought All Products
](./Leetcode-SQL/1045.%20Customers%20Who%20Bought%20All%20Products.sql)、[1097. Game Play Analysis V](./Leetcode-SQL/1097.%20Game%20Play%20Analysis%20V.sql)
* 基本框架：[if function](https://www.w3resource.com/mysql/control-flow-functions/if-function.php)
## 假設條件情況`Case`
Like an IF-THEN-ELSE statement. If there is no ELSE part and no conditions are true, it returns NULL.
```sql
CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    WHEN conditionN THEN resultN
    ELSE result
END;
```
* 練習題: [262. Trips and Users](./Leetcode-SQL/262.%20Trips%20and%20Users.sql)、[1179. Reformat Department Table](./Leetcode-SQL/1179.%20Reformat%20Department%20Table.sql)、[1211. Queries Quality and Percentage](./Leetcode-SQL/1211.%20Queries%20Quality%20and%20Percentage.sql)、[1294. Weather Type in Each Country](./Leetcode-SQL/1294.%20Weather%20Type%20in%20Each%20Country.sql)、[1322. Ads Performance](./Leetcode-SQL/1322.%20Ads%20Performance.sql)、[1661. Average Time of Process per Machine](./Leetcode-SQL/1661.%20Average%20Time%20of%20Process%20per%20Machine.sql)、、[1777. Product's Price for Each Store](./Leetcode-SQL/1777.%20Product's%20Price%20for%20Each%20Store)、[550. Game Play Analysis IV](./Leetcode-SQL/550.%20Game%20Play%20Analysis%20IV.sql)、[571. Find Median Given Frequency of Numbers](./Leetcode-SQL/571.%20Find%20Median%20Given%20Frequency%20of%20Numbers.sql)、[578. Get Highest Answer Rate Question](./Leetcode-SQL/578.%20Get%20Highest%20Answer%20Rate%20Question.sql)

## 虛擬表`with virtual_table as()`
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
* 練習題: [1435. Create a Session Bar Chart](./Leetcode-SQL/1435.%20Create%20a%20Session%20Bar%20Chart.sql)、[1511. Customer Order Frequency](./Leetcode-SQL/1511.%20Customer%20Order%20Frequency.sql)、[1581. Customer Who Visited but Did Not Make Any Transactions](./Leetcode-SQL/1581.%20Customer%20Who%20Visited%20but%20Did%20Not%20Make%20Any%20Transactions.sql)、[571. Find Median Given Frequency of Numbers](./Leetcode-SQL/571.%20Find%20Median%20Given%20Frequency%20of%20Numbers.sql)、[578. Get Highest Answer Rate Question](./Leetcode-SQL/578.%20Get%20Highest%20Answer%20Rate%20Question.sql)、[615. Average Salary: Departments VS Company](./Leetcode-SQL/615.%20Average%20Salary:%20Departments%20VS%20Company.sql)、[1097. Game Play Analysis V](./Leetcode-SQL/1097.%20Game%20Play%20Analysis%20V.sql)、[1132. Reported Posts II](./Leetcode-SQL/1132.%20Reported%20Posts%20II.sql)

基本架構 : [with用法](https://www.educba.com/sql-with-clause/)



## 精選需要動一陣子腦袋的題目：


## Reference
[MySQL Tutorial](https://www.mysqltutorial.org/mysql-delete-statement.aspx)