# ---- cleaner1
library(here)
library(tidyverse)
library(recipes)

d <- read_csv(here("data", "defaults.csv"))
d <- d %>%
  select(-ID) %>%
  select(default, everything())
# ---- cleaner2
library(rsample)
default_splits <- initial_split(d, prop = 2/3)

# ---- cleaner3
default_rec <- recipe(default ~ ., training(default_splits)) %>%
  step_num2factor(SEX, EDUCATION, MARRIAGE) %>%
  step_dummy(SEX, EDUCATION, MARRIAGE) %>%
  prep(training(default_splits))

# ---- cleaner4
default_std_rec <- recipe(default ~ ., training(default_splits)) %>%
  step_center(all_predictors(), -SEX, -EDUCATION, -MARRIAGE) %>% 
  step_scale(all_predictors(), -SEX, -EDUCATION, -MARRIAGE) %>% 
  step_num2factor(SEX, EDUCATION, MARRIAGE) %>%
  step_dummy(SEX, EDUCATION, MARRIAGE) %>%
  prep(training(default_splits))

# ---- cleaner5
bake(default_rec, training(default_splits)) %>%
  write_csv(here("data", "train.csv"))

bake(default_rec, testing(default_splits)) %>%
  write_csv(here("data", "test.csv"))

bake(default_std_rec, training(default_splits)) %>%
  write_csv(here("data", "s-train.csv"))

bake(default_std_rec, testing(default_splits)) %>%
  write_csv(here("data", "s-test.csv"))





  