#' Gives a quick barplot of number of wins for a specified team
#'
#' This will return a barplot of the number of wins vs traveling status for the team specified.
#'
#' @param team This is the desired team to generate plot for.
#' 
#' @return This function returns a split barplot based on the team with the number of games played,
#' split whether those wins were at a home event or away.
#'
#' @examples
#' ## Give a barplot of number of wins with split on traveling or home games for Utah
#' barplot_win_vs_homestatus('Utah')
#' 
#' @import
#' ggplot2
#'
#' @export

barplot_win_vs_homestatus <- function(team){
  team_filter(team) |>
    filter((Away == team & score_diff>0) | (Home == team & score_diff<0)) |>
    mutate(win_type = case_when(score_diff > 0 ~ 'Away',
                                score_diff < 0 ~ 'Home',
                                TRUE ~ 'tie')) |>
    ggplot(aes(x = win_type, )) +
    geom_bar(fill = c('red','blue')) + 
    labs(x = 'Traveling status', y = 'Count',
         title = 'Number of Wins by Traveling Status')
}
