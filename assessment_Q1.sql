SELECT
    u.id AS owner_id,
    u.name,
    COUNT(DISTINCT CASE WHEN p.is_regular_savings = 1 THEN p.id ELSE NULL END) AS savings_count,
    COUNT(DISTINCT CASE WHEN p.is_a_fund = 1 THEN p.id ELSE NULL END) AS investment_count,
    SUM(sa.confirmed_amount) AS total_deposits
FROM
    users_customuser u
JOIN
    plans_plan p ON u.id = p.owner_id
LEFT JOIN
    savings_savingsaccount sa ON p.id = sa.plan_id
WHERE
    p.is_regular_savings = 1 OR p.is_a_fund = 1
GROUP BY
    u.id, u.name
HAVING
    COUNT(DISTINCT CASE WHEN p.is_regular_savings = 1 THEN p.id ELSE NULL END) >= 1 AND
    COUNT(DISTINCT CASE WHEN p.is_a_fund = 1 THEN p.id ELSE NULL END) >= 1
ORDER BY
    total_deposits DESC;