WITH plan_changes AS (
    SELECT 
        customer_id,
        plan_id,
        start_date,
        LAG(plan_id) OVER (
            PARTITION BY customer_id 
            ORDER BY start_date
        ) AS previous_plan
    FROM nimbus.subscriptions
),

ticket_counts AS (
    SELECT 
        customer_id,
        COUNT(*) AS total_tickets
    FROM nimbus.support_tickets
    WHERE created_at >= CURRENT_DATE - INTERVAL '90 days'
    GROUP BY customer_id
)

SELECT 
    pc.customer_id,
    pc.previous_plan,
    pc.plan_id AS current_plan,
    tc.total_tickets

FROM plan_changes pc
JOIN ticket_counts tc 
    ON pc.customer_id = tc.customer_id

WHERE pc.previous_plan IS NOT NULL
AND pc.plan_id < pc.previous_plan   -- downgrade
AND pc.start_date >= CURRENT_DATE - INTERVAL '90 days'
AND tc.total_tickets > 3;