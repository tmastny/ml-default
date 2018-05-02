source("R/packages.R")
source("R/cleaners.R")
source("R/model.R")
source("R/plan.R")

unlink("leadrboard.RDS")
unlink("models/", recursive = TRUE)

rules = list(
  type__ = c("orig", "zscore"), 
  method__ = c("knn", "glm", "lda", "naive_bayes", "nnet", "rpart",
               "ranger", "gbm", "xgbTree", "C5.0")
)

evaled_plan <- evaluate_plan(
  default_plan,
  rules = rules
)

make(evaled_plan)

callr::r(function() {
  rmarkdown::render("report.Rmd", 
                  output_dir = here::here("reports"),
                  output_format = "all",
                  quiet = TRUE)
})



