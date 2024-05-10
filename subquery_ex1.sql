SELECT
  subquery.start_station_id,
  subquery.avg_duration
FROM (
  SELECT
    start_station_id,
    AVG(tripduration) as avg_duration
  FROM bigquery-public-data.new_york_citibike.citibike_trips
  GROUP BY start_station_id
) as subquery
ORDER BY avg_duration DESC;
