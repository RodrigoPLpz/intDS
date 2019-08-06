setwd("E:\\RodriGo\\Cursos\\devf\\intDS\\exercices")
fifa2 <- read.csv("data.csv", stringsAsFactors = FALSE)
fifa2
#cantidad de filas
nrow(fifa2)
#18207
#cantidad de columnas
ncol(fifa2)
#89
#str(fifa)
#conversion a tibble
fifa2 <- as_tibble(fifa2)
#Crea un segundo data frame con las siguientes columnas "ID","Name","Age","Photo","Jersey.Nu
soccer <- select(fifa2,"ID","Name","Age","Photo","Jersey.Number")
soccer
#-----------------------------------------------------------------------
#Crea una nueva columna que indique en qué quintil de la columna Wage,
#se encuentra. Marca los quintiles como q1, q2, q3,q4,q5
#fifa$Jersey.Number  o fifa[,"Jersey.Number] o fifa[,<indice de la col>]
#----------------------------------------------------------------------
#Jugadores con Overall > 90 
select(fifa2,Overall)
filter(fifa2, Overall > 90)
#Jugadores menores de 30 años y ganan más de 80k euros
filter(fifa2,Age < 30 & Wage =="�,�80M")
#Valor máximo de valor de mercado
select(fifa2,Value)
group_value <- group_by(fifa2,Value)
#----------------------------------------------------------------------
#Jugadores del Manchester City 
group_spMc <- filter(fifa2,Club =="Manchester City")
summarise(group_spMc,count=n())
#30 jugadores
#Portero con los mejores reflejos "GKReflexes"
portero <- group_by(fifa2,Name,Position=="GK")
portero
portero2 <- filter(portero,GKReflexes > 90)
arrange(portero2, desc(GKReflexes))
filter(fifa2,Position=="GK"& GKReflexes >94)
#De Gea 94
fifa[fifa$Position == "GK" & fifa$GKReflexes ==94,c("Name","GKReflexes")]
#De Gea