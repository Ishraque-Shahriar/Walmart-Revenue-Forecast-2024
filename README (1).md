# 📊 Walmart Revenue Forecast 2024

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

## 📉 Outputs & Interpretation
- 📊 The script generates time series plots and forecasts revenue for the next 8 quarters.
- 📏 Accuracy measures such as MAPE and RMSE are calculated to evaluate model performance.
- 🏆 The best-performing model is used for final forecasting.

## 🤝 Contribution
Feel free to contribute by submitting a pull request or raising an issue for improvements.

## 📜 License
This project is open-source under the MIT License.
