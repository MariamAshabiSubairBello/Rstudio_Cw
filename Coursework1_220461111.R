#' ---
#' title: UKDriverDeaths
#' author: Mariam Ashabi Subair Bello
#' date: 13/03/2025
#' ---

#1.1
install.packages("prophet") # installing packages into R to be able to carry out the following tasks.
library(prophet)# loading packages into R session.
install.packages("remotes") # installing packages into R to be able to carry out the following tasks.
remotes::install_github('facebook/prophet@*release',subdir = 'R')

install.packages("zoo") # installing packages into R to be able to carry out the following tasks.
library(zoo)# loading packages into R session.


data("UKDriverDeaths")#loading data into R so it can read it for future references.
?UKDriverDeaths # enquiring about data information.

deaths.dataframe = data.frame(
    ds = zoo::as.yearmon(time(UKDriverDeaths)),
    y = UKDriverDeaths
) # creating a dataframe of data with two columns named ds and y, ds used for time and y for number of deaths or injuries.

fitted_model = prophet::prophet(deaths.dataframe) #fitting the dataframe using prophet function.
future_deaths_dataframe = make_future_dataframe(fitted_model,periods = 8,freq = "quarter") # making future dataframe for 8 periods and every quarter using the dataframe we created previously.
predict_future_deaths = predict(fitted_model,future_deaths_dataframe) # predicting the deaths using the predicted dataframe and actual dataframe.
plot(fitted_model,predict_future_deaths) #plotting dataframe with predicted dataframe to see a trend.

prophet_plot_components(fitted_model,predict_future_deaths) # further plots to see the trend and seasonality of data

ds = as.numeric(time(UKDriverDeaths))
y = as.numeric(UKDriverDeaths)

lm_model<- lm(ds~y, data = UKDriverDeaths)
summary(lm_model)

install.packages("astsa")# installing packages into R to be able to carry out the following tasks.
library(astsa)# loading packages into R session.

model23 <-stats::decompose(UKDriverDeaths) #decomposing our time series
plot(model23)#plotting the decomposed time series to see additional information about the data
