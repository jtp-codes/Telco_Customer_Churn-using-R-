# ===============================
# Telco Customer Churn Analysis
# ===============================

# Load required libraries
library(readr)
library(dplyr)
library(ggplot2)
library(tidyr)
library(scales)

suppressPackageStartupMessages({
  library(readr)
  library(dplyr)
  library(ggplot2)
  library(tidyr)
  library(scales)
})

# Load data
cat("data frame\n")
df <- read_csv("WA_Fn-UseC_-Telco-Customer-Churn.csv")
print(head(df, 100))

# Replace blanks in TotalCharges and convert to numeric
df <- df %>%
  mutate(
    TotalCharges = ifelse(TotalCharges == " ", "0", TotalCharges),
    TotalCharges = as.numeric(TotalCharges)
  )

# Basic data checks
str(df)
summary(df)

cat("Null values by column:\n")
print(colSums(is.na(df)))
cat("Total null values:", sum(is.na(df)), "\n")

cat("Duplicate rows:", sum(duplicated(df)), "\n")
cat("Duplicate customerIDs:", sum(duplicated(df$customerID)), "\n")

# Convert SeniorCitizen from 0/1 to Yes/No
df <- df %>%
  mutate(SeniorCitizen = ifelse(SeniorCitizen == 1, "Yes", "No"))

print(head(df, 30))

# Count of customers by churn
ggplot(df, aes(x = Churn)) +
  geom_bar(fill = "steelblue") +
  geom_text(stat = "count", aes(label = after_stat(count)), vjust = -0.3) +
  labs(title = "Count of Customers by Churn")

# Pie chart of churn percentage
churn_counts <- df %>% count(Churn) %>% mutate(pct = n / sum(n))

ggplot(churn_counts, aes(x = "", y = pct, fill = Churn)) +
  geom_col(width = 1) +
  coord_polar(theta = "y") +
  geom_text(aes(label = percent(pct)), position = position_stack(vjust = 0.5)) +
  labs(title = "Percentage of Churned Customers") +
  theme_void()

# Churn by gender
ggplot(df, aes(x = gender, fill = Churn)) +
  geom_bar(position = "dodge") +
  labs(title = "Churn by Gender")

# Count of customers by SeniorCitizen
ggplot(df, aes(x = SeniorCitizen)) +
  geom_bar(fill = "darkorange") +
  geom_text(stat = "count", aes(label = after_stat(count)), vjust = -0.3) +
  labs(title = "Count of Customers by Senior Citizen")

# Stacked bar chart: Churn by SeniorCitizen (percentage)
senior_churn <- df %>%
  count(SeniorCitizen, Churn) %>%
  group_by(SeniorCitizen) %>%
  mutate(pct = n / sum(n))

ggplot(senior_churn, aes(x = SeniorCitizen, y = pct, fill = Churn)) +
  geom_col() +
  geom_text(aes(label = percent(pct)), position = position_stack(vjust = 0.5)) +
  scale_y_continuous(labels = percent) +
  labs(
    title = "Churn by Senior Citizen (Stacked Bar Chart)",
    y = "Percentage",
    x = "SeniorCitizen"
  )

# Tenure distribution
ggplot(df, aes(x = tenure)) +
  geom_histogram(bins = 72, fill = "skyblue", color = "black") +
  labs(title = "Tenure Distribution")

# Churn by contract type
ggplot(df, aes(x = Contract, fill = Churn)) +
  geom_bar(position = "dodge") +
  geom_text(stat = "count", aes(label = after_stat(count)),
            position = position_dodge(width = 0.9), vjust = -0.3) +
  labs(title = "Count of Customers by Contract")

# Service-related columns
print(colnames(df))

service_cols <- c(
  "PhoneService", "MultipleLines", "InternetService", "OnlineSecurity",
  "OnlineBackup", "DeviceProtection", "TechSupport",
  "StreamingTV", "StreamingMovies"
)

# Loop through service columns and create plots
for (col in service_cols) {
  p <- ggplot(df, aes(x = .data[[col]], fill = Churn)) +
    geom_bar(position = "dodge") +
    labs(title = paste("Count Plot of", col), x = col, y = "Count")
  print(p)
}

# Churn by payment method
ggplot(df, aes(x = PaymentMethod, fill = Churn)) +
  geom_bar(position = "dodge") +
  geom_text(stat = "count", aes(label = after_stat(count)),
            position = position_dodge(width = 0.9), vjust = -0.3) +
  labs(title = "Churned Customers by Payment Method") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
# Customer Financial Attrition Profile
ggplot(df, aes(x = Churn, y = MonthlyCharges, fill = Churn)) +
# a violin plot to show the 'shape' of the data
  geom_violin(alpha = 0.2, color = NA) +
# a narrowed boxplot inside
  geom_boxplot(width = 0.2, outlier.colour = "red", outlier.shape = 16, outlier.size = 1, alpha = 0.5) +
#  jittered points to show the actual number of customers
  geom_jitter(width = 0.1, alpha = 0.1, size = 0.5) +
  scale_fill_manual(values = c("No" = "#2c3e50", "Yes" = "#e74c3c")) +
  labs(
    title = "Analysis of Monthly Charges & Customer Attrition",
    subtitle = "Distribution shows churned customers are concentrated in higher price brackets",
    x = "Did the Customer Churn?",
    y = "Monthly Charges ($)",
    caption = "Source: Telco Churn Dataset"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    legend.position = "none",
    plot.title = element_text(face = "bold", size = 14),
    panel.grid.minor = element_blank()
  )

# Density Plot: Does tenure length determine Churn?
ggplot(df, aes(x = tenure, fill = Churn)) +
  geom_density(alpha = 0.5) +
  scale_fill_manual(values = c("No" = "green", "Yes" = "red")) +
  labs(title = c("When do they leave? Tenure Density by Churn"),
      subtitle = c("Higher density at low tenure indicates early-stage churn risk"),
       x = "Tenure (Months)", y = "Density") +
  theme_minimal()

# Create separate 'mountains' for each Internet Service type
ggplot(df, aes(x = MonthlyCharges, fill = Churn)) +
  geom_density(alpha = 0.6) + 
  facet_wrap(~InternetService, ncol = 1) + 
  scale_fill_manual(values = c("No" = "green", "Yes" = "red")) +
  labs(
    title = "Price Pressure: Monthly Charges Density by Service Type",
    subtitle = "Fiber optic users show a massive churn 'peak' at high price points",
    x = "Monthly Charges ($)",
    y = "Density"
  ) +
  theme_minimal() +
  theme(
    strip.background = element_rect(fill = "gray"),
    strip.text = element_text(face = "bold"),
    panel.spacing = unit(1, "lines")
  )
