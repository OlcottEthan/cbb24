#' Gives a quick boxplot of win margin for a specific team.
#'
#' This will return a barplot of the number of wins vs traveling status.
#'
#' @param team This is the desired team to generate plot for.
#' 
#' @return This function returns a split boxplot with the margin of a win,
#' split whether those wins were at a home event or away.
#'
#' @examples
#' ## Give a boxplot of win margin with split on traveling or home games for BYU
#' boxplot_winmargin_vs_homestatus('BYU')
#' 
#' @import
#' tidyverse
#' ggplot2
#'
#' @export

boxplot_winmargin_vs_homestatus <- function(){
  team_filter(team) |>
    filter((Away == team & score_diff > 0) | (Home == team & score_diff < 0)) |>
    mutate(win_type = case_when(score_diff > 0 ~ 'Away',
                                score_diff < 0 ~ 'Home',
                                TRUE ~ 'Tie')) |>
    ggplot(aes(x = win_type, y = abs(score_diff))) +
    geom_boxplot(fill = c('red','blue')) +
    labs(x = "Traveling status", y = "Win Margin",
         title = 'Distribution of Win Margin by Traveling Status')
}
