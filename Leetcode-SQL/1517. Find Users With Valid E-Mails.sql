-- 問題: 列出有"@leetcode.com"的那種Email，下面(1),(2)是條件(英文開頭，中間不能有一些特殊符號)
-- Write an SQL query to find the users who have valid emails.
--      A valid e-mail has a prefix name and a domain where: 
--      (1)The prefix name is a string that may contain letters (upper or lower case), digits, underscore '_', period '.' and/or dash '-'. The prefix name must start with a letter.
--      (2)The domain is '@leetcode.com'.

-- 用正規表達式regexp
-- ^[a-zA-Z] the first character should be only alphanumeric
-- [a-zA-Z0-9_.-]* the middle can contain any of these and multiple times (* is for multiple times)
-- leetcode.com$ ending should be leetcode.com ($ is for the ending)
select * from users where mail regexp'^[A-Za-z][A-Za-z0-9_.-]*@leetcode.com$'
