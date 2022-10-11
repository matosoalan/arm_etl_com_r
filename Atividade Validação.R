# Vamos carregar uma planilha Excel contendo o número de casos de homicídios 
# utilizando uma função do pacote readxl, que permite trabalhar com arquivos xls

pacman::p_load(data.table, dplyr, tidyverse, validate)

df <- read.csv("bases_originais/CID10.csv", sep = ';', header = T,skip = 4)
str(df)

regras <- validator(Valor_total >= 100, Dias_permanência >= 2, Óbitos > 0)

validacao <- confront(df, regras)

summary(validacao)

plot(validacao)

