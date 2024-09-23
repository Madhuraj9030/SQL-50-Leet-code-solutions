-- select x,y,z, Case when x+y>z and x+z>y and z+y>x then "Yes" Else "No" end as triangle
-- from Triangle
-- Rule is sum of any two sides in a triangle is must be greater than the third side
select x,y,z, if(x+y>z and x+z>y and z+y>x, "Yes", "No") as triangle
from Triangle