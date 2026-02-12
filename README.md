# 📊 Telco Customer Churn Analysis
---

**Telco Customer Churn Analysis** is an R-based data science project designed to identify the key factors that lead to customer "churn" (cancellation of service) in a telecommunications company. By analyzing demographic data and service usage, this tool helps businesses understand which customers are most likely to leave and why.

## ✅ Features
---
* **Data Cleaning:** Automated handling of missing values in the `TotalCharges` column.
* **Demographic Insights:** Analysis of how age and seniority impact attrition.
* **Contract Analysis:** Visual comparison of Month-to-Month vs. Long-term loyalty.
* **Visualizations:** High-quality plots generated using `ggplot2`.

## 🚀 Installation
---
### 1. Clone the repository:
```bash
git clone [https://github.com/jtp-codes/Telco_Customer_Churn-using-R-.git](https://github.com/jtp-codes/Telco_Customer_Churn-using-R-.git)
cd Telco_Customer_Churn-using-R-

```

### 2. Install R dependencies:

```r
install.packages(c("tidyverse", "scales", "ggplot2"))

```

## 📈 Key Insights

---

* **Churn Distribution:** Approximately **26%** of the customer base has churned.
* **Senior Citizens:** This demographic shows a significantly higher churn rate (over **40%**).
* **Contract Type:** Month-to-Month customers are the most likely to churn (**43%**) compared to two-year plans (**3%**).

## 📂 Repository Structure

---

* `Telco_Customer_Churn.R`: Main processing and logic script.
* `WA_Fn-UseC_-Telco-Customer-Churn.csv`: Raw dataset.
* `README.md`: Project documentation.

## 🛠️ Requirements

---

* **R 4.0+**
* **tidyverse**
* **ggplot2**
* **scales**

---