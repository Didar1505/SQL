select  name from districts
join expenditures on districts.id = expenditures.district_id
             where pupils = (select min(pupils) from expenditures)