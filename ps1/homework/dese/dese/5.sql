select "city", count("name") as "schools count"
from "schools"
group by city
having "schools count" < 3
order by "schools count" desc,
         city asc;