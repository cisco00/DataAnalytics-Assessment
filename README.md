# Data Analytics Assessment

This repository contains the SQL solutions for the Data Analyst Assessment. 
The assessment involved analyzing a database with four tables: `users_customuser`, 
`savings_savingsaccount`,`plans_plan`, and `withdrawals_withdrawal` to answer specific business questions.

## Repository Structure

DataAnalytics-Assessment/

├── README.md

├── question_1.sql

├── question_2.sql

├── question_3.sql

└── question_4.sql

## Assessment Questions and Solutions

The assessment presented four distinct business problems, each requiring a specific SQL query to solve. The solutions for each question are provided in the corresponding `.sql` file within the `sql_solutions` directory.

### 1. High-Value Customers with Multiple Products (`question_1.sql`)

**Scenario:** Identify high-value customers who have both a savings and an investment product.

**Task:** List the owner's ID, name, the count of savings plans, the count of investment plans, and 
the total deposit amount for these customers, ordered by total deposits in descending order.

**SQL File:** `sql_solutions/question_1.sql`

### 2. Transaction Frequency Analysis (`question_2.sql`)

**Scenario:** The finance team wants to analyze how often customers transact to segment
them (e.g., frequent vs. occasional users).

**Task:** Calculate the average number of transactions per customer per month and
categorize them:

●​ "High Frequency" (≥10 transactions/month)

●​ "Medium Frequency" (3-9 transactions/month)

●​ "Low Frequency" (≤2 transactions/month).

**SQL File:** `sql_solutions/question_2.sql`

### 3. Account Inactivity Alert (`question_3.sql`)

**Scenario:** The ops team wants to flag accounts with no inflow transactions for over one
year.

**Task:** Find all active accounts (savings or investments) with no transactions in the last 1
year (365 days).

**SQL File:** `sql_solutions/question_3.sql`

### 4. Customer Lifetime Value (CLV) Estimation (`question_4.sql`)

**Scenario:** Marketing wants to estimate CLV based on account tenure and transaction
volume (simplified model).

**Task:** For each customer, calculate the account tenure in months since signup, the total number 
of transactions, and the estimated CLV using the formula: `CLV = (total_transactions / tenure) * 12 * avg_profit_per_transaction`, 
assuming a `profit_per_transaction` of 0.1% of the transaction value. Order the results by estimated 
CLV from highest to lowest.

**SQL File:** `sql_solutions/question_4.sql`

## Running the Solutions

To execute these SQL queries, you will need a MySQL database environment. You can use a MySQL client 
or the command-line interface.

1.  **Connect to your MySQL server:**
    ```bash
    mysql -u <your_username> -p
    ```
2.  **Select the database** where you have created the four 
tables (`users_customuser`, `savings_savingsaccount`, `plans_plan`, `withdrawals_withdrawal`). 

3.  **Execute each SQL file:** You can execute each `.sql` file using the `source` command in the MySQL client:
    ```sql
    SOURCE /path/to/your/sql_solutions/question_1.sql;
    SOURCE /path/to/your/sql_solutions/question_2.sql;
    SOURCE /path/to/your/sql_solutions/question_3.sql;
    SOURCE /path/to/your/sql_solutions/question_4.sql;
    ```
    Replace `/path/to/your/sql_solutions/` with the actual path to the `sql_solutions` directory on your system.

Alternatively, you can open, copy and paste the content of each `.sql` file directly into your MySQL client and execute the queries.

## Notes

-   The SQL queries are written in standard SQL and are compatible with MySQL.
-   Comments have been added within the SQL files to explain the logic and steps involved in each query.
-   The CLV calculation in `question_4.sql` uses an assumed profit per transaction of 0.1% as specified in the problem description.
-   The date calculations for inactivity in `question_3.sql` assume the current date for the comparison. When running the query, it will use the system's current date.
