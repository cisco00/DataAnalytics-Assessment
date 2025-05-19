WITH monthly_transactions AS (
    SELECT
        u.id AS customer_id,
        u.name,
        strftime('%Y-%m', sa.transaction_date) AS transaction_month,
        COUNT(*) AS transaction_count
    FROM
        users_customuser u
    JOIN
        savings_savingsaccount sa ON u.id = sa.owner_id
    GROUP BY
        u.id, u.name, strftime('%Y-%m', sa.transaction_date)
),
avg_monthly_transactions AS (
    SELECT
        customer_id,
        name,
        AVG(transaction_count) AS avg_transactions_per_month
    FROM
        monthly_transactions
    GROUP BY
        customer_id, name
)
SELECT
    CASE
        WHEN avg_transactions_per_month >= 10 THEN 'High Frequency'
        WHEN avg_transactions_per_month BETWEEN 3 AND 9 THEN 'Medium Frequency'
        ELSE 'Low Frequency'
    END AS frequency_category,
    COUNT(*) AS customer_count,
    AVG(avg_transactions_per_month) AS avg_transactions_per_month
FROM
    avg_monthly_transactions
GROUP BY
    1;