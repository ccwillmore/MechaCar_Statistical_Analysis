library(tidyverse)
library(dplyr)
mechaCar_mpg_data <- read.csv('MechaCar_mpg.csv', check.names = F, stringsAsFactors = F)
head(mechaCar_mpg_data)
# Perform multiple linear regression using all columns
linear_model <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, mechaCar_mpg_data)
summary(linear_model)
