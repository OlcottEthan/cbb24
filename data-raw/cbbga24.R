## code to prepare `cbbga24` dataset goes here

cbbga24 <- read.csv("data-raw/cbbga24.csv", header = TRUE)
usethis::use_data(cbbga24, overwrite = TRUE)
