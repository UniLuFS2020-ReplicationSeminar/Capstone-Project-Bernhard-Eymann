# clear workspace

rm(list=ls())

# load libraries for counting answers in survey data
library(dplyr)
library(tidyr)

# load data
data <- read.csv("data/ds_umfrage.csv")

# defining possible answers
answers <- c("sehr einverstanden", "eher einverstanden", "weiss nicht", "eher nicht einverstanden", "überhaupt nicht einverstanden")

# count answers
# i had chatgpt help me with an easy way to do this
answer_counts <- data %>%
  count(bast7_2) %>%
  spread(bast7_2, n, fill = 0)

# Subset only relevant answers
answer_counts <- answer_counts[, names(answer_counts) %in% answers]

# save the counts to a csv file
write.csv(answer_counts, "data_processed/umfrage_answer_counts.csv", row.names = FALSE)

