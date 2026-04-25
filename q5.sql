WITH monthly_data AS (
    SELECT 
        DATE_TRUNC('month', s.start_date) AS month,
        s.plan_id,

        COUNT(*) AS new_subscriptions,

        COUNT(*) FILTER (
            WHERE c.churned_at IS NOT NULL
        ) AS churned

    FROM nimbus.subscriptions s
    JOIN nimbus.customers c 
        ON s.customer_id = c.customer_id

    GROUP BY month, s.plan_id
)

SELECT 
    month,
    plan_id,
    new_subscriptions,
    churned,

    ROUND(
        churned * 1.0 / NULLIF(new_subscriptions, 0), 2
    ) AS churn_rate

FROM monthly_data
ORDER BY month;