SELECT
    station_name,
    ridership_2013,
    ridership_2014,
    ridership_2015,
    ridership_2016,
    (ridership_2013 + ridership_2014 + ridership_2015 + ridership_2016) / 4 AS average
FROM
    `bigquery-public-data.new_york_subway.subway_ridership_2013_present`
ORDER BY
    average DESC
