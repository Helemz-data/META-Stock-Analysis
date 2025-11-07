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
