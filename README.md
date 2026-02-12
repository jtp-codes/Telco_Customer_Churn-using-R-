# 📊 Telco Customer Churn Analysis
---
**Telco Customer Churn Analysis** is an R-based data science project designed to identify why customers cancel their services. By analyzing demographics and contract types, this tool provides actionable insights to help businesses improve customer retention.

# Features
✅ Data Cleaning: Automated handling of missing TotalCharges and data type conversions.

✅ Demographic Insights: Analysis of how age and gender impact churn rates.

✅ Contract Analysis: Visual comparison of Month-to-Month vs. Long-term contracts.

✅ Visualizations: High-quality plots generated using ggplot2.

# Installation
---

# Clone the repository:
git clone https://github.com/jtp-codes/Telco_Customer_Churn-using-R-.git
cd Telco_Customer_Churn-using-R-
Install R dependencies:

# R
install.packages(c("tidyverse", "scales", "ggplot2"))

# Run the main analysis script:

Rscript Telco_Customer_Churn.R
Note: Ensure the WA_Fn-UseC_-Telco-Customer-Churn.csv file is in the same directory.

# Repository Structure
📂 Telco-Churn-Analysis
 │── 📂 plots # Generated visualization images (.png) 
 │── Telco_Customer_Churn.R # Main processing and logic script 
 │── WA_Fn-UseC...csv # Raw dataset (Sourced from Kaggle) 
 │── README.md # Project documentation 
 │── .gitignore # Files to exclude from version control

# Key Insights
-Churn Distribution: Approximately 26% of the customer base has churned.
-Demographics: Senior citizens churn at a rate of 40%+, nearly double that of younger users.
-Contracts: Month-to-month users are at the highest risk (43% churn) compared to two-year contract holders (3%).

# Requirements:
-R 4.0+
-tidyverse
-ggplot2
-scales

# Contributing
Feel free to submit issues or pull requests to improve the analysis!