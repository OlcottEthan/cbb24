% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/barplot_win_vs_homestatus.R
\name{barplot_win_vs_homestatus}
\alias{barplot_win_vs_homestatus}
\title{Gives a quick barplot of number of wins for a specified team}
\usage{
barplot_win_vs_homestatus(team)
}
\arguments{
\item{team}{This is the desired team to generate plot for.}
}
\value{
This function returns a split barplot based on the team with the number of games played,
split whether those wins were at a home event or away.
}
\description{
This will return a barplot of the number of wins vs traveling status for the team specified.
}
\examples{
## Give a barplot of number of wins with split on traveling or home games for Utah
barplot_win_vs_homestatus('Utah')

}
