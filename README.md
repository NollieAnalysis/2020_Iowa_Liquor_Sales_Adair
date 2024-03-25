# 2020_Iowa_Liquor_Sales_Adair

# Project objectives:

Use Google's BigQuery and R to analyze Adair, Iowa's liquor sales in 2020.

# Adair, Iowa background:

![Adair_Iowa_City_Info_and_Map](https://github.com/NollieAnalysis/2020_Iowa_Liquor_Sales_Adair/assets/163913188/ed209830-2089-4ef3-8f31-36afdc6e2d21)

# SQL functions and operations used:

`CAST()` Function:

Used to explicitly convert data types. In this query, it's used to convert zip_code from string to numeric and sale_dollars from a numeric type to FLOAT64.

`ROUND()` Function:

Used to round numeric values to a specified number of decimal places.

`DESC` Keyword:

Used to sort the result set in descending order based on the date column.

# R libraries used:

`ggplot2`: Used for creating plots and visualizations.

`forecast`: Used for time series forecasting.

`stats`: A base R package containing statistical functions, including `acf()` and `pacf()` for autocorrelation analysis.

# R functions used:

Base R Functions:

`getwd()`: Retrieves the current working directory.

`setwd()`: Sets the working directory.

`read.csv()`: Reads a CSV file into a data frame.

`summary()`: Computes summary statistics for numeric vectors.

`range()`: Computes the range of values in a vector.

`plot()`: Creates various types of plots.

`ts()`: Creates a time series object.

`acf()`: Computes the autocorrelation function.

`pacf()`: Computes the partial autocorrelation function.

ggplot2 Functions:

`ggplot()`: Initializes a ggplot object.

`geom_boxplot()`: Adds a boxplot layer to the plot.

`geom_line()`: Adds a line layer to the plot.

`labs()`: Sets titles for the plot axes and legend.

`scale_y_continuous()`: Adjusts the scale of the y-axis.

Forecast Package Functions:

`forecast()`: Generates forecasts for time series data.

These functions are used for various purposes, including data import, data visualization, summary statistics computation, time series creation, time series forecasting, and autocorrelation analysis.

# Project deliverables:

# SQL

Data comes from `bigquery-public-data.iowa_liquor_sales_forecasting.2020_sales_train`

BigQuery_2020_Iowa_Liquor_Sales_Public_Data_Schema

![BigQuery_2020_Iowa_Liquor_Sales_Public_Data](https://github.com/NollieAnalysis/2020_Iowa_Liquor_Sales_Adair/assets/163913188/8e97162b-00cb-451e-b052-17b801d951aa)

BigQuery_2020_Iowa_Liquor_Sales_Public_Data_Preview

![BigQuery_2020_Iowa_Liquor_Sales_Public_Data_Preview](https://github.com/NollieAnalysis/2020_Iowa_Liquor_Sales_Adair/assets/163913188/4dc01c8a-8212-4399-8f0d-c3195ff0c145)

Query to filter for Adair, Iowa. Save query as a csv file.

```SQL
SELECT
date, store_name, city, county,
CAST(zip_code AS numeric) AS zip_code_2,
CAST(ROUND(sale_dollars,2) AS FLOAT64) AS sale_dollars_2,

FROM
`bigquery-public-data.iowa_liquor_sales_forecasting.2020_sales_train`

WHERE
city = "Adair"

ORDER BY
date DESC
```

![BigQuery_2020_Adair_Iowa_Liquor_Sales_Data](https://github.com/NollieAnalysis/2020_Iowa_Liquor_Sales_Adair/assets/163913188/359ab550-87d6-4921-9dba-57fcca6f7a83)

# R

```R
# Check working directory
getwd()

# Set your working directory for uploading CSV (if applicable)
setwd() # add file path here

# Install applicable packages
install.packages()  # add package names here

#Upload data into a dataframe
adair_2020_liquor_sales <- read.csv("2020_Iowa_Liquor_Sales_Adair.csv")

#Summary statistics for sales
summary(adair_2020_liquor_sales$sale_dollars_2)

#Date range of data
range(adair_2020_liquor_sales$date)

#Box and whisker plot
ggplot(adair_2020_liquor_sales, aes(x = city, y = sale_dollars_2)) + 
  geom_boxplot() + 
    labs(title = "Box and Whisker Plot of Sales Data", x = "Adair", y = "Sales") +
  
  #Adjust y-axis breaks and labels
  scale_y_continuous(breaks = seq(0, max(adair_2020_liquor_sales$sale_dollars_2), by = 200), labels = seq(0, max(adair_2020_liquor_sales$sale_dollars_2), by = 200))


#Plot showing sales over time
ggplot(adair_2020_liquor_sales, aes(x = date, y = sale_dollars_2)) +
  geom_line() +
    labs(title = "Sales Over Time in Adair", x = "Date", y = "Sales") + 
  
  #Adjust y-axis breaks and labels
  scale_y_continuous(breaks = seq(0, max(adair_2020_liquor_sales$sale_dollars_2), by = 200), labels = seq(0, max(adair_2020_liquor_sales$sale_dollars_2), by = 200)) 
  

#Create time series (TS) of sales data
sales_times_series <- ts(adair_2020_liquor_sales$sale_dollars_2, frequency = 365, start = c(2020, 1))

#Plot TS
plot(sales_times_series)

#Forecast TS for next 30 days
sales_forecast <- forecast(sales_times_series, h = 30, fan = TRUE)
sales_forecast

#Forecast method
sales_forecast$method

#Plot Forecast
plot(sales_forecast)

#Check data for stochasticity
acf(sales_times_series) #autocorrelation plot
pacf(sales_times_series) #partial autocorrelation plot
```

Adair_2020_Liquor_Sales_Table

![Adair_2020_Liquor_Sales_Table](https://github.com/NollieAnalysis/2020_Iowa_Liquor_Sales_Adair/assets/163913188/1aff470c-fbe5-4fe0-92de-fb6c937047e4)

Box_and_Whisker_Plot_of_Sales_Data

![Box_and_Whisker_Plot_of_Sales_Data](https://github.com/NollieAnalysis/2020_Iowa_Liquor_Sales_Adair/assets/163913188/6855691d-c217-4dea-8f33-a10ecb5295a0)

Sales_Over_Time_in_Adair

![Sales_Over_Time_in_Adair](https://github.com/NollieAnalysis/2020_Iowa_Liquor_Sales_Adair/assets/163913188/6ad2ae34-d17a-4e7e-848c-92b04bcc5342)

sales_times_series

![sales_times_series](https://github.com/NollieAnalysis/2020_Iowa_Liquor_Sales_Adair/assets/163913188/02fb4048-3862-42f7-8660-d9e5e8ee318a)

Forecasts_from_ETS_(A,N,N)

![Forecasts_from_ETS_(A,N,N)](https://github.com/NollieAnalysis/2020_Iowa_Liquor_Sales_Adair/assets/163913188/be74ff3c-aa58-47e9-bd8c-a06ef588f751)

ACF_Plot

![ACF_Plot](https://github.com/NollieAnalysis/2020_Iowa_Liquor_Sales_Adair/assets/163913188/a721dfc5-02f8-4788-8801-51900d31fb04)

Partial_ACF_Plot

![Partial_ACF_Plot](https://github.com/NollieAnalysis/2020_Iowa_Liquor_Sales_Adair/assets/163913188/ee62d548-d4be-4db5-977d-865d33b53286)
