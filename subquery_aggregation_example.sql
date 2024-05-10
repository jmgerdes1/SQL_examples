SELECT 
    Warehouse.warehouse_id,
    CONCAT(Warehouse.state, ': ', Warehouse.warehouse_alias) AS warehouse_name,
    COUNT(Orders.order_id) AS number_of_orders,
    (
      SELECT
          COUNT(*)
      FROM proven-concept-421613.warehouse_orders.orders AS Orders
    ) AS total_orders,
    CASE
        WHEN COUNT(Orders.order_id)/(SELECT COUNT(*) FROM proven-concept-421613.warehouse_orders.orders AS Orders) <= .20
            THEN 'Fulfilled 0-20% of Orders'
        WHEN COUNT(Orders.order_id)/(SELECT COUNT(*) FROM proven-concept-421613.warehouse_orders.orders AS Orders) > .20
            AND COUNT(Orders.order_id)/(SELECT COUNT(*) FROM proven-concept-421613.warehouse_orders.orders AS Orders) <= .60
            THEN 'Fulfilled 20-60% of Orders'
        ELSE 'Fulfilled more than 60% of Orders'
        END AS fulfillment_summary

FROM
    `proven-concept-421613.warehouse_orders.warehouse` AS Warehouse

LEFT JOIN proven-concept-421613.warehouse_orders.orders AS Orders
ON Orders.warehouse_id = Warehouse.warehouse_id

GROUP BY
    Warehouse.warehouse_id,
    warehouse_name

HAVING
  COUNT(Orders.order_id) > 0
