### CARREGANDO PACOTES ###
pacman::p_load(car, gvlma, lm.beta, lmtest, MASS, sandwich)

### REGRESSÃO aSSAULT - BASE USArrests
df <- USArrests
summary(df)
regdf <- lm(Assault ~ ., data = df)
summary(regdf)
lm.beta(regdf)

# Stepwise #
regdf <- step(lm(Assault ~ ., data = df), direction = 'both') # nos dois sentidos
summary(regdf)

shapiro.test(residuals(regdf))
plot(regdf, which=1, col=c("blue")) # resíduos x ajuste
plot(regdf, which=2, col=c("blue")) # Q-Q Plot
plot(regdf, which=5, col=c("blue"))  # Observações Influentes
vif(regdf)
barplot(vif(regdf), main = "VIF Values", horiz = FALSE, col = "steelblue", ylim = c(0,5))

regRdf <- rlm(Murder ~ ., data = df)
summary(regRdf)