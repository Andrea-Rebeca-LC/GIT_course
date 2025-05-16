getwd()
setwd("../") # Moverse a la raíz del proyecto
getwd()

cibmeteo <- read.table("cibmeteo.txt", header=TRUE, sep="\t")
dim(cibmeteo)
summary(cibmeteo)
plot(cibmeteo$temperature, type="l", col = "grey")

attach(cibmeteo)
fecha <- paste(year, month, day, sep = "-")
fecha <- strptime(fecha, "%Y-%m-%d")
fecha_txt <- as.character(fecha)
taire <- as.data.frame(
  cbind(tapply(temperature, list(fecha_txt), min),
  tapply(temperature, list(fecha_txt), max),
  tapply(temperature, list(fecha_txt), mean)))
detach(cibmeteo)
colnames(taire) <- c('tmin', 'tmax', 'tavg')
attach(cibmeteo)
tapply(temperature, list(month, year), mean)
aggregate(temperature, by=list(mes=month, año=year), mean)
detach(cibmeteo)
Z <- c(4, 8, 9, 7, 8, 9, 4, 5)
Z.pmov <- c(7, 8, 8, 8, 7, 6)
Z.pmov <- c(NA, Z.pmov, NA)
Z.pmov

pmov <- function(x, k) {
  n <- length(x)
  y <- rep(NA, n)
  for (i in k:n)
    y[i-floor(k/2)] <- mean( x[(1+i-k):i] )
  y
}

tmean.pmov <- pmov(taire$tavg, 15)

plot(taire$tavg, type = "o",ylab = "temperatura (°C)",xlab="día",
     main = "Temp. diaria promedio en La Paz \n (junio 2006 a mayo 2007)",
     lty = 3, col="grey50", lwd = 1)
lines(tmean.pmov, lwd = 2, col = "blue")
anomalia <- tmean.pmov - mean(tmean.pmov, na.rm=TRUE)
anomalia[is.na(anomalia)] <- 0
dias <- unique(cibmeteo[, 1:3])
ndmes <- aggregate(dias$day, by = list(dias$month, dias$year), length)
ndmes
plot(anomalia, type="n", ylab = "anomalía de temperatura", xlab = "",
     xaxt = "n" )
polygon(c(1:364, 364:1), c(anomalia, rep(0, 364)), col="green")
abline(h=0, v=c(0, cumsum(ndmes$x)), col="black", lty=3)
axis(1, at=cumsum(ndmes$x)-ndmes$x/2, labels = c("jun","jul","ago",
                                                   "sep","oct","nov","dic","ene","feb","mar","abr","may"))
