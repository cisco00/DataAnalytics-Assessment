use adashi_staging;
SELECT
    p.id AS plan_id,
    p.owner_id,
    CASE
        WHEN p.is_regular_savings = 1 THEN 'Savings'
        WHEN p.is_a_fund = 1 THEN 'Investment'
        ELSE 'Unknown'
    END AS type,
    MAX(sa.transaction_date) AS last_transaction_date,
    DATEDIFF(CURDATE(), MAX(sa.transaction_date)) AS inactivity_days
FROM
    plans_plan p
JOIN
    savings_savingsaccount sa ON p.id = sa.plan_id
WHERE
    p.is_regular_savings = 1 OR p.is_a_fund = 1
GROUP BY
    p.id, p.owner_id
HAVING
    inactivity_days > 365;