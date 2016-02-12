set.seed(122055)
n <- 50
sigma <- 5
b0 <- 2
b1 <- 0.7
x <- runif(n, 10, 30)
yhat <- b0 + b1*x
y <- rnorm(n, yhat, sd = sigma)
simdata <- data.frame(x = x, y = y)
save(simdata, file = "data/simdata.rda")
