library(tidyverse)
library(tidycensus)

# Table B03002 breaks down the population by Hispanic or Latino origin and race
race_vars <- c(
  total = "B03002_001",
  white = "B03002_003",
  black = "B03002_004",
  asian = "B03002_006",
  hispanic = "B03002_012"
)

# Download 5-year ACS data for census tracts in Sarasota County, Florida
sarasota_race <- get_acs(
  geography = "tract",
  variables = race_vars,
  state = "FL",
  county = "Sarasota",
  year = 2022,
  survey = "acs5"
)

# Save the dataset to the data directory
write_rds(sarasota_race, "data/sarasota_race.rds")
