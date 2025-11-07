library(ggplot2)

library(dplyr)

meta <- read.csv("META stocks.csv")

meta$Date <- as.Date(meta$Date)

ggplot(meta, aes(x = Date, y = Close)) +
  geom_line(color = "steelblue") +
  geom_smooth(method = "loess", span = 0.2, color = "red", se = FALSE) +
  labs(title = "META Stock Closing Price Over Time",
       y = "Closing Price (USD)",
       x = "Date")
meta <- meta %>%
  arrange(Date) %>%
  mutate(Return = (Close - lag(Close)) / lag(Close))

sd(meta$Return, na.rm = TRUE)
ggplot(meta, aes(x = Return)) +
  geom_histogram(bins = 50, fill = "skyblue", color = "white") +
  labs(title = "Distribution of Daily Returns",
       x = "Daily Return", y = "Frequency")

library(TTR)

meta$SMA20 <- SMA(meta$Close, n = 20)
meta$SMA50 <- SMA(meta$Close, n = 50)

ggplot(meta, aes(x = Date)) +
  geom_line(aes(y = Close, color = "Closing Price")) +
  geom_line(aes(y = SMA20, color = "20-day MA")) +
  geom_line(aes(y = SMA50, color = "50-day MA")) +
  labs(title = "META Stock Price with Moving Averages",
       y = "Price (USD)", x = "Date", color = "Legend")


# Load necessary libraries
install.packages(c("ggplot2", "dplyr"))
library(ggplot2)
library(dplyr)

# Read the dataset (ensure META stocks.csv is in your working directory)
meta <- read.csv("META stocks.csv")

# Check the structure of the dataset
str(meta)

# Convert Date to proper date format if it's not already
meta$Date <- as.Date(meta$Date)

# Create a numeric version of Date for regression
meta$Date_num <- as.numeric(meta$Date)

# Remove any missing values
meta <- na.omit(meta)


# Fit the regression model: Close price ~ Date
model <- lm(Close ~ Date_num, data = meta)

# View summary of the model
summary(model)

# Predict for the next 30 days
future_days <- data.frame(Date = seq(max(meta$Date), by = "day", length.out = 30))
future_days$Date_num <- as.numeric(future_days$Date)

# Generate predictions
future_days$Predicted_Close <- predict(model, newdata = future_days)

ggplot(meta, aes(x = Date, y = Close)) +
  geom_line(color = "blue", size = 1) +
  geom_line(data = future_days, aes(x = Date, y = Predicted_Close),
            color = "red", size = 1, linetype = "dashed") +
  labs(title = "META Stock Price Forecast (Linear Regression)",
       subtitle = "Blue = Actual | Red dashed = Forecast",
       x = "Date",
       y = "Closing Price (USD)") +
  theme_minimal()

# Get model metrics
cat("R-squared:", summary(model)$r.squared, "\n")
cat("Adjusted R-squared:", summary(model)$adj.r.squared, "\n")

# Optional: visualize residuals
ggplot(data.frame(Residuals = resid(model)), aes(x = Residuals)) +
  geom_histogram(bins = 20, fill = "steelblue", color = "white") +
  labs(title = "Distribution of Model Residuals") +
  theme_minimal()

