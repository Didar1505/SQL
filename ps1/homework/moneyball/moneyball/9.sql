SELECT t.name, s.salary
FROM salaries AS s
JOIN teams AS t
    ON t.id = s.team_id
   AND s.year = t.year
WHERE s.year = 2001
and s.salary < (
    select avg(salary) from salaries
    )
ORDER BY s.salary asc
LIMIT 5;