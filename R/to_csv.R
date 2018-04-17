# ---- csver ----
library(here)
library(tidyverse)
  
d <- readxl::read_xls(here("data", "default of credit card clients.xls"), skip = 1)
d %>% 
  rename(default = `default payment next month`) %>%
  write_csv(here("data", "defaults.csv"))