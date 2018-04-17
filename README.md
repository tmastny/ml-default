
<!-- README.md is generated from README.Rmd. Please edit that file -->
Credit Card Defaults
====================

This project is to predict credit card defaults. The following [study](https://github.com/wangzongyan/Default-of-credit-card-clients-Data-Project/blob/master/The%20comparisons%20of%20data%20mining%20techniques%20for%20the%20predictive%20accuracy%20of%20probability%20of%20default%20of%20credit%20card%20clients.pdf) was conducted on the [dataset](https://archive.ics.uci.edu/ml/datasets/default+of+credit+card+clients):

> Yeh, I. C., & Lien, C. H. (2009). The comparisons of data mining techniques for the predictive accuracy of probability of default of credit card clients. Expert Systems with Applications, 36(2), 2473-2480

The study found the following error rates based on a validation set. My goal is to see if we can improve on these results.

<img src="paper-error-rates.png" width="500px" style="display: block; margin: auto;" />

One challenge with this dataset is the low rate of defaults:

``` r
library(tidyverse)
#> Warning: package 'tidyverse' was built under R version 3.4.2
#> ── Attaching packages ───────────────────────────────────────────────── tidyverse 1.2.1 ──
#> ✔ ggplot2 2.2.1.9000     ✔ purrr   0.2.4.9000
#> ✔ tibble  1.4.2          ✔ dplyr   0.7.4     
#> ✔ tidyr   0.8.0          ✔ stringr 1.3.0     
#> ✔ readr   1.1.1          ✔ forcats 0.3.0
#> Warning: package 'dplyr' was built under R version 3.4.2
#> Warning: package 'stringr' was built under R version 3.4.3
#> Warning: package 'forcats' was built under R version 3.4.3
#> ── Conflicts ──────────────────────────────────────────────────── tidyverse_conflicts() ──
#> ✖ dplyr::filter() masks stats::filter()
#> ✖ dplyr::lag()    masks stats::lag()
library(here)
#> here() starts at /Users/Tim/git_tests/ml-default
d <- read_csv(here("data", "defaults.csv"))
#> Parsed with column specification:
#> cols(
#>   .default = col_double(),
#>   SEX = col_integer(),
#>   EDUCATION = col_integer(),
#>   MARRIAGE = col_integer(),
#>   AGE = col_integer(),
#>   PAY_0 = col_integer(),
#>   PAY_2 = col_integer(),
#>   PAY_3 = col_integer(),
#>   PAY_4 = col_integer(),
#>   PAY_5 = col_integer(),
#>   PAY_6 = col_integer(),
#>   default = col_integer()
#> )
#> See spec(...) for full column specifications.
d %>%
  group_by(default) %>%
  summarise(count = n())
#> # A tibble: 2 x 2
#>   default count
#>     <int> <int>
#> 1       0 23364
#> 2       1  6636
```
