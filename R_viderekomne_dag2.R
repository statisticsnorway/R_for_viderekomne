# R for viderekomne eksemepl kode
# DAG 2: Del 1

#### Funksjoner ####
# funkjson med ingen parameter
lage_oslo_fylke <- function(){
  "03"
}
lage_oslo_fylke()


# funksjon med en parameter
lage_fylke <- function(kommunenr){
  substr(kommunenr, 1, 2)
}

lage_fylke("0301")
lage_fylke(c("0301", "3401"))


# returnere siste linje
lage_fylke <- function(kommunenr){
  fylke <- substr(kommunenr, 1, 2)
  fylke
}

lage_fylke("0301")
lage_fylke("301")


# funksjon med to parameter
lage_fylke2 <- function(kommunenr, sjekk_lengde){
  if(sjekk_lengde == T){
    kommunenr <- ifelse(nchar(kommunenr) == 3, 
                        paste("0", kommunenr, sep = ""), 
                        kommunenr)
  }
  fylke <- substr(kommunenr, 1, 2)
  fylke
}

lage_fylke2(kommunenr ="301", sjekk_lengde = T)
lage_fylke2("301", sjekk_lengde = F)



#### Funkjson med parameter ####
lage_fylke3 <- function(kommunenr, sjekk_lengde = T){
  if(sjekk_lengde == T){
    kommunenr <- ifelse(nchar(kommunenr) == 3, 
                        paste("0", kommunenr, sep = ""), 
                        kommunenr)
  }
  fylke <- substr(kommunenr, 1, 2)
  fylke
}
lage_fylke3(kommunenr ="301")



#### kontroll i funksjoner ####

lage_fylke4 <- function(kommunenr){
  if (nchar(kommunenr) <= 2){
    stop("Kommune nummer var ikke gjeldig. Det bør være lengde 4")
  }
  if(nchar(kommunenr) == 3){
    warning("Kommunenummer er lendge 3 og fylke er dermed muligvis feil")
  }
  fylke <- substr(kommunenr, 1, 2)
  fylke
}

lage_fylke4(kommunenr = "03")
lage_fylke4(kommunenr = "301")
lage_fylke4(kommunenr = "0301")



#### lokal vs global ####
x <- 2
x

fx <- function(){
  x <- 3
  x
}

x
fx()
x




#### Kombinere funksjoner med tidyverse ####

# Datasett med komma skilletegn
library(tidyverse)
inntektdata <- read_csv("H:/R/r-grunnkurs/data/kommunedata.csv")
View(inntektdata)

# lage datasett med kommunenivå
inntektdata <- inntektdata %>%
  filter(nchar(region) == 4)


lage_fylke <- function(kommunenr){
  substr(kommunenr, 1, 2)
}

# lage variabel for fylke
inntektdata <- inntektdata %>%
  mutate(fylke = lage_fylke(region))
View(inntektdata)


