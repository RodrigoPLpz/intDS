#Vectores function c()
codesCountry <- c(Mex=380,EU=129,Egypt=818)
codesCountry
class(codesCountry)
#Se crea un vector númerico sin nombre de variables
codesCountry2 <- c(23,45,78)
codesCountry2
#creamos un vector que contenga el nombre de las variables
country <- c("Brasil","Argentina","Venezuela")
#Se puede asigna nombre a las columnas con el vector country.
#names(vector npuerico y sin nombre de variabels) <- vector con los nombres
names(codesCountry2) <- country
#Se veucle a llamar al vector númerico
codesCountry2
class(codesCountry2)
#Acceder a los elementos de un vector
#Trae la columna y su dato
codesCountry2[3]
codesCountry2["Venezuela"]
#Trae sólo el dato de esa columna
codesCountry2[[3]]
codesCountry2[1:3]
codesCountry2[c(1,2,3)]
codesCountry2[c(1,3)]
codesCountry2[c("Brasil","Venezuela")]
#Vector Coersion
x <- c(34, "Jorge",3)
x
#Convierte los elementos numericos en carácter
class(x)
#Se puede convertir números a caracteres con el método as.character()
x <- 1:5
y <- as.character(x)
y
#Se puede convertir de caracteres a números con el método as.numeric()
as.numeric(y)
#NA - Not assigment
vector1 <- c("12","h","456")
vector2 <- as.numeric(vector1)
#Entre el 0 y el 100 debe haber 5 (length.out)
a <- seq(1,100,length.out = 8)
a
#sort() ordena lo elementos númericos de un vector de menor a mayor
library(dslabs)
murders$total
sort(murders$total)
#order() muestra los indices de los elementos númericos de un vector de menor a mayor
x <- c(45,89,12,345,1,86)
sort(x)
index <- order(x)
#a index le guarde el vector con el orden ascendente segun los indices
#puedo aplicare a x el orden de sus elementos segun sea index
x[index]
#No se puede aplicar la funcion sort() a elementos chart pero si podemos ordenarlos segun
#su indice
index <- order(murders$total)
murders$abb[index]
#max() muestra el maximo valor de un vector
max(murders$total)
#which.max(murders$total) muestra el indice del elemento con el valor máximo de un vector
#which.min(murders$total) muestra el indice del elemento con el valor minimo de un vector 
i_max <- which.max(murders$total) 
i_max
murders$state[i_max]
#rank() devuelve el orden de los indices de un vector de forma ascendente 
#(como aplciar primero un order(), indiceciar esos elementos y devolverlos
# segun su valor del más chico al mas grande
x <- c(54,767, 23, 12, 999)
rank_x <- rank(x)
rank_x
order_x <- order(x)
order_x
#Creando un data frame con db murders
# Define a variable states to be the state names from the murders data frame
states <- murders$state
# Define a variable ranks to determine the population size ranks 
ranks <- rank(murders$population)
# Define a variable ind to store the indexes needed to order the population values
ind <- order(murders$population)
# Create a data frame my_df with the state name and its rank and ordered from least populous to most 
my_df <- data.frame(state=states[ind],rank=ranks[ind])
my_df
# Using new dataset 
library(dslabs)
data(na_example)
# Checking the structure 
str(na_example)
# Find out the mean of the entire dataset 
mean(na_example)
# Use is.na to create a logical index ind that tells which entries are NA
#is.na()
ind <- is.na(na_example)
# Determine how many NA ind has using the sum function
sum(ind)
# Note what we can do with the ! operator
x <- c(1, 2, 3)
ind <- c(FALSE, TRUE, FALSE)
x[!ind]
# Create the ind vector
library(dslabs)
data(na_example)
ind <- is.na(na_example)
# We saw that this gives an NA
mean(na_example)
# Compute the average, for entries of na_example that are not NA 
mean(na_example[!ind])
#Vector arithmetic
#Por porpiedades de vectores, una operacion aritmetica se efectua
#en cada elemento del vector
x_in <- c(24,35,67,123,29,76)
#multiplicación
x_cm <- x*2.54
x_cm
#resta
x_cm2 <- x_cm -34
x_cm2
#siempre y cuando los vectores sean de la misma longitud,
#se puede operar entre sus elementos
murder_rate <- murders$total/murders$population * 100000
murder_rate
#decreasing=TRUE, orden del más grande al más chico
murders$state[order(murder_rate,decreasing = TRUE)]
# Assign city names to `city` 
city <- c("Beijing", "Lagos", "Paris", "Rio de Janeiro", "San Juan", "Toronto")
# Store temperature values in `temp`
temp <- c(35, 88, 42, 84, 81, 30)
# Convert temperature into Celsius and overwrite the original values of 'temp' with these Celsius values
temp <- (5/9)*(temp-32)
# Create a data frame `city_temps` 
city_temps <- data.frame(city=city,tempFar=temp)
city_temps
#NEuler number
# Define an object `x` with the numbers 1 through 100
x<- c(1:100)
# Compute the sum
x_sqr <- x*x
x_sqr
sum(1/x_sqr)
# Load the data
library(dslabs)
data(murders)
# Store the per 100,000 murder rate for each state in murder_rate
murder_rate <- murders$total/murders$population * 100000
murder_rate
# Calculate the average murder rate in the US 
mean(murder_rate)