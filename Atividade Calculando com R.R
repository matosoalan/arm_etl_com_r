distribuicaoBinomial<-rnbinom(200,mu=2,size=5)
hist(distribuicaoBinomial)

poison<-rpois(200,2)
hist(poison)

#centralização da base de dados

poisonCentralizado<- poison-mean(poison)

hist(poisonCentralizado)
