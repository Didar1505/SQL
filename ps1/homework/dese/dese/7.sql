select name from schools
where district_id IN (
    select id from districts
              where districts.city = 'Cambridge' and districts.name like '%cambridge%' collate NOCASE
    );