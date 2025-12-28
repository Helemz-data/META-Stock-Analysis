📊 META Stock Analysis Project
🧠 Overview

This project presents a comprehensive analysis of META (Facebook) stock performance using R. It examines historical price behavior to understand trends, volatility, and potential trading opportunities through quantitative methods and data visualization. The project also applies statistical and time-series models to forecast future price movements.

The primary objective is to evaluate how META’s stock price evolves over time, measure its risk profile, and assess the effectiveness of technical indicators and forecasting models in supporting investment decisions.

📁 Project Structure

📦 META-Stock-Analysis

Data collection and preprocessing

Exploratory data analysis

Visualization and statistical modeling

Forecasting and strategy evaluation

🧩 Analysis Performed
1️⃣ Trend Analysis

Visualizes closing prices over time

Applies LOESS smoothing to highlight overall price direction

Uses a 30-day moving average to capture long-term trends

Insight:
This analysis helps identify whether META’s stock price is trending upward, downward, or stabilizing, providing a clear view of long-term market behavior.

2️⃣ Volatility Analysis

Calculates daily returns to measure price fluctuations

Plots a histogram of returns to assess volatility distribution

Computes standard deviation of returns as a risk metric

Insight:
Periods of high volatility indicate increased market risk and potential reward. This section highlights how META’s risk profile changes over time, often in response to major market or technology-sector events.

3️⃣ Moving Average Crossover Strategy

Compares short-term (20-day) and long-term (50-day) moving averages

Identifies crossover points as potential buy and sell signals

Insight:
This classic technical trading strategy helps detect momentum shifts and supports decision-making for entry and exit points based on trend strength.

4️⃣ Regression & Forecasting

Linear Regression: Models short-term price trends using time as a predictor

ARIMA Model: Captures short-term dependencies and seasonality in stock prices

ARFIMA Model: Accounts for long-term memory effects and persistent market patterns

Insight:
While regression and ARIMA provide reasonable short-term forecasts, ARFIMA offers deeper insight into long-term price dependencies, making it more suitable for extended market analysis.

📈 Key Findings

META’s stock exhibits clear long-term trends influenced by broader market cycles

Volatility spikes align with major economic and technology-sector events

Time-series models enhance forecasting accuracy, with ARFIMA effectively capturing long-term behavior
