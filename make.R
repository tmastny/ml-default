source("R/packages.R")
source("R/cleaners.R")
source("R/model.R")
source("R/plan.R")

unlink("leadrboard.RDS")
unlink("models/", recursive = TRUE)

rules = list(
  type__ = c("orig", "zscore"), 
  method__ = c("knn", "glm", "lda", "naive_bayes", "nnet", "rpart")
)

evaled_plan <- evaluate_plan(
  default_plan,
  rules = rules
)

make(evaled_plan)

rmarkdown::render("report.Rmd", 
                  output_file = "report.html",
                  quiet = TRUE)
