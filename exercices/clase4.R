#Manipulación de datos con tidyverse
#Se importan las bibliotecas necesarias
library(tidyverse)
library(nycflights13)
#Se trabaja con la DB de irirs que es del backgroud de R
str(iris)
#as_tibble() transforma un db a tibble
tiris <- as_tibble(iris)
tiris
#select(dataframe,columna1,columna2,columnaN) selecciona variables.
str(flights)
select(flights,year,month,day)
#select(df,colIncio:colFinal)
select(flights,year:day)
#select(df,-(colInicio:colFinal)) selecciona todas las columnas que 
select(flights,-(year:day))
# NO se esten en -()
# Convertir un dataframe en un tibble para poder ejecutar funciones
# con el nombre de sus columnas. Trabajas con los datos de las columnas.
iris <- tbl_df(iris)
iris
#starts_with() selecciona las columnas que empieza con " ".
select(iris,starts_with("Petal"))
#ends_with("Width") selecciona las columnas que termina con " ".
select(iris,ends_with("Width"))
#contains() selecciona todas las columnas que tienen " ". 
select(iris,contains("etal"))
#Dar orden a columnas a partir de la primera espeificada:
#Species y luego todas las demas
#Petal.Length y luego todas las demas
select(iris,Species,everything())
select(iris,Petal.Length,everything())
#filter(db,columnas) filtra observaciones de acuerdo a los valores en las variables.
str(mtcars)
filter(mtcars,cyl == 8)
#sin tibble
mtcars[mtcars$cyl == 8,]
filter(mtcars,cyl < 6)
#sin tibble
mtcars[mtcars$cyl < 6,]
#mulyiples criterios
filter(mtcars,cyl < 6 & vs == 1)
filter(mtcars,cyl < 6 | vs == 1)
#sin tibble
mtcars[mtcars$cyl < 6 & mtcars$vs == 1,]
mtcars[mtcars$cyl < 6 | mtcars$vs == 1,]
#Filtrando una base de datos con varias operaciones sobre una misma columna.
# v1%in%v2 Evalua si cada uno de los elementos de un vector se encuentran en otro.
flights[flights$month == 11 | flights$month == 12,]
flights_nov_dec <- filter(flights,month %in% c(11,12))
flights_nov_dec
#arrange(dt,columnas) reordena observaciones de forma ascendente(por defecto) o descendente.
str(mtcars)
#ordena df mtcars de forma ascendente empezando por cyl,disp y luego todas las demas.
arrange(mtcars, cyl, disp)
#ordena df mtcars de forma descendente a cyl empezando por cyl, disp y luego todas las demas.
arrange(mtcars, desc(cyl), disp)
#mutate(dataset,columnas nuevas) crea nuevas variables mediante funciones de valores existentes.
#Agregas variables al final de un dataset
flights
#Seleciona las columnas especificadas del df flights
flights_sml <- select(flights,year:day,ends_with("delay"), distance, air_time)
flights_sml
#Agregamos al final  del dataset dos columnas  nuevas  -gain y speed.
mutate(flights_sml,gain=arr_delay-dep_delay,speed=distance /air_time *60)
#Agregar columnas y traer solo esas columnas nuevas.
transmute(flights,gain=arr_delay-dep_delay,speed=distance /air_time *60)
#summarise(dataframe, columnas) colapsa y crea observaciones.
#Generalemente se usa con group_by() para agrupar observaciones y generar
#los datos por cada grupo.
#La libreria plyr causa conflictos con la base de datos baseball.
library(plyr)
baseball <- as_tibble(baseball)
#Se manda el "Error in as_tibble(plyr) : object 'plyr' not found"
#porque didyverse tiene una funcion plyr que causa conflicto con la base plyr(jugadores)
# Por eso quitamos el paquete: "plyr"
detach(package:plyr)
# Y la volvemos a activar
libray(plyr)
str(baseball)
#Obtemos el minimo y el maximo de años en los que se registraron partidos de baseball
summary(baseball$year)
#Muetar el total de años en que se han registrado partidos en la base baseball
#y el número de equipos registrados.
summarise(baseball,durration = max(year)-min(year),nteams = length(unique(team)))
#Se muestra el total de hits  por jugador
#agrupo
by_player <- group_by(baseball,id)
by_player
#na.rm exluye a los datos que son NA
summarise(group_by(baseball, id), mean_hits = mean(h, na.rm = TRUE))
#Se muestra el total de hits por jugador año y equipo.
#agrupo
by_player_year_team <- group_by(baseball,id,year,team)
by_player_year_team
summarise(by_player_year_team,mean_hits = mean(h, na.rm = TRUE),count=n())
