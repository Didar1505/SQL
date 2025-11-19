select name, round(avg(performances.H)) as 'total hits' from teams
join performances
on teams.id = performances.team_id
group by performances.id
having performances.year = 2001
order by "total hits" desc
limit 5;