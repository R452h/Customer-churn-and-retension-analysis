WITH customer_ltv AS (
    SELECT 
        s.customer_id,
        p.plan_name,
        SUM(p.monthly_price_usd) AS ltv
    FROM nimbus.subscriptions s
    JOIN nimbus.plans p 
        ON s.plan_id = p.plan_id
    GROUP BY s.customer_id, p.plan_name
)

SELECT 
    customer_id,
    plan_name,
    ltv,

    RANK() OVER (
        PARTITION BY plan_name 
        ORDER BY ltv DESC
    ) AS rank_in_plan,

    AVG(ltv) OVER (
        PARTITION BY plan_name
    ) AS avg_plan_ltv,

    ROUND(
        (ltv - AVG(ltv) OVER (PARTITION BY plan_name)) 
        / NULLIF(AVG(ltv) OVER (PARTITION BY plan_name), 0) * 100, 
        2
    ) AS percent_diff

FROM customer_ltv;