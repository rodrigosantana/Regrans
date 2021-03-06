% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_regrans.R
\name{plot_regrans}
\alias{plot_regrans}
\title{Plot of Segmented Linear Regression for an \code{regrans}
    Object}
\usage{
plot_regrans(
  obj,
  col.lines = c("red", "blue"),
  lty.lines = c("solid", "solid"),
  lwd.lines = c(1, 1),
  ...
)
}
\arguments{
\item{obj}{\code{regrans} object, result of \code{regrans} function.}

\item{col.lines}{a vector with length 2 containing the names of
colors that will be drawing the lines of both linear models
(left and right).}

\item{lty.lines}{a vector with length 2 containing the names of
line types that will be drawing the lines of both linear models
(left and right).}

\item{lwd.lines}{a vector with length 2 containing the names of
line widths that will be drawing the lines of both linear models
(left and right).}

\item{...}{further arguments passed to or from other methods to
plot.}
}
\value{
The function 'plot.regrans' will return a plot with both
    segment regressions models.
}
\description{
Segmented linear regression plot for visualization of
    the transition point (or allometric inflection point) identified
    by interactive regrans routine.
}
\examples{
data(simdata)
mod <- regrans(simdata$x, simdata$y)
plot_regrans(mod)

}
\author{
Rodrigo Sant'Ana \email{rsantana@univali.br}, Fernando
    Mayer \email{fernando.mayer@ufpr.br}
}
