#' Gives results for a specified team
#'
#' This will calculate the number of wins, losses, win percentage, number of games at home,
#' total games played and percentage of games played at home.
#'
#' @param team This is the desired team to generate statistics for.
#' 
#' @return This function returns a list containing the number of wins, losses,
#' win percentage, home games, total games played and percentage of games at home
#' for the specified team.
#'
#' @examples
#' ## Give win and home game statistics for 'Southern Utah'
#' Results_team('Southern Utah')
#' 
#' @import
#'   tidyverse
#'   magrittr
#'
#' @export

team_results <- function(team) {
  
  results <- team_filter(team) |>
    mutate(home = ifelse(Away == team,FALSE,TRUE),
           result = case_when(score_diff > 0 & (Away == team) ~ 'win',
                              score_diff < 0 & (Home == team) ~ 'win',
                              score_diff == 0 ~ 'tie',
                              TRUE ~ 'loss'),
           home_game = ifelse(Home == team,TRUE,FALSE)) |>
    summarize(win = sum(result == 'win'),
              loss = sum(result == 'loss'),
              home_games = sum(home_game),
              total_games = length(home)) |>
    mutate(team = team,
           home_percentage = home_games/total_games,
           win_percentage = win/total_games) |>
    select(team,win,loss,win_percentage,home_games,total_games,home_percentage)
  
  return(results)
}
