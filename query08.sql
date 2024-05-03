/*
    Give the five most popular starting stations across all years between 7am
    and 9:59am.

    Your result should have 5 records with three columns, one for the station id
    (named `station_id`), one for the point geography of the station (named
    `station_geog`), and one for the number of trips that started at that
    station (named `num_trips`).
*/

-- Enter your SQL query here

SELECT
    commute.start_station AS station_id,
    status.geog AS station_geog,
    COUNT(*) AS num_trips
FROM (
    SELECT start_station
    FROM indego.trips_2021_q3
    WHERE EXTRACT(HOUR FROM start_time) BETWEEN 7 AND 9
    UNION ALL
    SELECT start_station
    FROM indego.trips_2022_q3
    WHERE EXTRACT(HOUR FROM start_time) BETWEEN 7 AND 9
) AS commute
INNER JOIN indego.station_statuses AS status
    ON commute.start_station = status.id::TEXT
GROUP BY commute.start_station, status.geog
ORDER BY num_trips DESC
LIMIT 5;

/*
    Hint: Use the `EXTRACT` function to get the hour of the day from the
    timestamp.
*/
