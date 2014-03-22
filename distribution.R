library("fitdistrplus")
library("splines")

data <- read.csv("output_r.csv", header=F)
names(data) <- c("x", "y")
attach(data)

plot(x, y)

fit1 <- lm( y~offset(x) -1 )
fit2 <- lm( y~x )
fit3 <- lm( y~poly(x,3) )
fit4 <- lm( y~poly(x,9) )
fit5 <- lm( y~ns(x, 3) )
fit6 <- lm( y~ns(x, 9) )

xx <- seq(0,x[length(x)], length.out=250)
lines(xx, predict(fit1, data.frame(x=xx)), col='blue')
lines(xx, predict(fit2, data.frame(x=xx)), col='green')
lines(xx, predict(fit3, data.frame(x=xx)), col='red')
lines(xx, predict(fit4, data.frame(x=xx)), col='purple')
lines(xx, predict(fit5, data.frame(x=xx)), col='orange')
lines(xx, predict(fit6, data.frame(x=xx)), col='grey')
lines(xx, predict(fit7, data.frame(x=xx)), col='black')

