library(dplyr)
library(readxl)

# Carregando o dataframe 
cvli <- read_excel("bases_originais/cvli.xlsx", 
                   sheet = "Plan1")
str(cvli)
colnames(cvli)

cvli <- cvli %>% group_by(MUNICIPIO,SEXO,ANO) %>% summarise(Total = sum(`TOTAL DE VITIMAS`))

### Estatística Descritiva com R
## Tabela de frequência absoluta da variável Murder da base USArrests
table(cvli$Total)

## Tabela de frequência relativa da variável Murder da base USArrests
prop.table(table(cvli$Total))

## Média da variável Murder da base USArrests
mean(cvli$Total)

## Mediana da variável Murder da base USArrests
median(cvli$Total)

## Separatrizes da variável Murder da base USArrests
quantile(cvli$Total, probs=0.75)
quantile(cvli$Total, probs=0.10)
quantile(cvli$Total, probs=0.95)
boxplot(cvli$Total) # boxplot - gráfico que resume as sepatrizes

## Desvio-padrão da variável Murder da base USArrests
sd(cvli$Total)
plot(cvli$Total)

## Sumário descritivo básico das variáveis
summary(cvli)

## Sumário descritivo completo das variáveis usando o pacote fBasics
pacman::p_load(fBasics)
basicStats(cvli[ , c(4)])
hist(cvli$Total) # histograma - gráfico que permite conhecer a curva dos dados
