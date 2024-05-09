# clear workspace
rm(list=ls())

# load libraries for API data extraction
library(tidyverse)
library(httr)
library(jsonlite)

# load query urls
url_ds_grosserrat <- "https://data.bs.ch/api/explore/v2.1/catalog/datasets/100311/records?limit=20"
url_ds_umfrage <- "https://data.bs.ch/api/explore/v2.1/catalog/datasets/100083/records?limit=20"

# extract data from API
ds_grosserrat <- fromJSON(url_ds_grosserrat)
ds_umfrage <- fromJSON(url_ds_umfrage)

# save data to csv
write.csv(ds_grosserrat, "data/ds_grosserrat.csv")
write.csv(ds_umfrage, "data/ds_umfrage.csv")

