/*
Enter your query here.
*/
Select round(St.LAT_N,4) mediam
 from station St 
 where (select count(Lat_N) from station
 where Lat_N < St.LAT_N ) = (select count(Lat_N) from station
 where Lat_N > St.LAT_N)