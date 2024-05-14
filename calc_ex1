SELECT
    Date,
    Region,
    Small_Bags,
    Total_Bags,
    (Small_Bags / Total_Bags) * 100 AS Small_Bags_Percent
FROM `proven-concept-421613.avocado_data.avocado_prices`
WHERE
    Total_Bags <> 0
