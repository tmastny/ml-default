
source("R/packages.R")
source("R/cleaners.R")
source("R/model.R")
source("R/plan.R")

evaled_plan <- evaluate_plan(
  default_plan,
  rules = list(type__ = c("orig", "zscore"),
               method__ = c("rf", "glmnet"))
)

make(evaled_plan)
