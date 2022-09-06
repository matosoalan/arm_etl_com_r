install.packages("microbenchmark")
library(microbenchmark)
cvli <- read_excel("bases_originais/cvli.xlsx")
View(cvli)

microbenchmark(
  a <-write.csv(cvli,"cvli.csv"),
  b <- saveRDS(cvli,"cvli.RDS"),
  times = 10L)

microbenchmark(
  a <-read.csv("cvli.csv"),
  b <-readRDS("cvli.RDS"),
  times = 10L)
