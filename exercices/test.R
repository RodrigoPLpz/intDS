mtcars
#cuenta el númerode filas  variables
str(mtcars)
#Encabezado
head(mtcars,20)
#Footer
tail(mtcars,20)
#número de filas en la base de datos
nrow(mtcars)
#número de columnas
ncol(mtcars)
#ver datos min,max,quintiles
summary(mtcars)
#[fila,columna]
mtcars[1,2]
#[[]] - Para trabajar con el tipo de datos de la columna
#no está creando un dataframe, Traeme los valores de la columna 9
mtcars[[9]]
#Puedo llamarlo por el nombre de la columna
mtcars[["am"]]
#sintaxis con $
mtcars$am
#sintasis [fila,nomColum]
mtcars[,"am"]
mtcars[,9]
#desde la columna 2 hasta las 9
mtcars[,2:9]
mtcars[,seq(from=2,to=9,by=2)]
#subdividir un dataframe
data.frame(mtcars[9,3])
mtcars[c("cyl","mpg","")]
#setea un rango a partir de una clave entre varios usuarios
set.seed(123)
#sample devuelve 22 números aleatorios de 1 a 32
index <- sample(1:nrow(mtcars),22)
mtcars[index,]
#consignos negativo se exluye
mtcars[-index,]

mtcars$hp > 150

tempo <- mtcars
tempo
tempo$am=ifelse(tempo$cyl > 4, "Hombre","Mujer")
tempo
mtcars[[9]]
# traeun dataframe
mtcars["am"]
#trae los valores
mtcars$am
mtcars[,"am"]
#Trae todas las filas u observaciones de la columna 2 a la 9
mtcars[,2:9]
mtcars[,seq(from=2,to=9,by=1)]
#subdividir data.frame de otro
data.frame(mtcars[9])
mtcars[c("cyl","mpg","hp")]
print(class(mtcars["am"]))
print(class(mtcars$am))
str(mtcars)
mtcars[1,]
#vector de indeices
#Trae las filas 3 y 24 con todas sus columnas
mtcars[c(3,24),]
#Trae todas las columnas de la fila especificada por nombre
mtcars["Honda Civic",]
mtcars["Ford Pantera L",]
#Por un vector de nombre de filas
mtcars[c("Honda Civic","Ford Pantera L"),]
#Por vector lógico
mtcars[c(5,10),]
#estoy pidiendo todas las filas que no contengan valor (F), cosa que no ocurre porque todas las filas tienen un valor
mtcars[c(F),]
#todas las filas que tiene un valor
mtcars[c(T),]
mtcars[c(F,T),]
mtcars
mtcars[c(F,F,T,T,F,F,F,F,F,T,T,T,T),]

#Creando un vector con ciclos ifs para filtrar observaciones

dude = c()
mtcars ["am"]
for (i in 1:nrow(mtcars)){
  if(mtcars[i,"am"] == 1){
    dude[i] = TRUE
  } else{
    dude[i] = FALSE
  }
}
#Obtienes un vector TRUE AND FALSE
dude
#Traeme todas las observaciones del vector dude donde exista 1 (TRUE) de acuerdo con la columna "am"
# del dataframe mtcars
mtcars[dude,]
#usando la version corta
#hace el vector de TRUE Y FALSE
mtcars$am == 1
dude2 <- mtcars$am ==1
mtcars[dude2,]
#con la condicion del vector anterior se puede especificar a un dataframe
#traer en especifico esas columnas
mtcars[mtcars$am ==1,c("am","cyl")]
#usando logicos
#se hace un vector condición
mtcars$am == 1 & mtcars$cyl == 6
#se le asigna a una variable
L = mtcars$am == 1 & mtcars$cyl == 6
#se obtine todas las columnas de las observaciones que cumplen segun el vector de condicion
mtcars[L,]
#Lo anterior en una sola línea
mtcars[ mtcars$am == 1 & mtcars$cyl == 6, ]
#ACTUALIZAR datos
#se asigna el dataframe mtcars a mtcars2 (un nuevo data.frame)
mtcars2 <- mtcars
#agrega como una columna el vector dude (vector de TRUE or FALSE) que cumple la condincion
#en donde mtcars en la columna am exista TRUE = 1
mtcars2$dude <-mtcars$am ==1
mtcars2
#Se hace una columna Karen con valores Null, la cula no se crea puesto que no existe valores para dicha col
mtcars2$karen <- NULL
mtcars2
#Eliminar columna dude
mtcars2$dude<- NULL
mtcars2
#Crear una nueva columna "otraColumna con la condición que en la columna cyl del dataframe mtcars2
# sean autos con 5 a 8 cilindros y en la nueva columna ponga Verdadero para quien sí cumple y Falso para donde 
#no se cumpla
mtcars2$otraColumna = ifelse(mtcars2$cyl > 4, "Verdadero","Falso")
mtcars2
#se crea una nueva columna como la anterior pero cuando no cumple,se agrega un NA, porque no hay dato que se haya asignado
mtcars2$nuevaColumna[mtcars2$cyl > 4] = "Verdadero"
mtcars2
#Se reasigna un valor a la nuevaColumna con una condicion que parte de la columna am del dataframe mtcars2, en donde se
#asigna el valor de Falso cuando cumple y NA cuando no cumple
mtcars2$nuevaColumna[mtcars2$am == 0] = "Falso"
mtcars2
#Se asigna una condicion or a la nueva columna multiple
mtcars2$multiple[mtcars2$am == 1 | mtcars2$cyl == 6]= "Multiple"
mtcars2
