# clear workspace
rm(list=ls())

# loading libraries for plotting public survey on cantonal legislation data
library(ggplot2)
library(dplyr)

# load the data
data <- read.csv("data_processed/umfrage_answer_counts.csv")

# plot the data in a pie chart
ggplot(data, aes(x = "", y = count, fill = answer)) +
  geom_bar(stat = "identity") +
  coord_polar("y") +
  labs(title = '2020 survey in the canton Basel-Stadt: "Do you want to be the canton a pioneering canton in digitalization?"',
       x = "",
       y = "") +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# save the plot
ggsave("plots/umfrage_answer_counts.png", width = 10, height = 6, dpi = 300)