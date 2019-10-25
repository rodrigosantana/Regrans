##' @title Summarizing Segmented Linear Regression Fits
##' @name summary.regrans
##' @author Rodrigo Sant'Ana \email{rsantana@@univali.br}, Fernando
##'     Mayer \email{fernando.mayer@@ufpr.br}
##'
##' @description "summary" method for class \code{regrans}.
##'
##' @param object an object of class \code{regrans}, usually, a result
##'     of a call to \code{regrans} function.
##' @param correlation logical; if ‘TRUE’, the correlation matrix of the
##'     estimated parameters is returned and printed.
##' @param symbolic.cor logical. If ‘TRUE’, print the correlations in a
##'     symbolic form (see ‘symnum’) rather than as numbers.
##' @param ... further arguments passed to or from other methods.
##'
##' @return The function ‘summary.regrans’ computes and returns a list
##'     of summaries statistics of both (left and right lm) fitted
##'     segmented regression given in ‘object’. For more details see
##'     also the help of summary.lm.
##'
##' @examples
##' data(simdata)
##' mod <- regrans(simdata$x, simdata$y)
##' summary(mod)
##'
##' @method summary regrans
##' @export
summary.regrans <- function(object, correlation = FALSE,
                            symbolic.cor = FALSE, ...) {
    summ.out <- list(
        left = summary(object[[1]], correlation = correlation,
                       symbolic.cor = symbolic.cor, ...),
        right = summary(object[[2]], correlation = correlation,
                        symbolic.cor = symbolic.cor, ...))
    ## class(summ.out) <- "summary.regrans"
    return(summ.out)
}
