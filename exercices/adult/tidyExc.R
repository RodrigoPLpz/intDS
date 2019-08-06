# Se limpia el espacio de trabajo  y ubicamos desde la raíz.
rm(list = ls())
setwd("~")
# Se instancian las paqueterías necesarias.
require(tidyverse)
require(nycflights13)
# Exportamos el archivo en una variable dir
dirAdu <- "C:\\Users\\mecat\\Desktop\\adult" 
# Leemos la base de datos 
adult <- read.csv(paste(dirAdu,"adult2.csv", sep = "/"),stringsAsFactors = T)
str(adult)
#Transformar a tibble
adult <- as_tibble(adult)
#Filtrar hombres por columna de sexo y guardala en variable hombres
hombres <- filter(adult, sex==" Male")
hombres
#Selecciona solo las columnas age, educaction,native-country
adult2 <- select(adult,age,education, native.country)
adult2
#Ordena las observaciones por pais de forma ascendente
arrange(adult, native.country)
#Ordena las observaciones por edad de forma descedendente
arrange(adult,desc(age))
#Crea una nueva base que agrupe las observaciones por sexo y pais con una variable "count" 
#que contenga la cantidad que hay por grupo
by_sex_country <- group_by(adult, sex, native.country)
by_sex_country
summarise(by_sex_country,count=n())
