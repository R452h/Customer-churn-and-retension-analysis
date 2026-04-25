# 📊 Customer Churn and Retention Analysis for NimbusAI

## 📌 Project Overview

This project focuses on analyzing customer behavior, churn patterns, and revenue trends for NimbusAI using multiple data sources and tools. The goal is to generate actionable insights to improve customer retention and business performance.

---

## 🧰 Tools & Technologies Used

* **PostgreSQL** – Data storage and SQL analysis
* **Python (Pandas, Matplotlib)** – Data cleaning and analysis
* **Power BI** – Dashboard creation and visualization
* **MongoDB** – Handling semi-structured user activity data

---

## 🗂️ Dataset Description

### 1. Customers

* Contains customer details such as customer_id, company, country, and churned_at
* Used for churn analysis

### 2. Subscriptions

* Contains plan subscriptions with start_date and plan_id
* Used for time-based and usage analysis

### 3. Plans

* Contains pricing and plan details
* Used for revenue analysis

### 4. Support Tickets

* Contains customer issues and ticket activity
* Used for support and churn correlation

### 5. User Activity Logs (MongoDB)

* Contains user behavior events such as login, purchase, etc.
* Used for behavioral analysis

---

## 🧮 SQL Analysis

Performed using PostgreSQL:

* Plan-wise customer distribution
* Revenue analysis
* Customer segmentation
* Monthly churn analysis
* Window functions and CTEs used for advanced queries

---

## 🐍 Python Analysis

* Loaded data using Pandas
* Merged multiple tables
* Created features such as revenue and churn flag
* Calculated KPIs like churn rate and total revenue
* Visualized trends using Matplotlib

---

## 📊 Power BI Dashboard

Created an interactive dashboard with:

* KPI Cards (Total Customers, Revenue, Churn Rate, Tickets)
* Revenue by Plan (Bar Chart)
* Customer Distribution (table)
* Churn Analysis (Column Chart)
* Time Series Analysis (Line Chart)
* slicers for better interactivity

---

## 🍃 MongoDB Analysis

* Worked with semi-structured user activity data
* Performed aggregation queries to identify:

  * Most frequent actions
  * Most active users
* Identified data quality issues such as inconsistent schema and missing values

---

## 📈 Key Insights

* Higher churn observed in certain plans
* Premium plans generate higher revenue
* Customers with more support tickets tend to churn more
* User activity data shows inconsistent structure requiring cleaning

---

## ⚠️ Challenges Faced

* Data inconsistency across sources
* Handling semi-structured data in MongoDB
* Integrating multiple tools and datasets

---

## ✅ Conclusion

The project successfully demonstrates an end-to-end data analytics workflow. Insights derived from SQL, Python, Power BI, and MongoDB can help improve customer retention strategies and business decision-making.

---

## 📎 Files Included

* SQL Queries
* Python Notebook (.ipynb)
* Power BI Dashboard (.pbix)
* MongoDB Queries
* Final Report (PDF)

---

## 👤 Author

Sushant Raj
