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

save_results <- function(model, dir, test) {
  board(model, dir = dir)
  t <- table(test$default, predict(model, test))
  b <- board()
  b[b$id == at_last(), "public"] <- sum(diag(t))/sum(t)
  saveRDS(b, "leadrboard.RDS")
}
