-- 問題: 找有 'DIAB1'的人，規則如下
-- Write an SQL query to report the patient_id, patient_name all conditions of patients who have Type I Diabetes. Type I Diabetes always starts with DIAB1 prefix

-- 可以使用正規表達式但效率不高
select * from patients where conditions regexp ' +DIAB1|^DIAB1'


-- 用like比較快
select * from patients 
where conditions like '% DIAB1%' or conditions like 'DIAB1%'