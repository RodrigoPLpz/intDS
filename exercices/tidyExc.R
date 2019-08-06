# Se limpia el espacio de trabajo  y ubicamos desde la raíz.
rm(list = ls())
setwd("~")
# Se instancian las paqueterías necesarias.
require(tidyverse)
require(nycflights13)
# Exportamos el archivo en una variable dir
dira <- "E:\\RodriGo\\Cursos\\devf\\intDS\\exercices" 
# Leemos la base de datos 
pre_adult <- read.csv("adult.csv")
pre_adult
