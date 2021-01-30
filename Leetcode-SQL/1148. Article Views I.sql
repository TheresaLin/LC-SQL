-- 問題: (找有看過至少一篇文章的作者)
-- Write an SQL query to find all the authors that viewed at least one of their own articles, sorted in ascending order by their id.
-- 這題author_id和viewer_id是連通的，用join同張表會比較麻煩容易出錯，直接用where author_id=viewer_id即可

-- 正確又簡單的寫法
select distinct author_id "id" from views where author_id=viewer_id order by author_id


-- 我原本錯誤的寫法
select distinct v1.author_id "id" 
    from views v1 join views v2 on v1.author_id =v2.viewer_id order by v1.author_id
