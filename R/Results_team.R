#' Gives specific results for a specified team
#'
#' This will calculate the win percentage and percentage of games the specified
#' team played at home with the data set cbbga24
#'
#' @param team This is the desired team to get win and home game percentages
#' 
#' @return This function returns a list containing the team results and home
#' game percentage.
#'
#' @examples
#' ## Give win and home game percentages for 'Southern Utah'
#' Results_team('Southern Utah')
#' 
#' @import
#'   tidyverse
#'   magrittr
#'
#' @export

Results_team <- function(team) {
  
  team_results <- team_filter(team) |>
    mutate(result = case_when(score_diff > 0 & (Away == team) ~ 'win',
                              score_diff < 0 & (Home == team) ~ 'win',
                              score_diff == 0 ~ 'tie',
                              TRUE ~ 'loss'),
           home_game = ifelse(Home == team,TRUE,FALSE)) |>
    select(result,home_game)
  
win_perc <- summarize(team_results, win_percent = mean(result == 'win'))
home_perc <- summarize(team_results, home_percent = mean(home_game))
  
return(list(win_perc = pull(win_perc), home_perc = pull(home_perc)))
}