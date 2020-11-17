# Eksempel kode til R for viderekomne kurs
# DAG 1: Del 1


#### Vektorer og indeksering ####
sted <- c("Oslo", "Kongsvinger", "Moss")
alder <- c(36, 39, 72)

alder * 2
alder == 39
39 %in% alder

# indeksing
sted[1]
sted[-1]

# sekvenser
1:5
c(1:5, 7, 9)
seq(1, 5)
seq(1, 5, 2)
seq(1, 5, 0.5)

sted[2:3]
sted[c(1, 3)]
sted[c(2, 1, 3)]

# alle objekter er vektorer
nace <- "01.233"
nace[1]





#### Endre elementer ####
sted
sted[3] <- "Halden"
sted

alder
alder[2:3] <- c(40, 73)
alder

alder[1] <- "tretti-seks"
alder
str(alder)





#### match #####
match("Oslo", sted)
match(40, alder)

match(sted, c("Kongsvinger", "Oslo", "Halden"))





#### lister ####
kommune_list <- list(sted = c("Oslo", "Kongsvinger", "Halden"), 
                     snitt_lonn = c(636, 504, 552), 
                     antall_lonnstakere = c(467400, 8300, 12600),
                     nivå = "Kommune")
kommune_list

# Ta ut et vektor
kommune_list$snitt_lonn
kommune_list[["snitt_lonn"]] # Alternativ
kommune_list[[2]]            # Alternativ


# Ta ut et element
kommune_list$snitt_lonn[2] # snittlønn for Kongsvinger
str(kommune_list)





#### Datasett ####
kommune_data <- data.frame(sted = c("Oslo", "Kongsvinger", "Halden"), 
                          snitt_lonn = c(636, 504, 552), 
                          antall_lonnstakere = c(467400, 8300, 12600))

# Ser på 
kommune_data$sted

# Ser på et element
kommune_data$snitt_lonn[2] # snittlønn for Kongsvinger

# Datasett funkjsoner
nrow(kommune_data)
ncol(kommune_data)
names(kommune_data)
summary(kommune_data)
head(kommune_data) # første 5 rader
tail(kommune_data) # siste 5 rader


# tibble datasett
library(tidyverse)
as_tibble(kommune_data)














###################################################################################
# DAG 1 - Del 2

#### tilfeldig trekking ####

# sample
sample(sted, 1)
sample(1:20, 2)

# tilfeldig tall
runif(5)
runif(5)

# set seed
set.seed(32367)
runif(5)

set.seed(32367)
runif(5)



  
  
  

#### sortering ####
sted
sort(sted)
sort(sted, decreasing = T)

#  rekkefølge
alder
order(sted)

# sortering med match
onsket_rekke <- c("Kongsvinger", "Halden", "Oslo")
m <- match(onsket_rekke, kommune_data$sted)
m
kommune_data$snitt_lonn[m]
kommune_data[m ,]


# Kjøretid for match vs join
# lage syntetiske data
n <- 500
dataA <- data.frame(ID = 1:n, x = runif(n))
dataB <- data.frame(ID = 1:n, y = runif(n))
dataB <- dataB[order(runif(n)),]

# ta kjøretid for join
s <- Sys.time()
koblet <- full_join(dataA, dataB, by = "ID")
Sys.time() - s

# ta kjøretid for kobling med indeks
s <- Sys.time()
m <- match(dataA$ID, dataB$ID)
dataA$y <- dataB$y[m]
Sys.time() - s




#### if og else ####
if ("Oslo" %in% sted){
  print("Hovedstaden er i vektoren")
}

if ("Rygge" %in% sted){
  print("Rygge er i vektoren")
}

if ("Kongsvinger" %in% sted){
  print("Kongsvinger er i vektoren")
} else {
  print("Kongsvinger er ikke i vektoren")
}




#### for loops ####
for (i in 1:5){
  print("Dette er en loop")
}

for (i in 1:5){
  print(i)
}

for (i in 1:3){
  print(i)
  print(sted[i])
}

for (i in sted){
  print(i)
}




#### while loops ####
n <- 1
while (n < 10){
  print(n)
  n <- n + 1
}
n

# ikke bestemt antall ganger
n <- 1
while (n < 10){
  print(n)
  n <- n + runif(1)
}
n





######## old...

#### sortering ####
library(tidyverse)
inntektdata <- read_csv("H:/R/r-grunnkurs/data/kommunedata.csv")
View(inntektdata)

sort(inntektdata$bruttoinnt)

library(PxWebApiData)
bolig <- ApiData(06266, Region = T, Tid = "2020")$dataset
bolig <- bolig %>%
  filter(nchar(Region) == 4, value > 0)

brutto_sorted <- sort(inntektdata$bruttoinnt)
head(brutto_sorted)
tail(brutto_sorted)

brutto_sorted <- sort(inntektdata$bruttoinnt, decreasing = T)
head(brutto_sorted)
tail(brutto_sorted)

brutto_order <- order(inntektdata$bruttoinnt)
head(brutto_order)


SearchKlass("bygningstype")
byggtype <- GetKlass(31)

bolig <- ApiData(05940, Region = T, Byggeareal = T, ContentsCode = "BruksarealFullfort",
                   Tid = "2019")$dataset


###################################################################################






