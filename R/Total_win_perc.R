#' Gives quick team summary statistics
#'
#' This will calculate the win percentage, percentage of games played at home, and
#' the number of games each team played for the data set cbbga24
#'
#' 
#' @return This function returns a tibble containing each team, their win percentage,
#' home game percentage, and number of games played.
#'
#' @examples
#' ## Give quick team summary statistics
#' Total_win_perc
#' 
#' @import
#'   tidyverse
#'   magrittr
#'
#' @export

Total_win_perc <- function(){
  
  teams <- unique(union(cbbga24$Away, cbbga24$Home))
  n <- length(teams)
  
  win_perc <- numeric(n)
  home_perc <- numeric(n)
  num_games <- numeric(n)
  
  for (i in 1:n) {
    results <- Results_team(teams[i])
    win_perc[i] <- results$win_perc
    home_perc[i] <- results$home_perc
    num_games[i] <- sum(cbbga24$Away == teams[i]) + sum(cbbga24$home == teams[i])
  }
  
  teams_win_perc <- tibble(team = teams,
                           win_percentage = win_perc, 
                           home_percentage = home_perc,
                           num_games = num_games) |>
    arrange(desc(win_percentage))
  
  return(teams_win_perc)
}