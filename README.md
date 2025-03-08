# 📊 Walmart Revenue Forecast 2024-2025

## 📝 Project Overview
This project analyzes Walmart's historical revenue data and forecasts revenue for upcoming quarters using time series analysis in R. It employs different forecasting models such as linear trend, quadratic trend, seasonal models, and regression-based models.

## 📂 Dataset
- **File:** `Walmart_Revenue_2003_to_2023.csv`
- **Description:** Contains Walmart's quarterly revenue from 2003 to 2023.
- **Columns:**
  - 🗓️ `Date`: The time period (quarterly format).
  - 💰 `Revenue`: Walmart's revenue in millions of dollars.

## 📜 Files Included
- 📑 **`Walmart_Revenue_Forecast_2024.R`**: The R script performing the time series analysis and forecasting.
- 📊 **`Walmart_Revenue_2003_to_2023.csv`**: The dataset used for analysis.

## ⚙️ Installation & Usage
### 🔧 Prerequisites
Ensure you have R installed with the following packages:
```r
install.packages("forecast")
install.packages("ggplot2")
```

### ▶️ Running the Forecasting Script
1. 📥 Load the dataset:
   ```r
   revenue.data <- read.csv("Walmart_Revenue_2003_to_2023.csv")
   ```
2. 🏃 Run the forecasting analysis by executing `Walmart_Revenue_Forecast_2024.R`.
3. 📈 The script applies various models and generates revenue predictions.
4. 🖼️ Visualization of results is included in the script.

## 🔍 Forecasting Models Used
The project applies different models to predict future revenue:
1. 📊 **Linear Trend Model**: Assumes a constant growth rate over time.
2. 📈 **Quadratic Trend Model**: Captures potential acceleration or deceleration in revenue.
3. 📆 **Seasonal Model**: Accounts for periodic fluctuations in revenue.
4. 🔄 **Combination of Trend & Seasonality**: Uses regression-based models with both time trends and seasonality components.

## 📉 Model Performance Comparison
Below is a comparison of the different models based on key performance metrics:

| Model                            | RMSE    | MAE    | MAPE  | Theil’s U |
|----------------------------------|---------|--------|--------|-----------|
| **Linear Trend Model**           | 7,255.49  | 5,912.28  | 5.027%  | 0.738     |
| **Linear Trend + Seasonality**   | 4,700.12  | 4,017.85  | 3.428%  | 0.478     |
| **Naïve Model**                  | 9,705.71  | 8,166.43  | 6.928%  | 1.000     |
| **Seasonal Naïve Model**         | 5,863.13  | 4,827.81  | 4.081%  | 0.596     |
| **Quadratic Trend + Seasonality** | 4,690.04  | 4,044.34  | 3.478%  | 0.485     |

### **Best Model Selection**
The **Quadratic Trend + Seasonality Model** and **Linear Trend + Seasonality Model** have the best accuracy, with:
- **Lowest RMSE (4,690.04 & 4,700.12)**
- **Lowest MAE (4,044.34 & 4,017.85)**
- **Lowest MAPE (3.478% & 3.428%)**
- **Lowest Theil’s U (0.485 & 0.478)**

Both perform significantly better than the **Naïve Model**, which has the worst accuracy.

🔹 **Final Choice:**  The **Linear Trend + Seasonality Model** has the lowest MAPE (3.428%) and Theil's U (0.478), making it the best choice overall.

## 🤝 Contribution
Feel free to contribute by submitting a pull request or raising an issue for improvements.


