
--Question 1: What is the mean temperature for flights from each airport?
SELECT origin AS airport, AVG(temp) AS mean_temp
FROM weather
GROUP BY origin;

--The mean temp for each airport: JFK was 54.47 degrees, LGA was 55.76 degrees, and EWR was 55.55 degrees. 


--Question 2: What is the average number of flights from each airport per day in January?
SELECT origin AS airport, COUNT(*) / COUNT(DISTINCT day) AS avg_flights_per_day
FROM flights
WHERE month = 1
GROUP BY origin;

--The average number of flights from each airport per day in January: JFK was 11262 flights, EWR was 6,100
--  flights, and LGA was 10263 flights per day.


--Question 3: What are the top destinations for each airport?
SELECT origin AS airport, dest AS top_destination, COUNT(*) AS flight_count
FROM flights
GROUP BY origin, dest
ORDER BY origin, flight_count DESC;

--The top desination for JFK was LAX, for EWR it was ORD, and for LGA it was ATL. 
