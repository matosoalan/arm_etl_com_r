## CORRELAÇÃO COM R ##
# PRIMEIRO, VAMOS CARREGAR OS PACOTES
pacman::p_load(datasets,corrplot, dplyr, ggplot2)

# Vamos carregar o dataset Boston com dados sobre ocupação dos imóveis da cidade de Boston
df <- Boston
str(df)

# TABELA DE CORRELAÇÃO COM TODAS AS VARIÁVEIS #
cor(df)

# GRÁFICOS DE DISPERSÃO PAREADOS DAS VARIÁVEIS #
pairs(df)

# CORRPLOT DAS VARIÁVEIS #
dfCor <- cor(df)
corrplot(dfCor, method = "number", order = 'alphabet')
corrplot(dfCor, order = 'alphabet')