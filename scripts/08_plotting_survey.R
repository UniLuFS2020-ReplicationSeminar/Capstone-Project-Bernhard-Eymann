# clear workspace
rm(list=ls())

# loading libraries for plotting public survey on cantonal legislation data
library(ggplot2)
library(dplyr)
library(scales)
library(RColorBrewer)

# load the data
data <- read.csv("data_processed/umfrage_answer_counts.csv")

str(data)

# Defining possible answers in the desired order
answers <- c("sehr einverstanden", "eher einverstanden", "weiss nicht", "eher nicht einverstanden", "überhaupt nicht einverstanden")
english_labels <- c("Strongly Agree", "Agree", "Don't Know", "Disagree", "Strongly Disagree")

# Ensure the answers column is a factor with the specified levels
data$answer <- factor(data$answer, levels = answers)

# Calculate the percentage of each answer
data <- data %>%
  mutate(percentage = count / sum(count) * 100)

# plot the data in a pie chart
ggplot(data, aes(x = "", y = count, fill = answer)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y") +
  labs(title = '2020 survey in the canton Basel-Stadt:\n"Do you want Basel-Stadt to be a pioneering canton in digitalization?"',
       x = "",
       y = "") +
  scale_fill_manual(values = brewer.pal(length(answers), "Set3"), 
                    labels = english_labels, 
                    name = "Answer") +  # Use manual fill scale with English labels
  theme_void() +  # Use a void theme for a cleaner look
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold"),
    legend.position = "right",
    plot.background = element_rect(fill = "white", color = NA),  # Set the background to white
    panel.background = element_rect(fill = "white", color = NA)  # Set the panel background to white
  ) +
  geom_text(aes(label = paste0(round(percentage, 1), "%")), 
            position = position_stack(vjust = 0.5), size = 5, color = "black")  # Set percentage text to black

# save the plot
ggsave("plots/umfrage_answer_counts.png", width = 10, height = 6, dpi = 300)