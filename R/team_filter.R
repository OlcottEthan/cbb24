#' Filter the data set ccbga24 by a specified team
#'
#' This will filter the data set ccbga24, returning only games where the specified  
#' team competes. 
#'
#' @param team This is the desired team to filter
#' 
#' @return This function returns a tible with just games played by the specified team
#'
#' @examples
#' ## Filter for 'Southern Utah'
#' team_filter('Southern Utah')
#' 
#' @import
#'   tidyverse
#'   magrittr
#'
#' @export

team_filter <- function(team) filter(cbbga24, Away == team | Home == team)
