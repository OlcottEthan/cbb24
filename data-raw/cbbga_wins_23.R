## code to prepare `cbbga_wins_23` dataset goes here

cbbga_wins_23 <- read.csv("data-raw/cbbga_wins_23.csv", header = TRUE)
usethis::use_data(cbbga_wins_23, overwrite = TRUE)
