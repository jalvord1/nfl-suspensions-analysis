# using FiveThirtyEight NFL-Suspensions data

# loading data ------------------------------------------------------------

# loading libraries
library(fivethirtyeight)
library(ggplot2)
library(dplyr)
library(readr)
library(mosaic)
library(data.table)

# loading the data
data("nfl_suspensions")

# head of data
head(nfl_suspensions)

# making a dt
nfl_suspensions_dt <- data.table(nfl_suspensions)

# categories/descriptions
nfl_suspensions_dt[, unique(category)]
nfl_suspensions_dt[, unique(description)]

# formatting --------------------------------------------------------------

# grouping into better description categories
nfl_suspensions_dt[description %chin% c("Marijuana-related", "Cocaine-related", 'Found with dried urine and "The Original Whizzinator"', 
                                      'Alleged "non-human" urine in system', "MDMA", "Alcohol-related"), Description_Grouped := "Substance Abuse"]
nfl_suspensions_dt[description %chin% c("Gambling-related"), Description_Grouped := "Gambling"]
nfl_suspensions_dt[description %chin% c("Domestic violence", "Sexual assault", "Simple assault for spitting drink in a woman's face", 
                                        "Arrest, misdemeanour assault for pointing gun at stripper"), Description_Grouped := "Crimes Against Women"]
nfl_suspensions_dt[description %chin% c("Arrest, felony possession of codeine", "Multiple arrests", "Arrest, possession of weapon", 
                                        "DUI arrest, multiple", "DUI arrest, drugs", "Arrest, possession of weapon and marijuana", 
                                        "Accused of disorderly conduct, resisting arrest", "DUI arrest", "Arrest, Marijuana-related", 
                                        "Accused of battery and resisting arrest", "DUI arrest, possession of marijuana", "Felony arrest charges", 
                                        "Simple battery, resisting arrest", "DUI (acquitted)", "DUI manslaughter", "Reckless driving", "Assault", 
                                        "Misdemeanour assault", "Dogfighting", "Arrest, cocaine possession", "Reckless driving", 
                                        "Child endangerment", "Mulitple arrests", "DUI, marijuana-related", "Misdemeanour gun charge"), Description_Grouped := "Arrested"]
nfl_suspensions_dt[category %chin% c("PEDs", "PEDs, repeated offense"), Description_Grouped := "PEDs"]
nfl_suspensions_dt[category %chin% c("Substance abuse, repeated offense", "Substance abuse"), Description_Grouped := "Substance Abuse"]
nfl_suspensions_dt[description %in% c("Stomping on player", "Ripping off opponent's helmet", "Illegal hit", 
                                      "Head-butt", "Helmet-to-helmet hit"), Description_Grouped := "Game Violence"]
nfl_suspensions_dt[is.na(description), Description_Grouped := NA]
nfl_suspensions_dt[is.na(Description_Grouped), Description_Grouped := "Other"]

# checking groups
table(nfl_suspensions_dt$description, nfl_suspensions_dt$Description_Grouped)







