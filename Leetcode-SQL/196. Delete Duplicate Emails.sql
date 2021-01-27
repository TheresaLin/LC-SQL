-- 問題: (刪重複的信箱)
-- Write a SQL query to delete all duplicate email entries in a table named Person, keeping only unique emails based on its smallest Id.
-- delete一張表生成兩個，然後如果有重複的email，把較大的ID刪掉
delete p2 from Person p1, Person p2 where p1.Email = p2.Email and p2.Id > p1.Id