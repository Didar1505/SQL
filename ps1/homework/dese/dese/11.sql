select schools.district_id, schools.name, expenditures.per_pupil_expenditure, graduation_rates.graduated
from schools
join expenditures
on schools.district_id = expenditures.district_id
join graduation_rates
on schools.id = graduation_rates.school_id
order by expenditures.per_pupil_expenditure desc,
         schools.name asc;