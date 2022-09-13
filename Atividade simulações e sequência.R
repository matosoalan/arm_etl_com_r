# Criando data frame com 2 variaveis

df <- data.frame(
#Index
  "registro" = seq(1:5000),
# Distribuição Binomial
  "Binomial" = rbinom(5000,1,0.8),
# Distribuição Normal  
  "Normal"= rnorm(5000))
