#carrega a base de snistros de transito do site da PCR
 sinistrosRecife2019Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/3531bafe-d47d-415e-b154-a881081ac76c/download/acidentes-2019.csv', sep = ';', encoding = 'UTF-8')
 saveRDS(sinistrosRecife2019Raw,"sinistrosRecife2019Raw.rds")
 
  sinistrosRecife2020Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/fc1c8460-0406-4fff-b51a-e79205d1f1ab/download/acidentes_2020-novo.csv', sep = ';', encoding = 'UTF-8')
  saveRDS(sinistrosRecife2020Raw,"sinistrosRecife2020Raw.rds")
 
  sinistrosRecife2021Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/2caa8f41-ccd9-4ea5-906d-f66017d6e107/download/acidentes_2021-jan.csv', sep = ';', encoding = 'UTF-8')
  saveRDS(sinistrosRecife2021Raw,"sinistrosRecife2021Raw.rds")

# carrega a base de snistros de transito do site da PCR
sinistrosRecife2019Raw <- readRDS("sinistrosRecife2019Raw.rds")
sinistrosRecife2020Raw <- readRDS("sinistrosRecife2020Raw.rds")
sinistrosRecife2021Raw <- readRDS("sinistrosRecife2021Raw.rds")



# Verificar as colunas do dataset
print(colnames(sinistrosRecife2019Raw))
print(colnames(sinistrosRecife2020Raw))
print(colnames(sinistrosRecife2021Raw))

# No dataset de 2020 temos um campo a mais "descrição" na 14 coluna, vamos retirar
# utilizando indexação
sinistrosRecife2020Raw <- sinistrosRecife2020Raw[,-14]


# junta as bases de dados com comando rbind (juntas por linhas)
sinistrosRecifeRaw <- rbind(sinistrosRecife2020Raw, sinistrosRecife2021Raw)

# observa a estrutura dos dados
str(sinistrosRecifeRaw)

# modifca a data para formato date
sinistrosRecifeRaw$data <- as.Date(sinistrosRecifeRaw$data, format = "%Y-%m-%d")

# modifica natureza do sinistro de texto para fator
sinistrosRecifeRaw$natureza_acidente <- as.factor(sinistrosRecifeRaw$natureza_acidente)

# cria funçaõ para substituir not available (na) por 0
naZero <- function(x) {
  x <- ifelse(is.na(x), 0, x)
}

# aplica a função naZero a todas as colunas de contagem
sinistrosRecifeRaw[, 15:25] <- sapply(sinistrosRecifeRaw[, 15:25], naZero)

# exporta em formato nativo do R
saveRDS(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife.rds")

# exporta em formato tabular (.csv) - padrão para interoperabilidade
write.csv2(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife.csv")


# Exercício ---------------------------------------------------------------
# O dataset de 2019 apresenta mais 4 campos (endereco_cruzamento, numero_cruzamento,
# referencia_cruzamento, descrição), vamos retirá-los.

sinistrosRecife2019Raw <- readRDS("sinistrosRecife2019Raw.rds")
str(sinistrosRecife2019Raw)
# vetor com o índice das colunas que iremos retirar
colunas <- c(10,11,12,17)
# Reduzindo o dataset com indexação
sinistrosRecife2019Raw <- sinistrosRecife2019Raw[,-colunas]
names(sinistrosRecife2019Raw)[1] <- "data"
colnames(sinistrosRecife2019Raw)
# Vamos fazer o mesmo tratamento na base de dados de 2019 que realizamos anteriormente

# modifca a data para formato date
sinistrosRecife2019Raw$data <- as.Date(sinistrosRecife2019Raw$data, format = "%Y-%m-%d")
# modifica natureza do sinistro de texto para fator
sinistrosRecife2019Raw$natureza_acidente <- as.factor(sinistrosRecife2019Raw$natureza_acidente)
# aplica a função naZero a todas as colunas de contagem
sinistrosRecife2019Raw[, 15:25] <- sapply(sinistrosRecife2019Raw[, 15:25], naZero)

# juntar as bases com o rbind
sinistrosRecifeRaw <- rbind(sinistrosRecifeRaw,sinistrosRecife2019Raw)
# podemos remover as bases anuais:
rm(sinistrosRecife2019Raw,sinistrosRecife2020Raw,sinistrosRecife2021Raw)

# Vamos dar uma olhada na estrutura do dataset final
str(sinistrosRecifeRaw)

# Temos várias colunas de fatores classificadas como de tipo "chr", texto, podemos
# mudar para fator, vamos fazer isso para "endereço" e "bairro"
sinistrosRecifeRaw$condicao_via <- as.factor(sinistrosRecifeRaw$condicao_via)
sinistrosRecifeRaw$situacao_placa <- as.factor(sinistrosRecifeRaw$situacao_placa)
