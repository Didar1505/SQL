SELECT s.salary
FROM salaries AS s
JOIN performances AS p
    ON s.player_id = p.player_id
   AND s.year = p.year
WHERE p.year = 2001
ORDER BY p.HR DESC
LIMIT 1;