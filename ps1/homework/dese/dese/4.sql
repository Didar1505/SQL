SELECT "city", COUNT("name") AS "schools count"
FROM "schools"
GROUP BY "city"
HAVING "type" = 'Public School'
ORDER BY "schools count" DESC
LIMIT 10;
