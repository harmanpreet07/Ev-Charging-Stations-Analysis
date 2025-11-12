use ev_stations


select count(*)
from ev_stations_2025


SELECT 
  SUM(CASE WHEN title IS NULL OR title = '' THEN 1 ELSE 0 END) AS missing_title,
  SUM(CASE WHEN address IS NULL OR address = '' THEN 1 ELSE 0 END) AS missing_address,
  SUM(CASE WHEN town IS NULL OR town = '' THEN 1 ELSE 0 END) AS missing_town,
  SUM(CASE WHEN state IS NULL OR state = '' THEN 1 ELSE 0 END) AS missing_state,
  SUM(CASE WHEN postcode IS NULL OR postcode = '' THEN 1 ELSE 0 END) AS missing_postcode
FROM ev_stations_2025;


select country as country, count(*) as total_stations
from ev_stations_2025
group by country
order by total_stations desc


select top 10 town as towns, count(*) as total_stations
from ev_stations_2025
group by town
order by total_stations desc



select status, count(*) as total_stations
from ev_stations_2025
group by status;



select avg(num_connectors) as connectors
from ev_stations_2025;



select top 5 operator, count(*) as stations
from ev_stations_2025
group by operator
order by stations desc


select operator, avg(num_connectors) as avg_connector
from ev_stations_2025
group by operator
order by avg_connector desc


select connector_types, count(*) as total
from ev_stations_2025
group by connector_types
order by total desc



select country, state, count(*) as stations_count
from ev_stations_2025
where state is not null
group by country, state
order by stations_count desc;




select top 5 id, title, town, num_connectors as connector
from ev_stations_2025
order by connector desc


select *
from ev_stations_2025
where address is null or address = '';




select year(date_added) as year_added, count(*) as stations
from ev_stations_2025
where date_added is not null
group by year(date_added)
order by year_added;


SELECT country, operator, total_stations
FROM (
  SELECT country, operator, COUNT(*) AS total_stations,
         ROW_NUMBER() OVER (PARTITION BY country ORDER BY COUNT(*) DESC) AS rank_no
  FROM ev_stations_2025
  GROUP BY country, operator
) ranked
WHERE rank_no <= 3;


select top 10 country , avg(num_connectors) as connectors
from ev_stations_2025
group by country
order by connectors desc;

select * 
from ev_stations_2025
where try_cast(date_added as date) >= dateadd(day, -30, getdate())

