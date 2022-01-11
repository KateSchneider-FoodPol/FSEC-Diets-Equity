########################################
# NHANES HEI Scores for FSEC Diet Paper
# Last updated: 12/16/2021
# User: ALB
#######################################

#Alexa's Library
setwd("Documents/Hopkins/Fanzo/Papers/FSEC Diet Paper/")

#Libraries
  #devtools::install_github("timfolsom/hei")
  #library(hei) - https://github.com/timfolsom/hei - old package used to calculate old HEI 
    #Adapted code from this package to calculate HEI 2015 with NHANES Data from 2017/2018
  
  library(tidyverse)
  library(janitor)
  library(haven)

######################################################
#Updating diet data function
  #Code adapted from HEI package https://github.com/timfolsom/hei. 
  #Original Code only went up to 2013/2014
  #nhanes 2017/2018 data is yearchoice==J in the datasets
get_diet2 <- function(year, day) {
  
  yearchoices <- c("D" = "2005/2006",
                   "E"= "2007/2008",
                   "F"="2009/2010",
                   "G"= "2011/2012",
                   "H" = "2013/2014",
                   "J" = "2017/2018")
 
  try(if(!year %in% yearchoices)
    stop("must use valid year choice, see ?get_diet for valid choices",
         call. = FALSE))
  
  daychoices <- c("DR1"="first", "DR2"="second","both")
  
  try(if(!day %in% daychoices)
    stop("must use valid day choice, see ?get_diet for valid choices",
         call. = FALSE))
  
  if(day != "both") {
    
    dbname <- paste0(names(which(daychoices==day)),
                     "TOT_",
                     names(which(yearchoices==year)))
    
    dat <- nhanesA::nhanes(dbname)
    
    names(dat) <- gsub("DR[1-9]", "", names(dat))
    
    keepers <- c("SEQN",
                 "TKCAL",
                 "TSFAT",
                 "TALCO",
                 "TSODI",
                 "TMFAT",
                 "TPFAT")
    
    dat <- dat[,names(dat) %in% keepers]
    
    # have to convert each column to numeric to remove labelling from NHANES
    dat <- data.frame(apply(dat, 2, as.numeric))
    
  } else {
    
    dbname1 <- paste0(names(daychoices[1]),
                      "TOT_",
                      names(which(yearchoices==year))
    )
    
    dat1 <- nhanesA::nhanes(dbname1)
    
    names(dat1) <- gsub("DR[1-9]", "", names(dat1))
    
    keepers <- c("SEQN",
                 "TKCAL",
                 "TSFAT",
                 "TALCO",
                 "TSODI",
                 "TMFAT",
                 "TPFAT")
    
    dat1 <- dat1[,names(dat1) %in% keepers]
    
    dbname2 <- paste0(names(daychoices[2]),
                      "TOT_",
                      names(which(yearchoices==year))
    )
    
    dat2 <- nhanesA::nhanes(dbname2)
    
    names(dat2) <- gsub("DR[1-9]", "", names(dat2))
    
    keepers <- c("SEQN", "TKCAL", "TSFAT", "TALCO", "TSODI", "TMFAT", "TPFAT")
    
    dat2 <- dat2[,names(dat2) %in% keepers]
    
    dat <- rbind(dat1,dat2)
    
    # have to convert each column to numeric to remove labelling from NHANES
    dat <- data.frame(apply(dat, 2, as.numeric))
    
    dat <- dat[!is.na(dat$TSFAT),]
    
    dat <- stats::aggregate(. ~ SEQN, data = dat, FUN = "mean")
    
  }
  
  dat
  
}

##################################################################
#Updated Demographic data
  #Code adapted from HEI package https://github.com/timfolsom/hei. 
  #Original Code only went up to 2013/2014
  #nhanes 2017/2018 data is yearchoice==J in the datasets
get_demo2 <- function(year) {

yearchoices <- c("D" = "2005/2006",
                 "E" = "2007/2008",
                 "F" = "2009/2010",
                 "G" = "2011/2012",
                 "H" = "2013/2014",
                 "J" = "2017/2018")

try(if(!year %in% yearchoices)
  stop("must use valid year choice, see ?get_demo for valid choices",
       call. = FALSE))

dbname <- paste0("DEMO_", names(which(yearchoices==year)))

dat <- nhanesA::nhanes(dbname)

keepers <- c("SEQN", "SDDSRVYR")
dat <- dat[,names(dat) %in% keepers]

# have to convert each column to numeric to remove labeling from NHANES
dat <- data.frame(apply(dat, 2, as.numeric))

dat

}

############################################################################
#FPED Datasets 2017/2018 - from USDA Website - Needed SAS to execute .sas.ex macros
  #Code Adapted from SAS - https://epi.grants.cancer.gov/hei/sas-code.html
    #"NHANES-2011-2012-FPED-Per Person HEI-2015 [ZIP - 44 KB]"

fped1 <- read_sas("fped_dr1tot_1718.sas7bdat")
fped2 <- read_sas("fped_dr2tot_1718.sas7bdat")

#averaging across participant
fped1 <- fped1 %>% 
  mutate(DAYREC=1) %>%
  rename( F_CITMLB=DR1T_F_CITMLB,
          F_OTHER=DR1T_F_OTHER,
          PF_MPS_TOTAL=DR1T_PF_MPS_TOTAL,
          PF_EGGS=DR1T_PF_EGGS,
          PF_NUTSDS=DR1T_PF_NUTSDS,
          PF_SOY=DR1T_PF_SOY,
          PF_SEAFD_HI=DR1T_PF_SEAFD_HI,
          PF_SEAFD_LOW=DR1T_PF_SEAFD_LOW,
          ADD_SUGARS=DR1T_ADD_SUGARS,
          SOLID_FATS=DR1T_SOLID_FATS,
          V_TOTAL=DR1T_V_TOTAL,
          V_DRKGR=DR1T_V_DRKGR,
          V_LEGUMES=DR1T_V_LEGUMES,
          PF_LEGUMES=DR1T_PF_LEGUMES,
          F_TOTAL=DR1T_F_TOTAL,
          G_WHOLE=DR1T_G_WHOLE,
          D_TOTAL=DR1T_D_TOTAL,
          G_REFINED=DR1T_G_REFINED) %>%
  select(SEQN, RIDAGEYR, DAYREC, F_CITMLB, F_OTHER, PF_MPS_TOTAL, PF_EGGS,
         PF_NUTSDS, PF_SOY, PF_SEAFD_HI, PF_SEAFD_LOW, ADD_SUGARS, SOLID_FATS,
         V_TOTAL, V_DRKGR, V_LEGUMES, PF_LEGUMES, F_TOTAL, G_WHOLE, D_TOTAL, G_REFINED)

fped2 <- fped2 %>% 
  mutate(DAYREC=2) %>%
  rename( F_CITMLB=DR2T_F_CITMLB,
          F_OTHER=DR2T_F_OTHER,
          PF_MPS_TOTAL=DR2T_PF_MPS_TOTAL,
          PF_EGGS=DR2T_PF_EGGS,
          PF_NUTSDS=DR2T_PF_NUTSDS,
          PF_SOY=DR2T_PF_SOY,
          PF_SEAFD_HI=DR2T_PF_SEAFD_HI,
          PF_SEAFD_LOW=DR2T_PF_SEAFD_LOW,
          ADD_SUGARS=DR2T_ADD_SUGARS,
          SOLID_FATS=DR2T_SOLID_FATS,
          V_TOTAL=DR2T_V_TOTAL,
          V_DRKGR=DR2T_V_DRKGR,
          V_LEGUMES=DR2T_V_LEGUMES,
          PF_LEGUMES=DR2T_PF_LEGUMES,
          F_TOTAL=DR2T_F_TOTAL,
          G_WHOLE=DR2T_G_WHOLE,
          D_TOTAL=DR2T_D_TOTAL,
          G_REFINED=DR2T_G_REFINED) %>%
  select(SEQN, RIDAGEYR, DAYREC, F_CITMLB, F_OTHER, PF_MPS_TOTAL, PF_EGGS,
         PF_NUTSDS, PF_SOY, PF_SEAFD_HI, PF_SEAFD_LOW, ADD_SUGARS, SOLID_FATS,
         V_TOTAL, V_DRKGR, V_LEGUMES, PF_LEGUMES, F_TOTAL, G_WHOLE, D_TOTAL, G_REFINED)

#Combining Day 1 and 2
fped <- rbind(fped1,fped2)
  #getting the average
  fped1718 <- stats::aggregate(. ~ SEQN, data = fped, FUN = "mean") 
    #observations=7495 - drop in observation appears to be due to missing values

######################################################################
#using diet and demo functions 
diet1718<-get_diet2("2017/2018","both")
demo1718<-get_demo2("2017/2018")

####################################################################
#Merging Datasets

#FPED and Diet
NHANES<-left_join(fped1718, diet1718, by=("SEQN"))

#NHANES + Demographic
NHANES<-left_join(NHANES, demo1718, by=("SEQN"))

####################################################################
#Calculating HEI Scores
  #Code adopted/modified from HEI package and CDC HEI Examples (cited above)
dat<- NHANES %>%
  mutate(
  FWHOLEFRT=F_CITMLB+F_OTHER, 
  MONOPOLY=TMFAT+TPFAT,
  VTOTALLEG=V_TOTAL+V_LEGUMES,
  VDRKGRLEG=V_DRKGR+V_LEGUMES,
  PFALLPROTLEG=PF_MPS_TOTAL+PF_EGGS+PF_NUTSDS+PF_SOY+PF_LEGUMES, 
  PFSEAPLANTLEG=PF_SEAFD_HI+PF_SEAFD_LOW+PF_NUTSDS+PF_SOY+PF_LEGUMES)

#Calculating HEI Scores
# heiveg
# total veggies
dat$vegden <- dat$VTOTALLEG / (dat$TKCAL/1000)
dat$heiveg <- 5*(dat$vegden/1.1)
dat$heiveg <- ifelse(dat$heiveg > 5, 5, dat$heiveg)

# heibngrn
# dark green veg + legumes
dat$bngrden <- dat$VDRKGRLEG / (dat$TKCAL/1000)
dat$heibngrn <- 5*(dat$bngrden/0.2)
dat$heibngrn  <- ifelse(dat$heibngrn  > 5, 5, dat$heibngrn)

# heitotfr
# total fruit
dat$frtden <- dat$F_TOTAL/(dat$TKCAL/1000)
dat$heitotfrt <- 5*(dat$frtden/0.8)
dat$heitotfrt <- ifelse(dat$heitotfrt > 5, 5, dat$heitotfrt)

# heiwholefrt
# whole fruit
dat$wholefrtden <- dat$FWHOLEFRT/(dat$TKCAL/1000)
dat$heiwholefrt <- 5*(dat$wholefrtden/0.4)
dat$heiwholefrt <- ifelse(dat$heiwholefrt > 5, 5, dat$heiwholefrt)

# heiwholegrain
# whole grain
dat$wholegrainden <- dat$G_WHOLE/(dat$TKCAL/1000)
dat$heiwholegrain <- 10*(dat$wholegrainden/1.5)
dat$heiwholegrain <- ifelse(dat$heiwholegrain > 10, 10, dat$heiwholegrain)

# heidairy
# dairy
dat$dairyden <- dat$D_TOTAL/(dat$TKCAL/1000)
dat$heidairy <- 10*(dat$dairyden/1.3)
dat$heidairy <- ifelse(dat$heidairy > 10, 10, dat$heidairy)

# heitotpro
# total protein
dat$totproden <- dat$PFALLPROTLEG/(dat$TKCAL/1000)
dat$heitotpro <- 5*(dat$totproden/2.5)
dat$heitotpro <- ifelse(dat$heitotpro > 5, 5, dat$heitotpro)

# heiseaplantpro
# seaplant protein
dat$seaplantden <- dat$PFSEAPLANTLEG/(dat$TKCAL/1000)
dat$heiseaplantpro <- 5*(dat$seaplantden/0.8)
dat$heiseaplantpro <- ifelse(dat$heiseaplantpro > 5, 5, dat$heiseaplantpro)

# heifattyacid
# fatty acid
dat$faratio <- ifelse(dat$TSFAT > 0,
                      dat$MONOPOLY / dat$TSFAT,
                      0)

dat$heifattyacid <- ifelse(dat$TSFAT == 0 & dat$MONOPOLY == 0,
                           10,
                           NA)

dat$heifattyacid <- ifelse(dat$TSFAT == 0 & dat$MONOPOLY > 0,
                           10,
                           dat$heifattyacid)

dat$heifattyacid <- ifelse(dat$faratio >= 2.5,
                           10,
                           dat$heifattyacid)

dat$heifattyacid <- ifelse(dat$faratio <= 1.2,
                           0,
                           dat$heifattyacid)

dat$heifattyacid <- ifelse(is.na(dat$heifattyacid),
                           10*((dat$faratio-1.2)/(2.5-1.2)),
                           dat$heifattyacid)
# heisodi
# sodium
dat$sodden <- dat$TSODI / dat$TKCAL

dat$heisodi <- ifelse(dat$sodden <= 1.1,
                      10,
                      NA)
dat$heisodi <- ifelse(dat$sodden >= 2.0,
                      0,
                      dat$heisodi)
dat$heisodi <- ifelse(is.na(dat$heisodi),
                      10 - (10*(dat$sodden - 1.1)/(2.0-1.1)),
                      dat$heisodi)

# heirefgrain
# refined grain
dat$refgrainnden <- dat$G_REFINED / (dat$TKCAL/1000)

dat$heirefgrain <- ifelse(dat$refgrainnden <= 1.8,
                          10,
                          NA)
dat$heirefgrain <- ifelse(dat$refgrainnden >= 4.3,
                          0,
                          dat$heirefgrain)

dat$heirefgrain <- ifelse(is.na(dat$heirefgrain),
                          10 - (10*(dat$refgrainnden - 1.8)/(4.3-1.8)),
                          dat$heirefgrain)

#Sat Fat
dat$satfat_perc <- 100*(dat$TSFAT*9/dat$TKCAL)

dat$heisfat <- ifelse(dat$satfat_perc <= 8,
                          10,
                          NA)
dat$heisfat <- ifelse(dat$satfat_perc>= 16,
                          0,
                          dat$heisfat)

dat$heisfat <- ifelse(is.na(dat$heisfat),
                          10 - (10*(dat$satfat_perc - 8)/(16-8)),
                          dat$heisfat)

#Added Sugars
dat$addsug_perc <- 100*(dat$ADD_SUGARS*16/dat$TKCAL)

dat$heiaddsug <- ifelse(dat$addsug_perc <= 6.5,
                      10,
                      NA)
dat$heiaddsug <- ifelse(dat$addsug_perc>= 26,
                      0,
                      dat$heiaddsug)

dat$heiaddsug <- ifelse(is.na(dat$heiaddsug),
                      10 - (10*(dat$addsug_perc - 6.5)/(26-6.5)),
                      dat$heiaddsug)

#Final Score
dat$HEI <- dat$heiveg + dat$heibngrn + dat$heitotfrt + dat$heiwholefrt + dat$heiwholegrain + dat$heidairy +
           dat$heitotpro + dat$heiseaplantpro + dat$heifattyacid + dat$heisodi + dat$heirefgrain + 
           dat$heisfat + dat$heiaddsug

#Excluding children <2 yrs of age (HEI not validated for that population)
dat<-dat %>% filter(RIDAGEYR>2)
summary(dat$HEI)

