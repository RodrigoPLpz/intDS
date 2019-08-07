# Se limpia el espacio de trabajo
rm(list = ls())
setwd("~")
# Se instancian las paqueterías necesarias.
require('C50')
require(gmodels)
# Se especifica en la variable dirhg la dirección 
# de la carpeta qe contiene el dataset
dirh <- "C:\\Users\\mecat\\Desktop\\decisionTree2"
# Se lee la base de datos y se asigana a la variable othf
othf <- read.csv(paste(dirh,"all_data_R.csv", sep = "/"), stringsAsFactors = FALSE)
# Se verifica la estructura del dataset
str(othf)
#Eliminamos las columnas como el nombre del paciente, el mismo identificador de grupo,
#edad,sexo, corpus que es una prueba para niños con problemas de habla
#y Y (clasificador binario de grupo con o sin problemas de lenguaje)
othf<-othf[,-1:-6]
#Se verifica la estructura de la base de datos.
#1163 observaciones y 58 variables, una para el grupo y las demas númericas.
str(othf)
# Se crea una tabla con los grupos de niños con o sin problemas de lenguaje
table(othf$group)
#Asignamos en un vector los datos de la columna group por factores
othf$group <- factor (othf$group, levels= c("SLI","TD"), labels = c("ProLeng","SinProLeng"))
#Normalizamos por porcentaje
round(prop.table(table(othf$group)) *100, digits = 1)
#Se asignan datos a dos bases una entrenamiento y otra de prueba.
othf_train <- othf [1:1063,-1]
othf_test  <- othf [1064:1163,-1]
str(othf_train)
str(othf_test)
#Traemos los datos de la columna group para clasifcarlos (SLI o TD)
othf_train_labels <- othf [1:1063,1]
othf_test_labels  <- othf [1064:1163,1]
str(othf_train_labels)
str(othf_test_labels)
#Se define el modelo de árbol de desiciones utilizando la función C5.0
othf_model <- C5.0(othf_train,othf_train_labels)
othf_model
summary(othf_model)
#Evaluacion del modelo othf_mode, usamos la funcion predict(modelo,dataPrueba)
othf_pred <- predict(othf_model,othf_test )
othf_pred
#Con la funcion CroosTable se crea un vector de las predicciones con los datos de prueba
#(vector(datosPrueba),vecor(etiquetaDatosPrueba),propiedades)
CrossTable(othf_test_labels, othf_pred, prop.chisq = FALSE, prop.c = FALSE, prop.r = FALSE)
#----------------------------------------------------------------------------------------------------------
othf_boost10_model <- C5.0(othf_train,othf_train_labels,trials = 10)
othf_boost10_model
summary(othf_boost10_model)


othf_boost10_pred10 <- predict(othf_boost10_model,othf_test)
CrossTable(othf_test_labels, othf_boost10_pred10, prop.chisq = FALSE, prop.c = FALSE, prop.r = FALSE, dnn = c('ActuaL','Predicción'))
