# Import dependencies

library(tidyverse)
library(dplyr)

# Read CSV file into a dataframe

mechaCar_mpg_data <- read.csv('MechaCar_mpg.csv', check.names = F, stringsAsFactors = F)
head(mechaCar_mpg_data)

# Deliverable 1

# Perform multiple linear regression using all columns
linear_model <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, mechaCar_mpg_data)
summary(linear_model)

# Deliverable 2

# Read in suspension coil data
Suspension_coil_data <- read.csv('Suspension_Coil.csv', check.names = F, stringsAsFactors = F)
head(Suspension_coil_data)
# Create a summary dataframe for all of the data
total_summary <- Suspension_coil_data %>% summarize(mean_PSI = mean(PSI), median_PSI = median(PSI),
                                                    variance_PSI = var(PSI), 
                                                    SD_PSI =sd(PSI) ,.groups = 'keep')
head(total_summary)

# Create summary dataframe by lot number
lot_summary <- Suspension_coil_data %>% group_by(Manufacturing_Lot) %>% summarise(mean_PSI = mean(PSI), median_PSI = median(PSI),
                                                                                    variance_PSI = var(PSI), 
                                                                                    SD_PSI =sd(PSI) ,.groups = 'keep')
head(lot_summary)

# Deliverable 3

# Create a T test to determine if the total of all lots is statistically different from the population mean of 1500 psi

t.test(Suspension_coil_data$PSI,mu=1500)

# Create T tests for each lot compared to population mean of 1500 psi

# Define vector to use in for loop
lots <- unique(Suspension_coil_data$Manufacturing_Lot)

# Loop through the unique lots
for (element in lots) {
  print (element)
  print(t.test(subset(Suspension_coil_data, Manufacturing_Lot == element, select = PSI),mu=1500))
}
 
