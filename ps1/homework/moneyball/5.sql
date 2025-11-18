select teams.name from players
join performances
on players.id = performances.player_id
join teams
on performances.team_id = teams.id
where players.first_name = 'Satchel'
and players.last_name = 'Paige'
group by teams.name