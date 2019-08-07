rm(list = ls())
setwd("E:\\RodriGo\\Cursos\\devf\\intDS\\exercices\\ExploratoryDataAnalysisR")
dir()
library(dplyr)
chicago <- readRDS("chicago.rds")

#Se muestramm 2 números, las observaciones y las variables respectivamente
dim(chicago)

#Muestra la estructura del dataframe
str(chicago)

#Traer el nombre de las variables o columnas de un dataframe
names(chicago)[1:3]

#Se muestra un subconjunto de datos de las variables especificadas
subset <- select(chicago,city:dptp)
subset
chicago[1:3]
select(chicago,1:3)

#Se muestra el subconjunto de datos que no incluyen a las variables especificadas
head(select (chicago,-(1:3)))
head(select (chicago,-(city:dptp)))

#"city" es un caracter que esta especificado en el nombre de las columnas de chicago
i<- match("city",names(chicago)) 
j<- match("dptp",names(chicago))
head(chicago[,-(i:j)])

#Se muestra las variables o columnas que terminan con un 2
select(chicago,ends_with("2"))
head(select(chicago,ends_with("2")))
str(chicago)

#Se muestra las variables o columnas que empiezan con un d
select(chicago,starts_with("d"))
head(select(chicago,starts_with("d")))
str(chicago)

#Se muestra las variables o columnas que contienen con un 3
select(chicago,contains("3"))
head(select(chicago,contains("3")))
str(chicago)

#Filtrado de datos.

#Se filtran los datos de las variable pm25tmean2 que son mayor a 30.
str(chicago)
chic.f <- filter(chicago,pm25tmean2 > 30)
head(chic.f)
str(chic.f)
#Ya se obtuvó un subconjunto chi.f con datos mayores a 30 que es un nivel alto responsable.
#¿Cuáles son los maximos y minimos?
min(chic.f$pm25tmean2)
max(chic.f$pm25tmean2)
#Ademas del mostrar los niveles maximos permitos, muestra el minimo y el maximo, así como 
#sus quartiles.
summary(chic.f$pm25tmean2)

#Se filtran datos con dos condiciones: pm25tmean2 > 30 y tmpd > 80
chic.f <- filter(chicago,pm25tmean2 > 30 & tmpd > 80)
chic.f

#Ordenar observaciones de forma ascendente o descendente segun una variable o columna.

#Ordenar la variable date de forma ascendente de la fecha más antigua a la más actual.
chicago <- arrange(chicago,date)
#fecha más antigua
head(chicago)
#fecha más reciente
tail(chicago)
#Seleccionado los primeros y ultimos registros, especificando el número de observaciones.
head(select(chicago,date,pm25tmean2),3)
tail(select(chicago,date,pm25tmean2),3)

#Ordenar la variable date de forma descendete de la fecha actual a las más antigua.
chicago <- arrange(chicago,desc(date))
#fecha más reciente
head(chicago)
#fecha más atigua
tail(chicago)
#Seleccionado los primeros y ultimos registros, especificando el número de observaciones.
head(select(chicago,date,pm25tmean2),5)
tail(select(chicago,date,pm25tmean2),5)

#Renombrando variables de un dataframe
#Se cambia el nombre de la variable tmpd y pm25tmean2
head(chicago[,1:5],3)
#rename(db,nuevoNom = nomActual)
chicago <- rename(chicago,dewpoint = tmpd,pm25 = pm25tmean2)
chicago
head(chicago[,1:5],3)

#Agregar columnas o variables a un data frmae
#Se necesita determinar la calidad de aire de un día respecto al promedio.
#na.rm = TRUE -> no toma en cuenta los datos NA
prom_dia <- mean(chicago$pm25, na.rm =TRUE)
aireConXdia <- chicago$pm25 - prom_dia
head(aireConXdia,3)
#Agregamos la columna al datafrmae chicago
chicago <- mutate(chicago, pm25detrend = pm25-mean(pm25,na.rm = TRUE))
head(chicago,3)

#Se agregan nuevas variables y únicamente se muestras esas variables.
str(chicago)
#Se obtine  las particulas sólidas o líquidas en el aire (pm10tmean2) y el ozono(o3tmean2) de un día respecto al promedio 
# en las nuevas variables: pm10detrend y o3detrend respectivamente.
head(transmute(chicago,pm10detrend = pm10tmean2 - mean(pm10tmean2,na.rm = T) ,o3detrend =  o3tmean2 - mean(o3tmean2,na.rm = TRUE)))

#Agrupacion de variables de un dataframe

#cuál es el nivel promedio anual de PM2.5
#Crear la variable year. as.POSIXlt() permite extraer parte de una fecha  + 1900
chicago <- mutate(chicago, year = as.POSIXlt(date)$year + 1900)
#Ahora podemos agrupar por año
years <- group_by(chicago,year)
#Summarise(subconjunto agrupado, columnas Nuevas respecto a el agrupamiento de variables)
res_agrup_year <- summarise(years,pm25 = mean(pm25,na.rm = T), o3 = mean(o3tmean2,na.rm = T) , no2 = mean(no2tmean2,na.rm = T))
head(res_agrup_year)

#Cuál es el nivel promedio anual de PM2.5 para ozono (o3) y nitrogeno (no2) por quintiles de pm25.
#quantile() es una funcion que produce cuantiles correspondientes
# a las probabilidades dadas entre (0 y 1).Formato:quantile(columna,seq(0,1,0.2[partes]),na.rm = T)
#Definimos los quintiles de pm25.
qq <- quantile(chicago$pm25, seq(0,1,0.2), na.rm = TRUE)
# 1) Agregamos la columna quinitiles de pm25. cut(variable(intervalos de valores), intervalos de corte)
chicago <- mutate(chicago,pm25.quint = cut(pm25,qq))
head(chicago,5)
# 2) Agrupamos por quintiles.
quint<- group_by(chicago,pm25.quint)
# 3) resumen. NO hay relacion respecto a los quintiles pero hay una correlacion positiva entre o3 y no2
summarize(quint,o3 = mean(o3tmean2,na.rm = T), no2 = mean(no2tmean2,na.rm = T))

# Conectando varias acciones. Linea de ensamblaje.

# Sintaxis: %>%. Funciona de izquierda a derecha.
# first(x)%>%second(x)%>%third(x)

# Cuál es el nivel promedio anual de PM2.5 para ozono (o3) y nitrogeno (no2) por quintiles de pm25.
#Definimos los quintiles de pm25.
qq <- quantile(chicago$pm25, seq(0,1,0.2), na.rm = TRUE)
#Conectamos acciones
mutate(chicago, pm25.quint = cut(pm25,qq)) %>%                                          #1)chicago
  group_by(pm25.quint) %>%                                                              #2)quint
  summarise(pm25 = mean(pm25, na.rm = T),                                               #3)resumen
            o3 = mean(o3tmean2,na.rm = T),
            no2 = mean(no2tmean2,na.rm = T))                                            

#Calcular el nivel promedio de contaminantes al mes. Para ver si hay tendencias temporales.
str(chicago)
mutate(chicago, month = as.POSIXlt(date)$mon + 1) %>%
  group_by(month)                                 %>%
  summarize(pm25 = mean(pm25, na.rm = TRUE), o3 = mean(o3tmean2,na.rm = TRUE),no2 = mean(no2tmean2, na.rm = TRUE))