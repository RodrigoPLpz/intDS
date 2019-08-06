#Indexing
library(dslabs)
data(murders)
#murder_rate viene de unca vaiable creada en el archivo VectorSort
#Se crea el vector lógico index
index <- murder_rate < 0.71
index <- murder_rate <= 0.71
index
#Te trae los estados que cumplen con los valores TRUE del vetor condición index
murders$state[index]
#Suma los estados TRUE como un 1 y FALSE como 0
#Son los estados con un indice de mortaliad menor o igual a 0.71
sum(index)
#Operadores condicionales
west <- murders$region == "West"
safe <- murder_rate <= 1
#Solo cuando safe y west se cumplan
index <- safe & west
murders$state[index]
#Indeing Functions
x <- c(F,T,F,T,T,F)
#which() Muestra los indices donde x es igual a TRUE
which(x)
#Se muestra el indice del elemento del vector state donde se encuentra Massachusetts
index <- which(murders$state ==  "Massachusetts")
index
#Muestra el valor del indice 22 = Massachusetts
murder_rate[index]
#match() muestra el inidice de los elementos donde cumple el vector c(Estados)
index <- match(c("New York","Florida","Texas"),murders$state)
index
murders$state[index]
murder_rate[index]
# v1%in%v2 Evalua si cada uno de los elementos de un vector (y) se encuentran en otro
#vector (x) y muestra en la posicion de cada uno de los elementos 
#del primer vector (y) donde sí se cumplio.
x <- c("a","b","c","d","e")
y <- c("a","d","f")
y %in% x
c("Boston","Dakota","Washington") %in% murders$state
# Store the murder rate per 100,000 for each state, in murder_rate
murder_rate <- murders$total/murders$population*100000
# Compute the average murder rate using `mean` and store it in object named `avg`
avg <- mean(murder_rate)
# How many states have murder rates below avg ? Check using sum 
#murders$state [murder_rate<avg]
sum(avg_below <- murder_rate<avg)
# Store the 3 abbreviations in a vector called `abbs` (remember that they are character vectors and need quotes)
abbs <- c("AK","MI","IA")
abbs
# Match the abbs to the murders$abb and store in ind
ind <- match(abbs, murders$abb)
# Print state names from ind
murders$state[ind]
# Store the 5 abbreviations in `abbs`. (remember that they are character vectors)
abbs <- c("MA", "ME", "MI", "MO", "MU")
# Use the %in% command to check if the entries of abbs are abbreviations in the the murders data frame
abbs%in%murders$abb
# Store the 5 abbreviations in abbs. (remember that they are character vectors)
abbs <- c("MA", "ME", "MI", "MO", "MU") 
# Use the `which` command and `!` operator to find out which index abbreviations are not actually part of the dataset and store in `ind`
ind <- which(!abbs%in%murders$abb)
# Names of abbreviations in `ind`
abbs[ind]
#Basic Data Wrangling














#---------------------------------------------------------------
M <- matrix(c(1,2,3,"a","b","c"),nrow=2,ncol = 3, byrow = TRUE)
a <- array(c(TRUE,FALSE,TRUE),dim = c(3,3,4))
a
apple_colors <- c('green','green','yellow','red','red','red','green')
fac_app <- factor(apple_colors)
fac_app
fac_nivels_app <- nlevels(fac_app)
fac_nivels_app
#Para calcular la traspuesta de yba matriz
M = matrix( c(2,6,5,1,10,4), nrow = 2,ncol = 3,byrow = TRUE)
t = M %*% t(M)
print(t)
#-------------------------------------------------------------------