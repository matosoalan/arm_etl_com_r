library(dplyr)

# Vamos carregar nossa base contendo informações sobre cvli
cvli <- readxl::read_excel("bases_originais/cvli2.xlsx", sheet = "Plan1")
str(cvli)

# Vamos "colar" o nome da região geográfica, primeiro vamos carregar a base com o 
# o nome dos municípios e região

regiao <- read.csv2("bases_originais/regiao.csv")
colnames(regiao) <- c("MUNICIPIO","REGIAO_GEOGRAFICA")
str(regiao)

# Agora vamos fazer uma "junção à esquerda" para agregar a informação do nome do
# município.
cvli <- left_join(cvli,regiao)

View(cvli)
