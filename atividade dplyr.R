library(dplyr)

df_titanic <- read_excel("bases_originais/titanic3.xls")

str(df_titanic)
summary(df_titanic)

#sumário 

count(df_titanic, sex)

# sumários com agrupamentos
df_titanic %>% group_by(sex,age) %>% tally()

### Transformação de Casos
# seleção de casos
df_titanic %>% filter(age > 18) %>% group_by(sex,age) %>% tally()

#novas colunas
df_titanic %>% transmute(
  nome = as.factor(name),
Sexo = as.factor(sex),
Destino = as.factor(home.dest))
