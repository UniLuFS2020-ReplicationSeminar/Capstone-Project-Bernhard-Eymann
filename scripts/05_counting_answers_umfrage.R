# clear workspace

rm(list=ls())

# load libraries for counting answers in survey data
library(tidyverse)

# load data
data <- read.csv("data/ds_umfrage.csv")

# Defining possible answers (ranging from "sehr einverstanden" - agreeing very much - to "überhaupt nicht einverstanden" - not agreeing at all)
answers <- c("sehr einverstanden", "eher einverstanden", "weiss nicht", "eher nicht einverstanden", "überhaupt nicht einverstanden")

# Ensure the answers column is a factor with the specified levels
data$bast7_2 <- factor(data$bast7_2, levels = answers)

# Count answers in a long format
answer_counts <- data %>%
  filter(bast7_2 %in% answers) %>%  # Ensure only relevant answers are counted
  count(bast7_2) %>%
  rename(answer = bast7_2, count = n)

# Save the counts to a csv file
write.csv(answer_counts, "data_processed/umfrage_answer_counts.csv", row.names = FALSE)