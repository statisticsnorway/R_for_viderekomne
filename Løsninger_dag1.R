# R for viderekomne
#### DAG 1: Øvelse 1 ####

# Bruk følgende vektor til øvelsene:
byggtype <- c("Enebolig", "Våningshus", "Rekkehus", "Terrassehus")

# 1) Bruk indeks for å plukke ut elementene 3 og 4 i vektoren
byggtype[c(3, 4)]


# 2) Bruk indeks for å plukke ut alle bortsett fra element 4
byggtype[-4]
byggtype[1:3]

# 3) bruk match for å finne indeks til "Rekkehus" i vektoren
match("Rekkehus", byggtype)



# 4) Endre "Rekkehus" i vektoren til "Andre bolig"
byggtype["Rekkehus"] <- "Andre bolig"
byggtype[3] <- "Andre bolig"





# 5) Lage en liste med vektoren byggtype (som brukt ovenfor) og bygningskodene 111, 113, 159, 135
bygge <- list(byggtype = byggtype, byggkode = c(111, 113, 159, 135))



# 6) plukk ut kode for element 3 i byggkode fra listen du laget
bygge$byggkode[3]



# 7) Endre listen til en tibble (datasett type i tidyverse)
library(tidyverse)
bygge <- as_tibble(bygge)
bygge


# 8) Bruk indekser for å plukke ut element som er på rad 2 i kolonn 1
bygge$byggtype[2]
bygge[2, 1]













#########################################################################################
#### DAG 1: Øvelse 2 ####

# 1) Trekke en tilfeldig byggetype blant de fire i vektoren som du brukt i øvelse 1.
sample(byggtype, 1)



# 2) Kjøre det samme tilfeldig trekking 3 ganger for å sjekke at du får forkjellige svar
sample(byggtype, 1)
sample(byggtype, 1)
sample(byggtype, 1)


# 3) Bruk set.seed() og kjør tilfeldig trekking 3 ganger for å sjekke at du får samme svar
set.seed(34376)
sample(byggtype, 1)


# 4) Lage en vektor av lengde 4 med tilfeldig tall mellom 0 og 1.
tilf <- runif(4)
tilf


# 5) Sortere byggtype vektoren etter disse tilfeldige tall (stigende)
# Hint: Bruk order og indeks
byggtype[order(tilf)]



# 6) Bruk if for å teste om "Enebolig" er inn i vektoren byggtype. 
# Hvis det er, skriv ut melding "Enebolig er i vektoren". Hvis ikke, skriv en annen melding
if ("Enebolig" %in% byggtype){
  print("Enebolig er i vektoren")
} else {
  print("Enebolig mangle fra vektoren")
}


# 7) Lage en for-loop for å gå gjennom elementene i byggetype vektoren. Hvis elementen er "Enebolig", skriv ut
#   "Dette er en enebolig". Hvis elementen ikke er "Enebolig" skriv ut en alternativ melding.  
for (b in byggtype){
  if (b == "Enebolig"){
    print("Dette er en enebolig")
  } else {
    print("Detter er ikke en enebolig")
  }
}



  
