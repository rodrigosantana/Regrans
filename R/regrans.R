##' @title Interactive Routine for Fit Segmented Linear Regression
##'     Models
##' @name regrans
##'
##' @description Fit segmented linear models
##' @param x a numeric vector.
##' @param y a numeric vector.
##' @param n.min minimum number of points (x,y) to be considered in a
##'     linear model.
##' @return a data frame containing the results of each model fitted.
##' @author Rodrigo Sant'Ana \email{rsantana@@univali.br}, Fernando
##'     Mayer \email{fernando.mayer@@ufpr.br}
##'
##' @export
regrans <- function(x, y, n.min = 5) {
    obj <- regranslm(x = x, y = y, n.min = n.min)
    obj$out$id <- as.numeric(gsub("\\D", "", row.names(obj$out)))
    vet <- tapply(obj$out$sq.res, obj$out$id, sum)
    b.fit <- obj$mod[[which.min(vet)[1]]]
    class(b.fit) <- "regrans"
    return(b.fit)
}
