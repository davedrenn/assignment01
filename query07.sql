/*
    How many trips started on one day and ended on a different day?

    Your result should have one column named trip_year, one column named
    trip_quarter, and one column named num_trips.
*/

-- Enter your SQL query here

SELECT
    EXTRACT(YEAR FROM start_time) AS trip_year,
    EXTRACT(QUARTER FROM start_time) AS trip_quarter,
    COUNT(*) AS num_trips
FROM
    (
        SELECT
            duration,
            start_time,
            end_time
        FROM indego.trips_2021_q3
        UNION ALL
        SELECT
            duration,
            start_time,
            end_time
        FROM indego.trips_2022_q3
    )
WHERE
    EXTRACT(
        DAY FROM start_time::TIMESTAMP
    ) != EXTRACT(
        DAY FROM end_time::TIMESTAMP
    )
GROUP BY trip_year, trip_quarter;
