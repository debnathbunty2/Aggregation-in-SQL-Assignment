use World;

SHOW DATABASES;

#Count how many cities are there in each country?
select count(Name) as city_count,CountryCode as Country from city
group by CountryCode;

select * from city;

#Display all continents having more than 30 countries.
select Continent,count(Name) as country_count from country
group by Continent
having country_count>30;

#List regions whose total population exceeds 200 million.
select * from country;
select Region,sum(Population) as total_pop from country 
group by Region
having total_pop>200000000;

#Find the top 5 continents by average GNP per country.
select * from country;
select Continent,avg(GNP) as average_GNP from country
group by Continent
order by average_GNP desc
limit 5
;

#Find the total number of official languages spoken in each continent
select * from countrylanguage;
select * from country;
select count( cl.Language) as lang_count,c.Continent
from countrylanguage cl
join country c
on cl.CountryCode=c.Code
where IsOfficial="T"
group by c.Continent
order by lang_count desc;

#Find the maximum and minimum GNP for each continent.
select Continent,max(GNP) as Maximum_GNP from country
group by Continent 
order by Maximum_GNP desc;
select min(GNP),Continent
from country
group by continent ;

#Find the country with the highest average city population.

select * from country;
select Name as country,avg(Population) from country 
group by country
order by avg(Population) desc
limit 1
;

#List continents where the average city population is greater than 200,000.



select * from city;
select * from country;

select co.Continent,avg(c.Population) as avg_citypop
from city c
join country co
on c.CountryCode=co.Code
group by co.Continent
having avg_citypop > 200000
order by co.Continent desc
;

select GNP from country
order by GNP desc;

#Find the total population and average life expectancy for each continent, ordered by average life expectancy descending.
select * from country;
select Continent,sum(Population) as Population,avg(LifeExpectancy) as avg_life_expectancy
from country
group by Continent
order by avg_life_expectancy desc;

/*Find the top 3 continents with the highest average life expectancy, 
but only include those where the total population is over 200 million.*/
select * from country;
select Continent,avg(LifeExpectancy) as avg_life_expectancy,sum(Population) as total_pop
from country
group by Continent
having total_pop > 200000000
order by avg_life_expectancy desc
limit 3;

