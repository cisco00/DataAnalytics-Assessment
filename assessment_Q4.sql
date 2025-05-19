WITH customer_transactions AS (
    SELECT
        sa.owner_id AS customer_id,
        COUNT(*) AS total_transactions,
        SUM(sa.confirmed_amount) as total_amount
    FROM
        savings_savingsaccount sa
    GROUP BY
        sa.owner_id
),
customer_tenure AS (
    SELECT
        id AS customer_id,
        name,
        (JULIANDAY(DATE('now')) - JULIANDAY(signup_date)) / 30 AS tenure_months -- Approximate months
    FROM
        users_customuser
)
SELECT
    ct.customer_id,
    cu.name,
    CAST(ct.total_amount AS REAL) AS total_amount,
    CAST(ROUND(ct2.tenure_months, 2) AS REAL) AS tenure_months,
    ROUND((CAST(ct.total_transactions AS REAL) / ct2.tenure_months) * 12 * (0.001 * (ct.total_amount/ct.total_transactions)), 2) AS estimated_clv
FROM
    customer_transactions ct
JOIN
    users_customuser cu ON ct.customer_id = cu.id
JOIN customer_tenure ct2 ON ct.customer_id = ct2.customer_id
ORDER BY
    estimated_clv DESC;