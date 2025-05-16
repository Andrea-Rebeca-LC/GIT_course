#graficos 
z <- data.frame(grupo = sort(rep(c("a", "b"), 8)), var1 = rnorm(32))
plot(z$var1)
hist(z$var1)
boxplot(var1 ~ grupo, data=z, main="boxplot de prueba", xlab = "grupo",
        + ylab = "variable 1")

z$var2 <- (z$var1)^2
z <- z[order(z$var1), ]
par(mfrow=c(2,2))
plot(z$var1, z$var2, type="p", main="solo puntos")
plot(z$var1, z$var2, type="l", main="solo líneas")
plot(z$var1, z$var2, type="b", main="puntos y líneas")
plot(z$var1, z$var2, type="o", main="puntos y líneas\n sobrepuestos")

help("hist")

