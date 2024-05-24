# clear workspace
rm(list=ls())

# load libraries for date manipulation and data manipulation
library(lubridate)
library(dplyr)

# load the data
data <- read.csv("data_processed/ds_grosserrat_digital.csv")

# convert the columns "Beginn.Geschäft" and "Ende.Geschäft" to dates
data$Beginn.Geschäft <- as.Date(data$Beginn.Geschäft, format = "%Y-%m-%d")
data$Ende.Geschäft <- as.Date(data$Ende.Geschäft, format = "%Y-%m-%d")

# sort the data by the "Ende.Geschäft" date
data_end_sorted <- data %>% arrange(Ende.Geschäft)

# count how many rows there are each year based on "Ende.Geschäft"
data_end_sorted %>%
  mutate(year = year(Ende.Geschäft)) %>%
  group_by(year) %>%
  summarise(count = n()) %>%
  write.csv("data_processed/ds_grosserrat_digital_yearly_end.csv", row.names = FALSE)

# sort the data by the "Beginn.Geschäft" date
data_begin_sorted <- data %>% arrange(Beginn.Geschäft)

# count how many rows there are each year based on "Beginn.Geschäft"
data_begin_sorted %>%
  mutate(year = year(Beginn.Geschäft)) %>%
  group_by(year) %>%
  summarise(count = n()) %>%
  write.csv("data_processed/ds_grosserrat_digital_yearly_begin.csv", row.names = FALSE)
