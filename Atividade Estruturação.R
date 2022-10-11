#library(datasets)
library(dplyr)
library(tidyr)

# Vamos carregar o dataset como "df"
df <- readxl :: read_excel("bases_originais/cvli_bd.xlsx", sheet = "Plan1")  

# Vamos dar uma olhada na estrutura e nas primeiras linhas
str(df)
colnames(df)
head(df)

# Temos um dataset com a série histórica anual de CVLI 
# vamos transformar o para um dataset "largo" com a
# função pivot_wider.

# Primeiro vamos filtrar a série pare reduzir nosso dataframe 
df <- df %>% filter(ANO > 2011) %>% group_by(MUNICIPIO, SEXO, `NATUREZA JURIDICA`,ANO) %>% summarise(CVLI = sum(`TOTAL DE VITIMAS`)) %>% arrange(ANO)
head(df)
# Agora sim vamos "pivotar" nossa base, que vai ter agora a informação de ano 
# distruibuída ao longo de colunas
df_long <- pivot_wider(df,names_from = ANO,values_from = CVLI )

# Vamos dar uma olhada no dataset transformado
head(df_long)