##' @title Implements an ANCOVA for Parameters Comparisons of Segmented
##'     Linear Regressions Based on a \code{regrans} Object
##'
##' @name regrans_ancova
##'
##' @description Parameter comparisons of a segmented linear regression
##'     model based on an interactive \code{regrans} routine.
##'
##' @param obj \code{regrans} object, result of \code{regrans} function.
##' @param ... further arguments passed to or from other methods to
##'     plot.
##'
##' @author Rodrigo Sant'Ana \email{rsantana@@univali.br}, Fernando
##'     Mayer \email{fernando.mayer@@ufpr.br}
regrans_ancova <- function(obj) {
    nleft <- nrow(obj$left$model)
    nright <- nrow(obj$right$model)
    da <- data.frame(model = c(rep("left", nleft),
                               rep("right", nright)),
                     rbind(obj$left$model, obj$right$model))
    m1 <- lm(Y ~ X*model, data = da)
}
