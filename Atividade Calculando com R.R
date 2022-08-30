distribuicaoBinomial<-rnbinom(200,mu=2,size=5)
hist(distribuicaoBinomial)

poisson<-rpois(200,2)
hist(poison)

#centralização da base de dados

poissonCentralizado<- poisson-mean(poisson)

hist(poissonCentralizado)
