# Limpiamos el espacio de trabajo y seteamos desde raiz.
rm(list=ls())
setwd("~")
#Instanciamos librarias
library(dplyr)
# Se declara la ruta de el directorio en la vaiable dir.
dir <- "E:\\RodriGo\\Cursos\\devf\\intDS\\exercices"

# Se carga el archivo del data base
soccer <- read.csv(paste(dir,"data.csv", sep = "/"), stringsAsFactors = F)

# Verificamos la estrucura del database soccer.
str(soccer)

# cantidad de filas
nrow(soccer)

# Cantidad de columnas
ncol(soccer)

# Crea un segundo data frame con las siguientes columnas "ID","Name","Age","Photo","Jersey.Nu
soccer2 <- soccer[c("ID","Name","Age","Photo","Jersey.Number")]
head(soccer2,5)

# Crea una nueva columna que indique en quÃ© quintil de la columna Wage, <o_0/o_0>
# se encuentra. Marca los quintiles como q1, q2, q3,q4,q5.
# Limpiar y convertir variable Wage.
soccer["â,¬100K"%in% soccer$Wage,"Wage"]
soccer["â,¬100M"%in% soccer$Wage,"Wage"]
rm_euro <- gsub("â,¬","", soccer$Wage)
rm_mil  <- gsub("K","",rm_euro)
cv_wage <- as.numeric(rm_mil, na.rm=T)
wage2 <- cv_wage*1000
# Se crea el quintil de la columna Wage.
quintiles <- quantile(wage2, seq(0,1,0.2), na.rm = T)
quintiles
# Agregamos las columnas
soccer <- mutate(soccer,WageNum = wage2, Quintil = cut(WageNum, quintiles, na.rm=T))
tail(soccer,5)
head(soccer,5)
# Agrupamos por quintiles.
q<- group_by(soccer,Quintil)
#resumen
summarize(q)

#Jugadores con Overall > 90
select(soccer,Name,Overall) %>%
  filter(Overall > 90)
soccer[soccer$Overall > 90, c("Name","Overall")]


#Jugadores menores de 30 años y ganan máss de 80k euros
str(soccer)
soccer["â,¬100K"%in% soccer$Wage,"Wage"]
soccer["â,¬100M"%in% soccer$Wage,"Wage"]
jug_jov_80 <- select(soccer,Name, Age, WageNum) %>%
                filter(Age < 30 & WageNum > 80000)
head(arrange(jug_jov_80,WageNum),5)
tail(arrange(jug_jov_80,WageNum),5)

jug_jov_80_2 <- soccer[soccer$Age < 30 & soccer$WageNum > 80000, c("Name","Age","WageNum")]
head(arrange(jug_jov_80_2,desc(WageNum)),5)
tail(arrange(jug_jov_80_2,desc(WageNum)),5)

#Valor maximo de valor de mercado. 
str(soccer)
soccer["â,¬100K"%in% soccer$Value,"Value"]
soccer["â,¬10M"%in% soccer$Value,"Value"]

rm_euro2 <- gsub("â,¬","", soccer$Value)
rm_K     <- gsub("K","",rm_euro2)
rm_M     <- gsub("M","",rm_K)
cv_value_num <- as.numeric(rm_M, na.rm = T)
cv_value <- cv_value_num*1000
cv_value
summary(cv_value)
#Truena porque no distingue entre M y K
#guardar en una variable los datos que tiene K
#guardar en una variable los datos que tiene M
#Seleccionarlos con un if si k multiplicar por 1000 caso contrario multiplicar por 1000000

#Jugadores del Manchester City 
select(soccer,Name,Club) %>%
  filter(Club == "Manchester City")

spMC <- soccer[soccer$Club == "Manchester City", c("Club","Name")]
nrow(spMC)

#Portero con los mejores reflejos "GKReflexes"
class(soccer$GKReflexes)
reflejos_portero <- as.numeric(soccer$GKReflexes)
class(reflejos_portero)
max(reflejos_portero, na.rm = T)
select(soccer, Name,GKReflexes) %>%
  filter(GKReflexes >= 94 )
#Trae un A.Sicker con â,¬508K
#Caso contrario a hacerlo de esta forma
mp = soccer[soccer$Position == "GK",c("Name","GKReflexes")]
max(mp$GKReflexes)
mp[mp$GKReflexes >=94,c("Name")]
soccer[soccer$Position == "GK" & soccer$GKReflexes == 94,c("Name","GKReflexes")]