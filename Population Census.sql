select sum(c.population)
from city c
inner join country co
on c.countrycode=co.code
where co.continent="ASIA";