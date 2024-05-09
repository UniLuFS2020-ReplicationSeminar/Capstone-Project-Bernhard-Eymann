# clear workspace
rm(list=ls())

# loading libraries for plotting digital legislation data
library(ggplot2)
library(dplyr)

# load the data
data <- read.csv("data_processed/ds_grosserrat_digital_yearly.csv")

# plot the data in a bar chart
ggplot(data, aes(x = year, y = count)) +
  geom_bar(stat = "identity") +
  labs(title = "Digital legislation in the Grand Council of Basel-Stadt",
       x = "Year",
       y = "Number of digital legislation projects ended") +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# save the plot
ggsave("plots/ds_grosserrat_digital_yearly.png", width = 10, height = 6, dpi = 300)