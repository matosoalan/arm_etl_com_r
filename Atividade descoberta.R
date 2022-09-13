pacman::p_load(dplyr,funModeling, tidyverse) 

# Copiando o dataframe 
# Vamos utilizar o dataframe gss_cats disponível pelo pacote forcats

# Carregando o dataframe 
cvli <- readxl:: read_excel("bases_originais/cvli2.xlsx", 
                   sheet = "Plan1")
str(cvli)
colnames(cvli)
#cvli <- cvli %>% group_by(MUNICIPIO,SEXO,ANO) %>% summarise(Total = sum(`TOTAL DE VITIMAS`))

glimpse(cvli) # olhada nos dados
status(cvli) # estrutura dos dados (missing etc)
freq(cvli) # frequência das variáveis fator
plot_num(cvli) # exploração das variáveis numéricas
profiling_num(cvli) # estatísticas das variáveis numéricas





