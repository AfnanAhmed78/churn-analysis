USE customer_churn_db;



SELECT COUNT(*) AS Total_Customers
FROM customer_churn_cleaned;

SELECT COUNT(*) AS Churned_Customers
FROM customer_churn_cleaned
WHERE Churn = 'Yes';

SELECT COUNT(*) AS Retained_Customers
FROM customer_churn_cleaned
WHERE Churn = 'No';

SELECT
    ROUND(
        (COUNT(CASE WHEN Churn = 'Yes' THEN 1 END) * 100.0)
        / COUNT(*), 2
    ) AS Churn_Rate
FROM customer_churn_cleaned;


SELECT
    PaymentMethod,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers
FROM customer_churn_cleaned
GROUP BY PaymentMethod;

SELECT
    Contract,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers
FROM customer_churn_cleaned
GROUP BY Contract;


SELECT
    InternetService,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers
FROM customer_churn_cleaned
GROUP BY InternetService;


SELECT
    TenureGroup,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers
FROM customer_churn_cleaned
GROUP BY TenureGroup;