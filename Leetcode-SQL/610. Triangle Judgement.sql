
-- 題目：每三條線段長度是否可以組成一個三角形
-- 組成三角形的規定：兩線長度相加必須大於另一線
select *, 
       if(x+y>z and x+z>y and z+y>x,'Yes','No') as triangle
from Triangle