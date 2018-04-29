default_plan <- drake_plan(
  data = tidy_data(file_in("data/default of credit card clients.xls"))[1:500,],
  splits = split_data(data),
  prepped = prep_data(splits, "type__"),
  baked_data = bake_data(splits, prepped_type__),
  model = run(def_model, default ~ ., baked_data_type__$train, 
              list(model = "method__")),
  save_results(model_type___method__, "type__", baked_data_type__$test, "default")
)

default_plan$trigger <- c(rep("any", 5), "always")