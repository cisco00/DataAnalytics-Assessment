use adashi_staging;
WITH customer_transactions AS (
    SELECT
        sa.owner_id AS customer_id,
        COUNT(*) AS total_transactions,
        SUM(sa.confirmed_amount) AS total_amount
    FROM
        savings_savingsaccount sa
    GROUP BY
        sa.owner_id
),
customer_tenure AS (
    SELECT
        id AS customer_id,
        name,
        DATEDIFF(CURDATE(), signup_date) / 30.0 AS tenure_months -- Approximate months
    FROM
        users_customuser
)
SELECT
    ct.customer_id,
    cu.name,
    ct.total_amount AS total_amount,
    ROUND(ct2.tenure_months, 2) AS tenure_months,
    ROUND((ct.total_transactions / ct2.tenure_months) * 12 * (0.001 * (ct.total_amount / ct.total_transactions)), 2) AS estimated_clv
FROM
    customer_transactions ct
JOIN
    users_customuser cu ON ct.customer_id = cu.id
JOIN
    customer_tenure ct2 ON ct.customer_id = ct2.customer_id
ORDER BY
    estimated_clv DESC;