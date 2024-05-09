# clear workspace

rm(list=ls())

# load libraries for API data extraction

library(tidyverse)
library(jsonlite)

# initialize datasets

ds_grosserrat <- data.frame()
ds_umfrage <- data.frame()

# load query urls for the relevant data
# note that i preselected columns via formulation of url query:
# bast7_2 gets results to the question wheter Basel-Stadt should have a pioneering role in digitalization
# titel_ges gets the title of every legislation proposal in the cantonal parliament
# as there is a limit of 100 records per query, i will have to loop through the data
# using the offset parameter in the query

url_ds_grosserrat <- "https://data.bs.ch/api/explore/v2.1/catalog/datasets/100311/records?select=titel_ges&limit=100&offset="
url_ds_umfrage <- "https://data.bs.ch/api/explore/v2.1/catalog/datasets/100083/records?select=bast7_2&limit=100&offset="

# writing the query loop for grosserrat data
# i is set initially to max 196, as the dataset has ca. 19500 entries
# strangely, this gives me an error at offset=10000 (400 bad request)
# when i try this manually, the error persists, i don't find a workaround looking in the documentation
# for the purpose of this exercise, i will limit the query to offset 9900
# and will download the complete dataset separately, as it is available as a csv also

for (i in 1:99) {
  # Code to be executed in each iteration
  query <- paste0(url_ds_grosserrat, i*100)
  # extract data from API
  data <- fromJSON(query)
  # reduce data to dataframe 'results' in each dataset
  data <- data$results
  # append data to existing data
  ds_grosserrat <- rbind(ds_grosserrat, data)
}

# save data to csv
write.csv(ds_grosserrat, "data/ds_grosserrat.csv")

# downloading the complete dataset
url_ds_grosserrat_complete <- "https://data.bs.ch/api/explore/v2.1/catalog/datasets/100311/exports/csv?lang=de&timezone=Europe%2FZurich&use_labels=true&delimiter=%3B"
download.file(url_ds_grosserrat_complete, "data/ds_grosserrat_complete.csv")

# extracting only column titel_ges from the downloaded dataset
ds_grosserrat_complete <- read.csv("data/ds_grosserrat_complete.csv")
ds_grosserrat_complete <- ds_grosserrat_complete$titel_ges

# saving the extracted column to a new csv
write.csv(ds_grosserrat_complete, "data/ds_grosserrat_complete.csv")



