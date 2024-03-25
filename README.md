# 2020_Iowa_Liquor_Sales_Adair

# Project objectives:

Use Google's BigQuery and R to analyze Adair, Iowa's liquor sales in 2020.

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






