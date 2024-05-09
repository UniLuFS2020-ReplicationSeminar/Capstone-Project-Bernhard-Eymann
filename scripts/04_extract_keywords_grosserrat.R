# clear workspace
rm(list=ls())

# loading libraries for extracting rows, that contain keywords in column 'titel_ges'
library(tidyverse)
library(stringr)

# load data (the complete dataset of grosserrat data)
ds_grosserrat <- read.csv("data/ds_grosserrat_complete.csv")

# define key fragments of words related to digitalization
key_fragments <- c("digital", "elektronisch")

# extract rows that contain key fragments in column 'Titel.Geschäft'
ds_grosserrat_digital <- ds_grosserrat %>%
  filter(str_detect(Titel.Geschäft, key_fragments[1]) | str_detect(Titel.Geschäft, key_fragments[2]))

# save data to csv
write.csv(ds_grosserrat_digital, "data_processed/ds_grosserrat_digital.csv")
