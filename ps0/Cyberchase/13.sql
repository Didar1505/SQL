SELECT season, title, topic, air_date, production_code
FROM episodes
WHERE topic != ""
  AND topic IS NOT NULL
  AND season BETWEEN 2 AND 10
  AND topic LIKE '%fractions%' COLLATE NOCASE
  ORDER BY title ASC;
