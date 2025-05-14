#objetos en R 
#vectores y matrices
#solo puede tener datos de un mismo tipo
a<- 1:10
m <- matrix(data = rnorm(100, mean = 150, sd=25), nrow=10)

m
class(a)
class(m)

vector_letras<- c("b","b", "a", "a")
vector_letras
class(vector_letras)

#dataframe
datos<-data.frame(talla=rnorm(10, 165, 25), 
                  sexo=c(rep("M", 4), rep("H",6)))


datos
class(datos)

#lista
todo <- list(df=datos, m=m, a=a)
todo$a
todo$df
todo$df$talla[todo$df$sexo=="H"]



#importar datos 
#notepad++
dat<-read.table()