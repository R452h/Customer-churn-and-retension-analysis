SELECT * FROM nimbus.customers LIMIT 5;
SELECT 
    p.plan_name,

    COUNT(DISTINCT s.customer_id) AS active_customers,

    AVG(p.monthly_price_usd) AS avg_monthly_revenue,

    COUNT(t.ticket_id) * 1.0 
        / COUNT(DISTINCT s.customer_id) 
        / 6 AS tickets_per_customer_per_month

FROM nimbus.subscriptions s

JOIN nimbus.plans p 
    ON s.plan_id = p.plan_id

LEFT JOIN nimbus.support_tickets t 
    ON s.customer_id = t.customer_id
    AND t.created_at >= CURRENT_DATE - INTERVAL '6 months'

WHERE s.status = 'active'

GROUP BY p.plan_name
ORDER BY active_customers DESC;