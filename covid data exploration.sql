use covid

select * from CovidDeath
select * from CovidVaccinations

select location,date,total_cases,new_cases, total_deaths, population from CovidDeath 
order by 1,2


--looking at total cases vs total deaths

select location,date,total_cases, total_deaths,(total_deaths/total_cases)*100 
as death_percentage from CovidDeath 
where location='India'
order by 1,2


--looking at total cases vs  populaton
--what percentage of population got infected

select location,date,total_cases,population,(total_cases/population)*100
as PercentageofPopulation from CovidDeath 
where location='India'
order by 1,2


--looking at countries with highest infection rate compared to population

select location,population,max(total_cases) as highestInfectionCount,max((total_cases/population))*100
as PercentageofPopulationInfected 
from CovidDeath 
--where location='India'
group by location,population
order by PercentageofPopulationInfected desc
	

--showing countries with highest death count per population


select location,max(cast (total_deaths as int)) as TotalDeathCount
from CovidDeath 
--where location='India'
where continent is not null
group by location
order by  TotalDeathCount desc


--which continent has highest total death count



select continent,max(cast (total_deaths as int)) as TotalDeathCount
from CovidDeath 
--where location='India'
where continent is not null
group by continent
order by  TotalDeathCount desc


--global numbers

select date,sum(new_cases) as totalcases, sum(cast(new_deaths as int)) as totaldeaths,
sum(cast(new_deaths as int))/sum(new_cases)*100 as DeathPercentage
from CovidDeath
where continent is not null
group by date
order by date


--joining the 2 tables


select * from CovidDeath det
join
CovidVaccinations vac
on det.location=vac.location
and
det.date=vac.date


--looking at total population vs vaccination


select det.continent,det.location,det.date,det.population,vac.new_vaccinations from CovidDeath det
join
CovidVaccinations vac
on det.location=vac.location
and
det.date=vac.date
where det.continent is not null
order by 1,2,3



--creating views


create view CovidData as
select det.continent,det.location,det.date,det.population,vac.new_vaccinations from CovidDeath det
join
CovidVaccinations vac
on det.location=vac.location
and
det.date=vac.date
where det.continent is not null
--order by 1,2,3



select * from CovidData