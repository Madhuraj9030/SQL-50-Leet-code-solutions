delete b
from Person as a, person as b
where a.id<b.id and a.email = b.email