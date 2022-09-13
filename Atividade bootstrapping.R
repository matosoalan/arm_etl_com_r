# bootstraping com função replicate
set.seed(1234) # agora, não vamos mais usar como tarefa mas como execução ponto a ponto

distNormalSimulacao <- rnorm(50000)

bootsDistNormal10 <- replicate(10, sample(distNormalSimulacao, 10, replace = TRUE)) # replicamos 10x a amostra, criando assim um bootstrapping
bootsDistNormal10
# calculando uma estatística com bootstrapping (10 amostras)
mediaBootsNormal10 <- replicate(10, mean(sample(distNormalSimulacao, 10, replace = TRUE))) # calculamos a média de 10 amostras de 10 casos
mediaBootsNormal50 <- replicate(50, mean(sample(distNormalSimulacao, 10, replace = TRUE))) # calculamos a média de 50 amostras de 10 casos
mediaBootsNormal100 <- replicate(100, mean(sample(distNormalSimulacao, 10, replace = TRUE))) # calculamos a média de 100 amostras de 10 casos
# vamos comparar???
mean(mediaBootsNormal10) # media do boostraping 10
mean(mediaBootsNormal50) # media do boostraping 50
mean(mediaBootsNormal100) # media do boostraping 100
mean(distNormalSimulacao) # media dos dados originais