select first_name, last_name from players
join salaries
on  players.id = salaries.player_id
where salary in (select max(salary) from salaries)
