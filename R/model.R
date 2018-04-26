def_model <- function(formula, data, method = "cv", num = 5,
                    index = NULL, seeds = NA, model,
                    tune = NULL) {
  control <- trainControl(method = method, number = num,
                          savePredictions = 'final', index = index)
  train(
    formula,
    data = data,
    method = model,
    trControl = control,
    tuneGrid = tune
  )
}

