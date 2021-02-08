-- 問題: Write an SQL query to report the distinct titles of the kid-friendly movies streamed in June 2020.

select distinct title from content c join TVprogram TV on c.content_id = TV.content_id 
where program_date between '2020-06-01' and '2020-06-30' and Kids_content = 'Y' and content_type = 'Movies'