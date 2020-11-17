# Løsningsforslag for R for viderekomne
#### DAG 2: Øvelse 3 ####

# 1) Lage en funksjon med en parameter. Parameter skal være koden for byggetype. 
# Funksjonen skal returnere "Enebolig" om koden er 111, ellers skal det returnere "Annen"
# Bruk ifelse (ikke if og else) så at det kan ta imot vektorer
bygg_fn <- function(byggkode){
  bygge_beskrivelse <- ifelse(byggkode == 111, "Enebolig", "Annen")
  bygge_beskrivelse
}


# 2) Kalle funksjon for koden 111 og koden 133 for å sjekke at funksjonenen returnere riktig svar
# Fungere det også for vektorer? dvs. c(111, 133)
bygg_fn(111)
bygg_fn(133)
bygg_fn(c(111, 133))


# 3) Les inn data for boligbygg (bolig.csv) fra 2019 med funksjon read_csv2 (tidyverse). 
# Kjør funksjonen din på variabel byggetype
# Bakgrunn: Data er fra Statbank 05940 for areal fullfort bygd per region etter bygningstype for 2019
bolig <- read_csv2("./data/bolig.csv")
bygg_fn(bolig$byggetype)



# 4) Kjør funksjon for å lage en ny variabel i datasett (Gjerne bruke tidyverse med pipelines)
bolig <- bolig %>%
  mutate(byggtype_enebolig = bygg_fn(byggetype))



# 5) Lage en ny funksjon med to parameter. Det første parameter skal være det samme som før.
# Den andre paremater skal ta "en" eller "nb". Denne skal styre hvilken språk skal returners. 
# Skriv den nye funksjonen for å returnere engelsk "Detached house" eller "Other house" hvis "en" er spesifisert
bygg_fn2 <- function(byggkode, lang){
  if (lang == "nb"){
    bygge_beskrivelse <- ifelse(byggkode == 111, "Enebolig", "Annen")
  }
  if (lang == "en"){
    bygge_beskrivelse <- ifelse(byggkode == 111, "Detached house", "Other")
  }
  bygge_beskrivelse
}


# 6) Test funksjonen på verdiene 111 og 113 med spesifisering av engelsk. 
# Fungerer det også for å lage en ny variabel i bolig datasett ? 
bygg_fn2(111, lang = "en")
bygg_fn2(113, lang = "en")

bolig <- bolig %>%
  mutate(byggtype_engelsk = bygg_fn2(byggetype, "en"))
View(bolig)


# 7) Lage den samme funksjonen med sette en default verdi for språk til "nb". 
bygg_fn3 <- function(byggkode, lang = "nb"){
  if (lang == "nb"){
    bygge_beskrivelse <- ifelse(byggkode == 111, "Enebolig", "Annen")
  }
  if (lang == "en"){
    bygge_beskrivelse <- ifelse(byggkode == 111, "Detached house", "Other")
  }
  bygge_beskrivelse
}
bygg_fn3(111)


# 8) Skriv den samme funksjonen men legg til en varsling/stopp om en verdi som ikke er "en" eller "nb" er skrevet
bygg_fn4 <- function(byggkode, lang = "nb"){
  if (lang == "nb"){
    bygge_beskrivelse <- ifelse(byggkode == 111, "Enebolig", "Annen")
  } else if (lang == "en"){
    bygge_beskrivelse <- ifelse(byggkode == 111, "Detached house", "Other")
  } else {
    stop("lang must be either 'en' or 'nb'")
  }
  bygge_beskrivelse
}
bygg_fn4(111, lang = "nn")











##################################################################################
#### DAG 2 - øvelse 4 ####

# 1) Søk i klassR for en klassifikasjon for bygningstype
# Hint: bruk funksjonen SearchKlass()
library(klassR)
SearchKlass("bygningstype")


# 2) Hent ut standard for bygningstype (klass = 31)
# Hint: bruk funksjonen GetKlass()
klass_bygningstype <- GetKlass(31)



# 3) Lage en ny variabel med navn av byggetype
# Hint: bruk ApplyKlass()
# Hint: Du er fritt å bruke det direkte med $ for å lage ny variabel eller som en del av pipline
bolig$byggetype_navn <- ApplyKlass(bolig$byggetype, 31)

bolig <- bolig %>%
  mutate(byggetype_navn = ApplyKlass(byggetype, 31))


# 4) Lage en variabel med engelsk navn for byggetype
# Hint: bruk lang = "en" parameter i ApplyKlass()
bolig <- bolig %>%
  mutate(byggetype_engelsk = ApplyKlass(byggetype, 31, lang = "en"))



# 5) Lage en RMarkdown dokument om boligbygg 
# Prøv å legge inn en tabell
# Lage en figur: for eksemepl søylediagram over total bruksareal fullførte i 2019 etter fylke 









###################### EKSTRA ################################################## 
###################### KOde for å lage bolig datasett ##########################
bolig <- ApiData(05940, Region = T, Byggeareal = T, ContentsCode = "BruksarealFullfort",
                 Tid = "2019")$dataset

bolig <- bolig %>%
  select(Region, Byggeareal, value) %>%
  filter(nchar(Region) == 2) %>%
  rename(fylke = Region, 
         byggetype = Byggeareal,
         byggeareal = value)

bolig <- bolig %>%
  filter(!fylke %in% c(30, 34, 38, 42,46, 13, 16, 17, 54, 21, 22, 23, 25, 26, 88, 99))

