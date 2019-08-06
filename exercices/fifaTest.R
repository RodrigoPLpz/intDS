#Cambia la ruta hacia la carpeta desctop
setwd("~/Documentos/devf/intDS")
#Leer la base de datos
fifa <- read.csv("data.csv", stringsAsFactors = FALSE)
fifa
#cantidad de filas
nrow(fifa)
#18207
#cantidad de columnas
ncol(fifa)
#89
#str(fifa)
#Crea un segundo data frame con las siguientes columnas "ID","Name","Age","Photo","Jersey.Nu
fifa2 = fifa[c("ID","Name","Age","Photo","Jersey.Number")]
fifa2
#-----------------------------------------------------------------------
#Crea una nueva columna que indique en qué quintil de la columna Wage,
#se encuentra. Marca los quintiles como q1, q2, q3,q4,q5
#fifa$Jersey.Number  o fifa[,"Jersey.Number] o fifa[,<indice de la col>]
#----------------------------------------------------------------------
#Jugadores con Overall > 90 
fifa[fifa$Overall > 90,c("Name","Overall")]
#Jugadores menores de 30 años y ganan más de 80k euros
players = fifa[fifa$Age < 30, c("Name","Age","Wage")]
sal1 = strsplit(players$Wage, split="€")
sal2 = strsplit(unlist(sal1),split = " ")
sal3 = strsplit(unlist(sal2),split = "K")
salario = as.numeric(sal3)
salario
players$Wage2 = salario
players[players$Wage2 > 80 & players$Age < 30,c("Name","Wage")]
#€355K
#fifa[fifa$Wage=="€355K", c("Name")]
#----------------------------------------------------------------------
#Valor máximo de valor de mercado
txt_split1 = strsplit(fifa$Value, split="€")
txt_split1

txt_split2 = strsplit(unlist(txt_split1),split = "M")
txt_split2
txt_col2 = c(unlist(txt_split2))
txt_col2

txt_split3 = strsplit(unlist(txt_split1),split = "K")
txt_split3
txt_col3 = c(unlist(txt_split3))
txt_col3

valores <- data.frame(M=txt_col2,K=txt_col3)
valores

txt_col = c(unlist(txt_split3))
txt_col
maxValue = as.numeric(txt_col)
max(maxValue)

fifa[fifa$Value == "€1M",c("Value")]

#----------------------------------------------------------------------
#Jugadores del Manchester City 
spMC = fifa[fifa$Club =="Manchester City",]
nrow(spMC)
#30
#Portero con los mejores reflejos "GKReflexes"
mp = fifa[fifa$Position == "GK",c("Name","GKReflexes")]
max(mp$GKReflexes)
mp[mp$GKReflexes == 94,c("Name")]
#De Gea 94
fifa[fifa$Position == "GK" & fifa$GKReflexes ==94,c("Name","GKReflexes")]
#De Gea