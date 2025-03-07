## USE FORECAST LIBRARY.

library(forecast)

## CREATE DATA FRAME. 


# Create data frame.
revenue.data <- read.csv("673_case2.csv")

# See the first 6 records of the file.
head(revenue.data)


## USE ts() FUNCTION TO CREATE TIME SERIES DATA SET
## AND PARTITION DATA SET.
##Q1
# Function ts() takes three arguments: start, end, and freq.. 
# With quarterly data, frequency in a season (year) is equal to 4.
# Arguments start and end are pairs: (season number, period number).
revenue.ts <- ts(revenue.data$Revenue, 
                   start = c(2005, 1), end = c(2023, 4), freq = 4)
plot(revenue.ts, 
     xlab = "Quarter", ylab = "Quarterly Revenues", 
     ylim = c(70000, 180000), xaxt = 'n',
     main = "RevenueTimeSeries",
     lwd = 2, col = "blue")
axis(1, at = seq(2005,2023,1), labels=format(seq(2005,2023,1)))


revenue.stl <- stl(revenue.ts, s.window = "periodic")
autoplot(revenue.stl, main = "Autocorrelation for Quarterly Revenue")

##Q2
# Define the numbers of quarters in the training and validation sets,
# nTrain and nValid, respectively.
nValid <- 16 
nTrain <- length(revenue.ts) - nValid
train.ts <- window(revenue.ts, start = c(2005, 1), end = c(2005, nTrain))
valid.ts <- window(revenue.ts, start = c(2005, nTrain + 1), 
                   end = c(2005, nTrain + nValid))

#linear trend
train.lin <- tslm(train.ts ~ trend)

# See summary of linear trend model and associated parameters.
summary(train.lin)

# Apply forecast() function to make forecast for validation period.
train.lin.pred <- forecast(train.lin, h = nValid, level = 0)  
train.lin.pred

#quadratic trend
# Use tslm() function to create quadratic (polynomial) trend model.
train.quad <- tslm(train.ts ~ trend + I(trend^2))

# See summary of quadratic trend model and associated parameters.
summary(train.quad)

# Apply forecast() function to make predictions for ts data in
# validation set.  
train.quad.pred <- forecast(train.quad, h = nValid, level = 0)
train.quad.pred

# Use tslm() function to create seasonal model.
train.season <- tslm(train.ts ~ season)

# See summary of seasonal model and associated parameters.
summary(train.season)

# If necessary, run the following code to identify seasons.
train.season$data 

# Apply forecast() function to make predictions for ts with 
# seasonality data in validation set.  
train.season.pred <- forecast(train.season, h = nValid, level = 0)
train.season.pred 

# Use tslm() function to create linear trend and seasonal model.
train.lin.season <- tslm(train.ts ~ trend + season)

# See summary of linear trend and seasonality model and associated parameters.
summary(train.lin.season)

# Apply forecast() function to make predictions for ts with 
# linear trend and seasonality data in validation set.  
train.lin.season.pred <- forecast(train.lin.season, h = nValid, level = 0)
train.lin.season.pred

# Use tslm() function to create linear trend and seasonal model.
train.lin.season <- tslm(train.ts ~ trend + season)

# See summary of linear trend and seasonality model and associated parameters.
summary(train.lin.season)

# Apply forecast() function to make predictions for ts with 
# linear trend and seasonality data in validation set.  
train.lin.season.pred <- forecast(train.lin.season, h = nValid, level = 0)
train.lin.season.pred

# Use tslm() function to create quadratic trend and seasonal model.
train.quad.season <- tslm(train.ts ~ trend + I(trend^2) + season)

# See summary of quadratic trend and seasonality model and associated parameters.
summary(train.quad.season)

# Apply forecast() function to make predictions for ts with 
# trend and seasonality data in validation set.  
train.quad.season.pred <- forecast(train.quad.season, h = nValid, level = 0)
train.quad.season.pred

# Use accuracy() function to identify common accuracy measures
# for various regression models: (1)linear trend, (2) quadratic  
# (polynomial) trend, (3) seasonality, and (4) linear trend and seasonality.
round(accuracy(train.lin.pred$mean, valid.ts),3)
round(accuracy(train.quad.pred$mean, valid.ts),3)
round(accuracy(train.season.pred$mean, valid.ts),3)
round(accuracy(train.lin.season.pred$mean, valid.ts),3)
round(accuracy(train.quad.season.pred$mean, valid.ts),3)

#Q3

revenue.lin.season <- tslm(revenue.ts~trend+season)
summary(revenue.lin.season)
revenue.lin.season.pred <- forecast(revenue.lin.season, h=8, level=0)
revenue.lin.season.pred

revenue.lin.trend <- tslm(revenue.ts~trend)
summary(revenue.lin.trend)
revenue.lin.trend.pred <- forecast(revenue.lin.trend, h=8, level=0)
revenue.lin.trend.pred

revenue.quad.season <- tslm(revenue.ts~trend+I(trend^2)+season)
summary(revenue.quad.season)
revenue.quad.season.pred <- forecast(revenue.lin.trend, h=8, level=0)
revenue.quad.season.pred

# Use accuracy() function to identify common accuracy measures
# for naive model, seasonal naive, and regression model with quadratic trend and seasonality.
round(accuracy(revenue.lin.trend.pred$fitted, revenue.ts),3)
round(accuracy(revenue.lin.season.pred$fitted, revenue.ts),3)
round(accuracy((naive(revenue.ts))$fitted, revenue.ts), 3)
round(accuracy((snaive(revenue.ts))$fitted, revenue.ts), 3)
round(accuracy(revenue.quad.season.pred$fitted, revenue.ts), 3)

