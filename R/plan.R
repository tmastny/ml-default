default_plan <- drake_plan(
  data = tidy_data(file_in("data/default of credit card clients.xls")),
  splits = split_data(data),
  prepped = prep_data(splits),
  prepped_zscore = prep_data(splits),
  baked_data = bake_data(splits, prepped),
  baked_zscore = bake_data(splits, prepped),
  model = run(def_model, default ~ ., baked_data$train, list(model = "rf")),
  model_zscore = run(def_model, default ~ ., baked_zscore$train, list(model = "rf")),
  save_results(model, "orig", baked_data$test, "default"),
  save_results(model_zscore, "zscore", baked_data$test, "default")
)

