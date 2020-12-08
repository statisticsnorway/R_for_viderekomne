# R for viderekomne
#### DAG 2: Øvelse 3 ####

# 1) Lage en funksjon med en parameter. Parameter skal være koden for byggetype. 
# Funksjonen skal returnere "Enebolig" om koden er 111, ellers skal det returnere "Annen"
# Bruk ifelse (ikke if og else) så at det kan ta imot vektorer






# 2) Kalle funksjon for koden 111 og koden 133 for å sjekke at funksjonenen returnere riktig svar
# Fungere det også for vektorer? dvs. c(111, 133)





# 3) Les inn data for boligbygg (bolig.csv) fra 2019 med funksjon read_csv2 (tidyverse). 
# Kjør funksjonen din på variabel byggetype
# Bakgrunn: Data er fra Statbank 05940 for areal fullfort bygd per region etter bygningstype for 2019





# 4) Kjør funksjon for å lage en ny variabel i datasett (Gjerne bruke tidyverse med pipelines)





# 5) Lage en ny funksjon med to parameter. Det første parameter skal være det samme som før.
# Den andre paremater skal ta "en" eller "nb". Denne skal styre hvilken språk skal returners. 
# Skriv den nye funksjonen for å returnere engelsk "Detached house" eller "Other house" hvis "en" er spesifisert






# 6) Test funksjonen på verdiene 111 og 113 med spesifisering av engelsk. 
# Fungerer det også for å lage en ny variabel i bolig datasett ? 






# 7) Lage den samme funksjonen med sette en default verdi for språk til "nb". 







# 8) Skriv den samme funksjonen men legg til en varsling/stopp om en verdi som ikke er "en" eller "nb" er skrevet




















##################################################################################
#### DAG 2 - øvelse 4 ####

# 1) Søk i klassR for en klassifikasjon for bygningstype
# Hint: bruk funksjonen SearchKlass()




# 2) Hent ut standard for bygningstype (klass = 31)
# Hint: bruk funksjonen GetKlass()





# 3) Lage en ny variabel med navn av byggetype
# Hint: bruk ApplyKlass()
# Hint: Du er fritt å bruke det direkte med $ for å lage ny variabel eller som en del av pipline






# 4) Lage en variabel med engelsk navn for byggetype
# Hint: bruk lang = "en" parameter i ApplyKlass()






# 5) Lage en RMarkdown dokument om boligbygg 
# Prøv å legge inn en tabell med kable
# Lage en figur: for eksemepl søylediagram over total bruksareal fullførte i 2019 etter fylke 









