/*
    How many stations are within 1km of Meyerson Hall?

    Your query should have a single record with a single attribute, the number
    of stations (num_stations).
*/

-- Enter your SQL query here

SELECT COUNT(*)
FROM indego.indego_station_statuses
WHERE ST_DWITHIN(
    ST_MAKEPOINT(-75.192584, 39.952415)::GEOGRAPHY,
    geography,
    1000
);
