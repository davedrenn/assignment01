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
    start_station AS station_id,
    station_geog,
    COUNT(*) AS num_trips
FROM
    (
        SELECT
            duration,
            start_time,
            end_time,
            geography AS station_geog,
            start_station
        FROM indego.trips_2021_q3
        UNION ALL
        SELECT
            duration,
            start_time,
            end_time,
            geography AS station_geog,
            start_station
        FROM indego.trips_2022_q3
    )
WHERE
    EXTRACT(
        DAY FROM start_time::TIMESTAMP
    ) != EXTRACT(
        DAY FROM end_time::TIMESTAMP
    )
GROUP BY trip_year, trip_quarter;

/*
    Hint: Use the `EXTRACT` function to get the hour of the day from the
    timestamp.
*/
