rm(list=ls())
setwd("~") 

##########################
# Machine Learning 		 #
# Decision Trees		 #
#   			 		 #
##########################

#install.packages(c("C50", "gmodels"))
require(gmodels)
#require('class')
require('C50')
#require("AppliedPredictiveModeling")

dir1 <- "C:\\Users\\mecat\\Desktop\\decisionTree"


## ---------- Decisiones de árboles
# Entropia de un segmento de dos clases 
-0.50 * log2(0.50) - 0.50 * log2(0.50)
-0.60 * log2(0.60) - 0.40 * log2(0.40)
-0.70 * log2(0.70) - 0.30 * log2(0.30)
-0.80 * log2(0.80) - 0.20 * log2(0.20)
-0.90 * log2(0.90) - 0.10 * log2(0.10)

#Graficamos la curva
curve(-x * log2(x) - (1 - x) * log2(1 - x),
      col = "red", xlab = "x", ylab = "Entropy", lwd = 1)
      
      
#Leer datos
#Base de datos de Wisconsin Breast Cancer Diagnostic 
#569 muestras, 
wbcd <- read.csv(paste(dir1, "wisc_bc_data.csv", sep="/"), stringsAsFactors = TRUE)

# ver al estructura
#32 propiedades, 1 con un identificador unico, 1 para el diagnóstico, 30 númericas
str(wbcd)

# Quitamos la variable id 
# no es necesaria para el clasificador. Si no la quitamos, dará resultados irrelevantes
wbcd <- wbcd[-1]
str(wbcd)
# Generamos una tabla con los diagnósticos
table(wbcd$diagnosis)

# recodificamos la colmna diagnosis como factor
# los algoritmos requieren que el valor "objetivo" sea un factor 
wbcd$diagnosis <- factor(wbcd$diagnosis, levels = c("B", "M"),
                         labels = c("Benigno", "Maligno"))

# Transformamos la tabla a porcentajes
round(prop.table(table(wbcd$diagnosis)) * 100, digits = 1)

# Se asignan datos a dos base un set de entrenamiento y otro de prueba o test
wbcd_train <- wbcd[1:469, -1]
wbcd_test <- wbcd[470:569, -1]
str(wbcd_train)

# Guardamos la clasificación de cada uno (B o M) de la primera columna
wbcd_train_labels <- wbcd[1:469, 1]
wbcd_test_labels <- wbcd[470:569, 1]
str(wbcd_train_labels)

wbcd_model <- C5.0(wbcd_train, wbcd_train_labels)
wbcd_model
summary(wbcd_model)

## ------------- ------------- ------------- ------------- -------------
# Evaluamos el modelo
# Creamos un vector con las predicciones sobre nuestos datos de pruebas
wbcd_pred <- predict(wbcd_model, wbcd_test)
wbcd_pred
CrossTable(wbcd_test_labels, wbcd_pred,
           prop.chisq = FALSE, prop.c = FALSE, prop.r = FALSE)

## ------------- ------------- ------------- ------------- -------------
# boosts
# 
wbcd_boost10_model <- C5.0(wbcd_train, wbcd_train_labels,trials = 10)
wbcd_boost10_model
summary(wbcd_boost10_model)

wbcd_boost_pred10 <- predict(wbcd_boost10_model, wbcd_test)
CrossTable(wbcd_test_labels, wbcd_boost_pred10,
           prop.chisq = FALSE, prop.c = FALSE, prop.r = FALSE,
           dnn = c('actual', 'predicción'))




