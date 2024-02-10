#' Gives a quick scatterplot of number of percentage of wins vs percentage of home games.
#'
#' This will return a scatterplot of the percentage of wins vs percentage of home games,
#' with colors referencing to the total number of games played by each team.
#' 
#' @return This will return a scatterplot of the percentage of wins vs percentage 
#' of home games.
#'
#' @examples
#' ## Give a scatterplot of win percentage vs home game percentage with colors referring
#' to the number of total games played.
#' barplot_win_vs_homestatus()
#' 
#' @import
#'   ggplot2
#'
#' @export

scatterplot_winpercentage_vs_homestatus <- function(){
  cbbga_wins_23 |>
    ggplot(aes(x = home_percentage, y = win_percentage,color = total_games)) +
    geom_point(size = 3, alpha = .6) +
    scale_colour_gradient2(low = "dodgerblue", mid = "black", high = "#00FF00", midpoint=8) +
    theme_minimal() +
    labs(x = 'Percentage of Games at Home',
         y = 'Percentage of Wins',
         title = 'Win Percentage versus Percentage of Games at Home',
         color = 'Number of \nGames Played')
}