-- Please list out all classes which have more than or equal to 5 students.
-- 注意學生部分要distinct題目很奸詐還給你重複的組合
select class from courses group by class having count(distinct student)>=5