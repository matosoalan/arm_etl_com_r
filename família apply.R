df <- data.frame("indice" = seq(1:1000),
"v1" = sample(1:2000,1000, replace = TRUE),
"v2" = sample(1:3000,1000, replace = TRUE),
"v3" = sample(1:5000,1000, replace = TRUE))

df_media <- sapply(df[ , -1],mean)
