#Criando um conjunto de dados aleatório
set.seed(1)
x <- rnorm(100)
for (j in 1:100) {
  x[j] <- abs(x[j])
}
y <- vector(length = 100)
for (i in 1:100) {
  y[i] <- x[i]**2+rnorm(1, sd=0.5)
}
#Regressão Linear
fit2 <- lm(y ~ x + I(x**2))
fit <- lm(y ~x)
plot(x,y ,pch=20,col='red')
#Plotar
z <- seq(-1,11,.01) 
z2 <- z^2 
lines(z,predict(fit2,newdata=data.frame(x=z,x2=z2)),col='blue',lwd=2)
lines(z,z2,col='green',lwd=2)
abline(fit,col="yellow",lwd=2)
legend("bottomright",c("Real","Quadr.","Linear"), 
       col=c("green","blue","yellow"), lwd=1)