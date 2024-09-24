select user_id, concat(Upper(substring(name, 1,1)), lower(substring(name, 2,100))) as name
from Users
order by user_id