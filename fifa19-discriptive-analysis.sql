use fifa;

select * from players

--how many players are there in the data set
select count(*) 
from players;


--total number of nationalities in the data set
select count(distinct nationality) 
from players;


--the total wage given to the players
select sum(wage) as total_wage
from players;



--which nationality has highest players and what is the number of players
select nationality,count(*) as players_count 
from players
group by nationality 
order by players_count desc;


--player who's getting higest wage and what is that wage
select name,max(wage) as wage
from players 
where Wage=(select max(wage) from players) 
group by name;



--what is the min wage that the players are getting
select min(wage)
from players;


---players who has high rating
select name,max(overall) as max_rating
from players
where Overall=(select max(overall) from players)
group by name;



--which is the best club based on the overall rating
select club,sum(overall) as total_rating
from players 
group by club
order by total_rating desc ;


--how many players prefer left foot and how many prefer right
select count(*) as preferredfoot, Preferred_Foot 
from players
group by Preferred_Foot
order by preferredfoot desc


--which is the luckiest jersey number(based on total wage)
select sum(wage) as total_wage,jersey_number 
from players 
group by Jersey_Number
order by total_wage desc;


--No of players in the nationalities who's name starts with "M"
select count(*) as players,nationality
from players 
where Nationality like 'M%'
group by Nationality


--how many players have joined the club from the date of 2018-01-01 to 2019-01-01
select count(*) as joined
from players
where joined>='2018-01-01' and joined<='2019-01-01';


--how many players have joind in each year
select count(*) as freq, year(Joined)
from players
group by year(Joined)
order by year(Joined)