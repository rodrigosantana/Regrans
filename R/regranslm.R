##' @title Fits Segmented Linear Regression Models
##' @name regranslm
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
regranslm <- function(x, y, n.min = 5) {
    if(n.min < 3) {
        stop("n.min must be greater than 2")
    }
    if(length(x) != length(y)) {
        stop("x and y lengths differ")
    }
    if(!is.numeric(x) | !is.numeric(y)) {
        stop("x and y must be numeric")
    }
    da <- data.frame(X = x, Y = y)
    nmod <- nrow(da) - (n.min*2)
    mod <- list()
    length(mod) <- nmod
    out1 <- data.frame(i = numeric(nmod), b0 = numeric(nmod),
                       b1 = numeric(nmod), r.sq = numeric(nmod),
                       r.sq.adj = numeric(nmod), sq.res = numeric(nmod),
                       n = numeric(nmod))
    out2 <- data.frame(i = numeric(nmod), b0 = numeric(nmod),
                       b1 = numeric(nmod), r.sq = numeric(nmod),
                       r.sq.adj = numeric(nmod), sq.res = numeric(nmod),
                       n = numeric(nmod))
    for(i in 1:(nrow(da) - (n.min*2))) {
        left <- da[1:(i + (n.min - 1)), ]
        right <- da[(i+n.min):nrow(da), ]
        mod[[i]] <- list(left = lm(Y ~ X, data = left),
                         right = lm(Y ~ X, data = right))
        ## Left
        l.mod <- summary(mod[[i]]$left)
        l.b0 <- l.mod$coefficients[1,1]
        l.b1 <- l.mod$coefficients[2,1]
        l.rq <- l.mod$r.squared
        l.rq.adj <- l.mod$adj.r.squared
        l.sq.res <- sum(l.mod$residuals^2)
        l.n <- nrow(left)
        ## Right
        r.mod <- summary(mod[[i]]$right)
        r.b0 <- r.mod$coefficients[1,1]
        r.b1 <- r.mod$coefficients[2,1]
        r.rq <- r.mod$r.squared
        r.rq.adj <- r.mod$adj.r.squared
        r.sq.res <- sum(r.mod$residuals^2)
        r.n <- nrow(right)
        out1[i,] <- c(i, l.b0, l.b1, l.rq, l.rq.adj, l.sq.res, l.n)
        out2[i,] <- c(i, r.b0, r.b1, r.rq, r.rq.adj, r.sq.res, r.n)
    }
    out <- rbind(out1, out2)
    out <- out[order(out$i),]
    row.names(out) <- paste0("m", out$i, rep(c("l", "r"), l = nrow(out)))
    out$i <- NULL
    final <- list(out = out, mod = mod)
    class(final) <- "regrans"
    return(final)
}
