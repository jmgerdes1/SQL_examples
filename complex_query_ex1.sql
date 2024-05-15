with sales_history as (
    SELECT
        EXTRACT(YEAR FROM Date) AS YEAR,
        EXTRACT(MONTH FROM Date) AS MONTH,
        ProductID,
        StoreID,
        SUM(quantity) AS UnitsSold,
        AVG(UnitPrice) AS UnitPriceProxy,
        COUNT(DISTINCT salesID) AS NumTransactions
    FROM
        `proven-concept-421613.Sales.sales_info`
    GROUP BY YEAR, MONTH, ProductId, StoreID
)
SELECT
    inventory.*,
    (
        SELECT
            AVG(UnitsSold) FROM sales_history
        WHERE inventory.ProductID = sales_history.ProductID
            AND inventory.StoreID = sales_history.StoreID
    ) AS avg_quantity_sold_in_a_month
FROM
    `proven-concept-421613.Sales.inventory` AS inventory
