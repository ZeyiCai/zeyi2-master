#### Preamble ####
# Purpose: Cleans the raw marriage data into an analysis dataset
# Author: Zeyi Cai
# Date: 19 September 2024
# Contact: zcloris.cai@mail.utoronto.ca
# License: MIT
# Pre-requisites: Need to have downloaded the data
# Any other information needed? None.

#### Workspace setup ####
library(tidyverse)
library(lubridate)

#### Clean data ####
raw_data <- read_csv("raw_data/raw_data.csv")
cleaned_data <-
  raw_data |>
  janitor::clean_names() |> 
  separate(col = dates,
            into = c("year", "month"),
            sep = "-") |> 
  mutate(date = lubridate::ymd(paste(year, month, "01", sep = "-"))
         )
  
#### Save data ####
write_csv(cleaned_data, "analysis_data/analysis_data.csv")

