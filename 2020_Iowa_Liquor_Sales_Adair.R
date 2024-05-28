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