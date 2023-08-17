/*
Enter your query here.
*/
select (round(max(Long_W),4)) from station 
where lat_n=(select(min(lat_n)) from station where lat_n>38.7780);