# 📊 Customer Churn Prediction & Retention Analysis

This repository contains an **end-to-end data science project** on predicting customer churn in a telecom dataset and deriving actionable business insights.  
The project combines **Python (ML models)**, **SQL (exploratory queries)**, **Streamlit (app deployment)**, and **Power BI (business dashboards)** to build a complete churn analysis pipeline.

---

## 🚀 Project Overview
Customer churn (when customers stop using a service) is a major problem in the telecom industry.  
By predicting churn early, businesses can take proactive measures to **retain high-risk customers** and **reduce revenue loss**.  

This project covers:
- Data preprocessing & feature engineering
- Machine Learning model training (Logistic Regression, XGBoost)
- Churn probability scoring for each customer
- Deployment of an interactive **Streamlit app** for churn prediction
- **SQL analysis** to explore churn trends
- **Power BI dashboards** to visualize churn drivers and ROI scenarios
- Actionable **business insights** for retention

---

## 🔧 Tech Stack
- **Python** (pandas, scikit-learn, xgboost, joblib, matplotlib, seaborn)
- **Machine Learning**: Logistic Regression, XGBoost
- **SQL**: Customer churn queries (joins, aggregations, churn drivers)
- **Streamlit**: For interactive app deployment
- **Power BI**: For dashboards & business storytelling
- **GitHub**: Version control & project sharing

---

## 🗂️ SQL Component
The file `slq_churn_clv_analusis` contains SQL queries for:
- Churn rate by **contract type**, **payment method**, **internet service**
- Monthly churn trends
- Customer segmentation by tenure groups
- Revenue at risk due to churn

These queries can be executed in **MySQL / PostgreSQL / SQLite** to replicate churn analysis directly in a database environment.

---

## 📊 Power BI Dashboard Highlights
- **Page 1:** Overview (Churn %, Revenue at Risk, High-Risk Customers)  
- **Page 2:** Churn Drivers (Contract Type, Payment Method, Tenure × Internet)  
- **Page 3:** Targeting List (High-risk customers filtered by churn probability)  
- **Page 4:** ROI & Lift (Saved revenue from retention campaigns)  

---

## 💡 Key Insights
- **Month-to-Month contracts** have the highest churn rate.  
- Customers using **Electronic Check** payment churn more than Auto-pay users.  
- **Low tenure (0–12 months)** customers are more likely to churn.  
- **Fiber optic customers with high charges** are at higher risk.  
- With targeted retention, **up to 15–20% of at-risk revenue can be saved**.

---

## ▶️ How to Run

### 1️⃣ Clone the Repository
```bash
git clone https://github.com/yourusername/customer-churn-project.git
cd customer-churn-project

pip install -r requirements.txt

streamlit run app/app.py

---
4️⃣ Load SQL File

Run sql/churn_analysis.sql in MySQL/PostgreSQL to reproduce churn insights.
---

5️⃣ Open Power BI Dashboard

Load dashboards/elevate_project.pbix in Power BI Desktop.

---

📜 Business Value

This project blends machine learning predictions with SQL analysis and business dashboards,
enabling decision-makers to identify high-risk customers, target retention campaigns, and minimize revenue loss.
---

##👤 Author

Jaya Bijore
MBA | Data Analyst | Machine Learning Enthusiast
