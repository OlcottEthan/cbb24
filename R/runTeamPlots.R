#' Team Plots App
#' 
#' This function allows the TeamPlots shiny app to run. The app is a tool to give
#' basic team statistics for a provided team in the form of either a box plot or 
#' a bar plot. If an incorrect name is given the program will character match all
#' the possible options so you can find the team you are looking for.
#' 
#' @export

runTeamPlots <- function() {
  appDir <- system.file("shiny", "teamplots-app", package = "cbb24")
  if (appDir == "") {
    stop("Could not find example directory. Try re-installing `mypackage`.", 
         call. = FALSE)
  }
  
  shiny::runApp(appDir, display.mode = "normal")
}
