
tidy_data <- function(path) {
  d <- readxl::read_xls(path, skip = 1)
  d %>% 
    rename(default = `default payment next month`) %>%
    select(-ID) %>%
    select(default, everything())
}

split_data <- function(data) {
  initial_split(data, prop = 2/3)
}

prep_data <- function(splits) {
  recipe(default ~ ., training(splits)) %>%
    step_num2factor(default, SEX, EDUCATION, MARRIAGE) %>%
    step_dummy(SEX, EDUCATION, MARRIAGE) %>%
    prep(training(splits))
}

prep_zscore <- function(splits) {
  recipe(default ~ ., training(default_splits)) %>%
    step_center(all_predictors(), -SEX, -EDUCATION, -MARRIAGE) %>% 
    step_scale(all_predictors(), -SEX, -EDUCATION, -MARRIAGE) %>% 
    step_num2factor(default, SEX, EDUCATION, MARRIAGE) %>%
    step_dummy(SEX, EDUCATION, MARRIAGE) %>%
    prep(training(default_splits))
}

bake_data <- function(splits, rec) {
  data_list <- list(train = training(splits), test = testing(splits))
  map(data_list, ~bake(rec, .))
}





