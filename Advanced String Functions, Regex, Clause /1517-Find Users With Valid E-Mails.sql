select user_id,name,mail
from Users
where mail REGEXP '^[a-zA-Z][a-zA-Z0-9_.-]*@leetcode[.]com$'
-- https://regex101.com/ this is the website used for learning and bulding the regex 

-- ^[a-zA-Z][a-zA-Z0-9_.-]*@leetcode[.?]com$
-- acc to regex this was the answer and but not sure why the compiler of leet code accepted above solution
