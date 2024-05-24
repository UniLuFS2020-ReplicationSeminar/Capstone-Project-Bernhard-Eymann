# clear workspace
rm(list=ls())

# loading libraries for plotting digital legislation data
library(ggplot2)
library(dplyr)

# load the 2 data sets
data1 <- read.csv("data_processed/ds_grosserrat_digital_yearly_begin.csv")
data2 <- read.csv("data_processed/ds_grosserrat_digital_yearly_end.csv")

# Add a column to distinguish the datasets
data1$stage <- "Beginning"
data2$stage <- "End"

# Combine the datasets
combined_data <- rbind(data1, data2)

# plot the data in a bar chart
ggplot(combined_data, aes(x = year, y = count, fill = stage)) +
  geom_bar(stat = "identity", position = "dodge") +
  scale_y_continuous(breaks = seq(0, 10, 1), limits = c(0, 10)) +  # Set the y-axis breaks to integers and limit to a maximum of 10
  labs(title = "Legislation in the Grand Council of Basel-Stadt related to digitalization",
       x = "Year",
       y = "Number of legislation projects related to digitalization",
       fill = "Stage") +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# save the plot
ggsave("plots/ds_grosserrat_digital_yearly.png", width = 10, height = 6, dpi = 300)
