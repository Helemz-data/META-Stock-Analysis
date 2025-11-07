# Install (if needed)
install.packages(c("forecast", "ggplot2", "tseries"))

# Load them
library(forecast)
library(ggplot2)
library(tseries)

# Read CSV file
meta <- read.csv("META stocks.csv")

# Convert Date column to proper date type
meta$Date <- as.Date(meta$Date)

# Sort by Date (important for time series)
meta <- meta[order(meta$Date), ]

# Check structure
str(meta)

# Plot to inspect
ggplot(meta, aes(x = Date, y = Close)) +
  geom_line(color = "steelblue", size = 1) +
  labs(title = "META Stock Closing Prices",
       x = "Date", y = "Close (USD)") +
  theme_minimal()


# Convert to a time series (frequency = 365 for daily data)
meta_ts <- ts(meta$Close, frequency = 365, start = c(as.numeric(format(min(meta$Date), "%Y"))))

# Inspect
plot(meta_ts, main = "META Stock Price Time Series", ylab = "Closing Price (USD)", xlab = "Time")


adf_test <- adf.test(meta_ts)
adf_test


fit <- auto.arima(meta_ts)

# View model summary
summary(fit)


forecast_meta <- forecast(fit, h = 30)

# View forecast values
print(forecast_meta)


autoplot(forecast_meta) +
  labs(title = "META Stock Price Forecast (ARIMA)",
       x = "Time",
       y = "Closing Price (USD)") +
  theme_minimal()


accuracy(fit)
