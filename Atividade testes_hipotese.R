pacman::p_load(data.table, dplyr, tidyverse, validate, readxl)


# Vamos carregar uma planilha Excel contendo o número de casos de cvli 
# utilizando uma função do pacote readxl, que permite trabalhar com arquivos xls

cvli <- read_excel("bases_originais/cvli.xlsx",  sheet = "Plan1")
str(cvli)
cvli <- cvli %>% group_by(MUNICIPIO,ANO) %>% summarise(Total = sum(`TOTAL DE VITIMAS`))
head(cvli)
POP <- read_excel("bases_originais/POP.xlsx")
str(POP)
POP <- mutate(POP, POP = POP/100000)
head(POP)
cvli <- left_join(cvli,POP)

head(cvli)
str(cvli)

cvli <- cvli %>% filter(ANO == 2017)

teste_cor <- cor.test(cvli$Total,cvli$POP)
print(teste_cor)
summary(teste_cor)
print( str_c( "O p-value do teste de correlação foi igual a ", 
              round(teste_cor$p.value,2)
            )
      )
# H0: variáveis são independentes / não têm associação. p-valor (p-value) > 0.05
# H1: variáveis são dependentes / há associação. p-valor (p-value) <= 0.05
 