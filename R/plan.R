default_plan <- drake_plan(
  data = tidy_data(file_in("data/default of credit card clients.xls"))[1:500,],
  splits = split_data(data),
  prepped = prep_data(splits, "type__"),
  baked = bake_data(splits, prepped_type__),
  model = run(def_model, default ~ ., baked_type__$train, 
              list(model = "method__")),
  save_results(model_type___method__, "type__", baked_type__$test)
)

