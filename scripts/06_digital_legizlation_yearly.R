# clear workspace
rm(list=ls())

# load libraries for date manipulation and data manipulation
library(lubridate)
library(dplyr)

# load the data
data <- read.csv("data_processed/ds_grosserrat_digital.csv")

# convert the column "Ende.Geschäft" to a date
data$Ende.Geschäft <- as.Date(data$Ende.Geschäft, format = "%Y-%m-%d")

# sort the data by date
data <- data %>% arrange(Ende.Geschäft)

# count how many rows there are each year
data %>%
  mutate(year = year(Ende.Geschäft)) %>%
  group_by(year) %>%
  summarise(count = n()) %>%
  write.csv("data_processed/ds_grosserrat_digital_yearly.csv", row.names = FALSE)
