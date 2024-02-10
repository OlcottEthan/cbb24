#' Gives a quick boxplot of win margin.
#'
#' This will return a barplot of the number of wins vs traveling status.
#'
#' 
#' @return This function returns a split boxplot with the margin of a win,
#' split whether those wins were at a home event or away.
#'
#' @examples
#' ## Give a boxplot of win margin with split on traveling or home games
#' boxplot_winmargin_vs_homestatus()
#' 
#' @import
#'   ggplot2
#'
#' @export

boxplot_winmargin_vs_homestatus <- function(){
  cbbga24 |>
    mutate(win_type = case_when(score_diff > 0 ~ 'Away',
                                score_diff < 0 ~ 'Home',
                                TRUE ~ 'Tie')) |>
    ggplot(aes(x = win_type, y = abs(score_diff))) +
    geom_boxplot(fill = c('red','blue')) +
    labs(x = "Traveling status", y = "Win Margin",
         title = 'Distribution of Win Margin by Traveling Status')
}