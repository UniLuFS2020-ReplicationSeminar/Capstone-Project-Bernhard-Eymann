# clear workspace

rm(list=ls())

# load libraries for API data extraction

library(tidyverse)
library(jsonlite)

# initialize dataset

ds_umfrage <- data.frame()

# load query urls for the relevant data
# note that i preselected columns via formulation of url query:
# bast7_2 gets results to the question whether Basel-Stadt should have a pioneering role in digitalization
# as there is a limit of 100 records per query, i will have to loop through the data
# using the offset parameter in the query

url_ds_umfrage <- "https://data.bs.ch/api/explore/v2.1/catalog/datasets/100083/records?select=bast7_2&limit=100&offset="

# writing the query loop for umfrage (=survey) data
# i is set initially to max 10, as the dataset has 1000 entries

for (i in 1:10) {
  # Code to be executed in each iteration
  query <- paste0(url_ds_umfrage, i*100)
  # extract data from API
  data <- fromJSON(query)
  # reduce data to dataframe 'results' in each dataset
  data <- data$results
  # append data to existing data
  ds_umfrage <- rbind(ds_umfrage, data)
}

# save data to csv
write.csv(ds_umfrage, "data/ds_umfrage.csv")