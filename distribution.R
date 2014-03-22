library("fitdistrplus")
library("splines")

data <- read.csv("output_r.csv", header=F)
names(data) <- c("x", "y")
attach(data)

# http://stackoverflow.com/a/3824248
fit1 <- lm( y~offset(x) -1 )
fit2 <- lm( y~x )
fit3 <- lm( y~poly(x,3) )
fit4 <- lm( y~poly(x,9) )
fit5 <- lm( y~ns(x, 3) )
fit6 <- lm( y~ns(x, 9) )


plot(x, y, xlim=c(0,x[length(x)]*10), ylim=c(0,y[length(y)]*10), pch=19)

xx <- seq(0,x[length(x)]*10, length.out=250)
lines(xx, predict(fit1, data.frame(x=xx)), lwd=2, col='blue')
lines(xx, predict(fit2, data.frame(x=xx)), lwd=2, col='green')
lines(xx, predict(fit3, data.frame(x=xx)), lwd=2, col='red')
lines(xx, predict(fit4, data.frame(x=xx)), lwd=2, col='purple')
lines(xx, predict(fit5, data.frame(x=xx)), lwd=2, col='orange')
lines(xx, predict(fit6, data.frame(x=xx)), lwd=2, col='grey')



plot(x, y, xlim=c(0,x[length(x)]), ylim=c(0,y[length(y)]), pch=19)

xx <- seq(0,x[length(x)], length.out=250)
lines(xx, predict(fit1, data.frame(x=xx)), lwd=2, col='blue')
lines(xx, predict(fit2, data.frame(x=xx)), lwd=2, col='green')
lines(xx, predict(fit3, data.frame(x=xx)), lwd=2, col='red')
lines(xx, predict(fit4, data.frame(x=xx)), lwd=2, col='purple')
lines(xx, predict(fit5, data.frame(x=xx)), lwd=2, col='orange')
lines(xx, predict(fit6, data.frame(x=xx)), lwd=2, col='grey')

