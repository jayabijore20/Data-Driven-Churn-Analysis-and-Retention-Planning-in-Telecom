CREATE DATABASE IF NOT EXISTS churn_clv_analysis;
SHOW DATABASES
USE churn_clv_analysis;

CREATE TABLE telco_customer_churn (
    customerID VARCHAR(50) PRIMARY KEY,
    gender TINYINT,                
    SeniorCitizen TINYINT,         
    Partner TINYINT,               
    Dependents TINYINT,            
    tenure INT,
    PhoneService TINYINT,          
    MultipleLines TINYINT,         
    OnlineSecurity TINYINT,        
    OnlineBackup TINYINT,          
    DeviceProtection TINYINT,      
    TechSupport TINYINT,           
    StreamingTV TINYINT,           
    StreamingMovies TINYINT,       
    PaperlessBilling TINYINT,      
    MonthlyCharges DECIMAL(10,2),
    TotalCharges DECIMAL(10,2),
    Churn TINYINT,                 
    InternetService_Fiber_optic TINYINT,
    InternetService_No TINYINT,
    Contract_One_year TINYINT,
    Contract_Two_year TINYINT,
    PaymentMethod_Credit_card_automatic TINYINT,
    PaymentMethod_Electronic_check TINYINT,
    PaymentMethod_Mailed_check TINYINT
);

SELECT * FROM telco_customer_churn

drop table telco_customer_churn

LOAD DATA  INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/telco_customer_churn.csv"
INTO TABLE telco_customer_churn
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Total rows loaded
SELECT COUNT(*) FROM telco_customer_churn;

-- -- Check if any TotalCharges = 0 but tenure > 0 (to spot anomalies)

SELECT   customerID, tenure, Monthlycharges, Totalcharges
FROM telco_customer_churn
WHERE Totalcharges = 0 and tenure > 0;


-- check missing values 
SELECT COUNT(*) AS ZERO_Totalcharges
FROM telco_customer_churn
WHERE Totalcharges = 0 ;

-- stats
SELECT 
MIN(Totalcharges) AS MIN_Totalchages,
AVG(Totalcharges) AS AVG_Totalchages,
MAX(Totalcharges) AS MAX_Totalchages
FROM telco_customer_churn;

-- 1 Total Customers, Churned Customers, and Churn Rate
SELECT COUNT(*) AS Total_customer,
SUM(churn) AS Total_churn,
ROUND(SUM(CHURN) * 100.0 / COUNT(*), 2)
FROM telco_customer_churn;

-- 2 Average Monthly Charges (Churned vs Retained)
SELECT churn, 
round(AVG(MonthlyCharges), 2) AS avg_MonthlyCharges
FROM telco_customer_churn
GROUP BY churn;

-- 3 Churn rate by gender 
SELECT gender,
round(SUM(churn) * 100 / count(*), 2) AS CHURN_RATE_BY_GENDER
FROM telco_customer_churn
GROUP BY gender;

-- 4 Churn Rate by Contract Type
SELECT 
    CASE
    WHEN  Contract_One_year = 1 THEN "Contract_One_year"
    WHEN  Contract_Two_year = 1 THEN "Contract_Two_year"
    ELSE "MONTH_TO MONTH"
END AS Contract_type,
 COUNT(*) AS total_customers ,
 SUM(churn) AS total_churners,
 ROUND(SUM(churn) * 100.0 / COUNT(*), 2) AS CHURN_RATE_PERCENTAGE
 FROM  telco_customer_churn
 GROUP BY Contract_type;
 
 -- 5 Average Tenure (Churned vs Retained)
 SELECT churn,
 round(AVG(tenure), 1 ) AS AVG_TENURE
 FROM telco_customer_churn
 GROUP BY churn
 
 -- 6 Customer Lifetime Value (CLV) Estimation
👉--  CLV = MonthlyCharges × Tenure (approximation, ignoring discounts)
SELECT customerID,
tenure,
MonthlyCharges,
ROUND(MonthlyCharges * tenure, 2) AS Estimated_CLV
FROM  telco_customer_churn
ORDER BY Estimated_CLV DESC
LIMIT 10 ;

-- 7 Churn Rate by Internet Service Type
SELECT 
   CASE 
   WHEN InternetService_Fiber_optic = 1 THEN "Fiber optic"
   WHEN InternetService_No = 1 THEN  "NO Service"
   ELSE 'DSL'
   END AS INTERNET_SERVICE,
   COUNT(*) AS Total_customer,
   SUM(churn) AS Total_churn,
   ROUND(SUM(churn) * 100.0 / count(*),2) AS churn_rate_percentage
   FROM telco_customer_churn
   group by INTERNET_SERVICE  
   
 
 -- 8 Profitability Risk: High Monthly Charges & Churn
 SELECT 
    CASE 
    WHEN MonthlyCharges < 50 THEN "Low"
    WHEN MonthlyCharges BETWEEN 50 AND 90 THEN "Medium"
    ELSE "High"
    END AS Charges_Category ,
    COUNT(*) AS Total_Customer,
    SUM(churn) AS Total_churn,
    ROUND(SUM(churn) * 100.0 / COUNT(*), 2) AS Churn_rate_percentage
    FROM telco_customer_churn
    GROUP BY Charges_Category
    ORDER BY Churn_rate_percentage;
    
    
    -- 9 Top Payment Methods by Churned Customers
    SELECT 
       CASE 
       WHEN PaymentMethod_Credit_card_automatic = 1 THEN "Credit_card(auto)"
       WHEN  PaymentMethod_Electronic_check = 1 THEN "Electronic_check"
       WHEN PaymentMethod_Mailed_check = 1 THEN "Mailed_check"
       ELSE "Bank transfer(auto)"
       END AS PAYMENT_METHOD,
       COUNT(*) AS Total_cstomer,
       SUM(churn) AS Total_churn,
       ROUND(SUM(churn) * 100.0 / COUNT(*), 2) AS churn_rate_percentage
       FROM telco_customer_churn
  GROUP BY PAYMENT_METHOD
  ORDER BY churn_rate_percentage
  DESC LIMIT 5;
    
    
