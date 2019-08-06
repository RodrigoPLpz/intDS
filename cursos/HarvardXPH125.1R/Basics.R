#Objetos en R
#Asignacion de variables
#Las variables deben empezar con una letra y no contener espacios
a <-  1
b <-  1
c <- -1
boys <- 355
BoyFats <- 300
boy_bas
#Impresión del valor de las variables
a
d
print(c)
#Funcion que muestra el nombre de lso objetos del workspace
ls()
#SOlucion a ecuacion de segundo grado copuesto por las variables anteriores.
solution_1 <- (-b + sqrt(b^2 - 4*a*c))/(2*a)
solution_2 <- (-b - sqrt(b^2 - 4*a*c))/(2*a)
solution_1
solution_2
#Funciones
log(8)
#Recordando el valor de a =1
log(a)
exp(1)
log(exp(1))
help("log")
?"log"
args(log)
#Las funciones pueden o no tener argumentos. Depende de cómo fueron diseñadas
log(8,base=2)
log(8,2)
#data es una función que contiene un set de DB 
data()
CO2
pi
Inf
#Secuencia de números seq(inicio,final(no necesariamente, puede ser e max), paso)
seq(1,5)
1:5
seq(1,20,2)
#Reasignando el valor de variables de a,b,c y reutilizando solution_1 and soluntion_2
#para la ecuacion 3x^2 + 2x -1
a <- 3
b <- 2
c <- -1
solution_1
solution_2
#Data Types
b <- 22
# class determina el tipo de un objeto (b)
class(b)
#dataframes
library(dslabs)
data("murders")
class(murders)
murders
#str() muestra la estructura de una dataframe
str(murders)
#Trae el encabezado de un dataframe o las priemeras observaciones con sus variables
head(murders)
#Trae la cola de un dataframe o las últimas observaciones con sus variables
tail(murders)
#Acceder a valores de una columna o 
murders$state
murders[,"state"]
murders$population
#Sólo trae los datos de una columna (dataframe) como un vector "WTF R"..
val_col <- murders["state"]
class(val_col)
val_col$state
val_col[18,]
#Se muestra el nombre de las variables o columnas de un dataframe
names(murders)
#Las variables o columnas puden considerarse vectores por tanto se pude saber su longitud
population_colm <- murders$population
state_colm <- murders$state
#length perimite saber la longitud de un vector
length(population_colm)
length(murders$state)
#Character vectors
#caracter string
"a"
#La columna state esta compuesta por charaters
class(murders$state)
#Logical vectors
#relation operations devuelve TRUE OR FALSE
z <- 4==2
z
class(z)
#Factor se utilizan para guardar datos categoricos o agrupaciones de datos
#Para el dataframe murders: South, West, North Central, Northeast
murders$region
class(murders$region)
#Para visualizar los factores se usa levels
levels(murders$region)
#table (vector) Regresa la frecuencia de cada uno de los elementos del vector