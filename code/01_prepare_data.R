# Load raw data
data <- read.csv("data/nhamcs_data_2018_22.csv")

# Combine "Blank" EMS arrival responses with "Unknown"
data$ems_arrival[data$ems_arrival == "Blank"] <- "Unknown"

# Save prepared data
saveRDS(data, "output/analysis_data.rds")