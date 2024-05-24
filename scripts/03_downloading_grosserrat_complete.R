# clear workspace

rm(list=ls())

# load libraries for API data extraction

library(tidyverse)
library(jsonlite)

# downloading the complete dataset
url_ds_grosserrat_complete <- "https://data.bs.ch/api/explore/v2.1/catalog/datasets/100311/exports/csv?lang=de&timezone=Europe%2FZurich&use_labels=true&delimiter=%3B"
download.file(url_ds_grosserrat_complete, "data/ds_grosserrat_complete_all.csv")

# extracting columns "Ende Geschäft" (end of project) "Titel Geschäft" (title of project) from the downloaded dataset
ds_grosserrat_complete <- read.csv("data/ds_grosserrat_complete_all.csv", fileEncoding = "UTF-8", sep=";")
ds_grosserrat_complete <- ds_grosserrat_complete[, c("Ende.Geschäft", "Titel.Geschäft")]

# saving the extracted columns to a new csv
write.csv(ds_grosserrat_complete, "data/ds_grosserrat_complete.csv")
