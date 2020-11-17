/* Eksempel kode for kjøring av R i SAS */

/* Lage datasett for testing */

data kommune;
length kommunenavn $12;
input kommune $ kommunenavn $ aar populasjon;
datalines;
0301 Oslo 2018 673469
0301 Oslo 2019 681071
0301 Oslo 2020 693494
3401 Kongsvinger 2018 17934
3401 Kongsvinger 2019 17823
3401 Kongsvinger 2020 17829
;
run;


/* Kjøre R med PROC IML */
Proc IML;
run ExportDataSetToR ("WORK.kommune", "kommunedata");

submit / R;
library(tidyverse)

# Vise en tabell for 2018
kommune2018 <- kommunedata %>%
	filter(aar == "2018")
kommune2018

# lagre data for Kongsvinger
kongsvinger <- kommunedata %>%
	filter(kommunenavn == "Kongsvinger")

endsubmit;

run ImportDataSetFromR("WORK.kongsvinger","kongsvinger");

quit;