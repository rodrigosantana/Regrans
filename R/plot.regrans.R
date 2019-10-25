##' @title Plot of Segmented Linear Regression for an \code{regrans}
##'     Object
##' @name plot.regrans
##' @author Rodrigo Sant'Ana \email{rsantana@@univali.br}, Fernando
##'     Mayer \email{fernando.mayer@@ufpr.br}
##'
##' @description Segmented linear regression plot for visualization of
##'     the transition point (or allometric inflection point) identified
##'     by interactive regrans routine.
##'
##' @param obj \code{regrans} object, result of \code{regrans} function.
##' @param col.lines a vector with length 2 containing the names of
##'     colors that will be drawing the lines of both linear models
##'     (left and right).
##' @param lty.lines a vector with length 2 containing the names of
##'     line types that will be drawing the lines of both linear models
##'     (left and right).
##' @param lwd.lines a vector with length 2 containing the names of
##'     line widths that will be drawing the lines of both linear models
##'     (left and right).
##' @param ... further arguments passed to or from other methods to
##'     plot.
##'
##' @return The function 'plot.regrans' will return a plot with both
##'     segment regressions models.
##'
##'
plot.regrans <- function(obj,
                         col.lines = c("red", "blue"),
                         lty.lines = c("solid", "solid"),
                         lwd.lines = c(1, 1), ...) {
    if(length(col.lines) != 2 | length(lty.lines) != 2 |
       length(lwd.lines) != 2) {
        stop("Length of the arguments *.lines must be equal to 2")
    }
    da <- rbind(obj$left$model, obj$right$model)
    plot(Y ~ X, data = da, ...)
    lines(x = obj$left$model$X, y = obj$left$fitted.values,
          col = col.lines[1], lty = lty.lines[1], lwd = lwd.lines[1])
    lines(x = obj$right$model$X, y = obj$right$fitted.values,
          col = col.lines[2], lty = lty.lines[2], lwd = lwd.lines[2])
}
