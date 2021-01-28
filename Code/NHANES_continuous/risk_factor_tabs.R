# Old Framingham
source("/Users/bryankim/Documents/NBER/Case Deaton/Code/NHANES_continuous/load_data.R")

## Continuous
temp = list(nhanes1999_2000,nhanes2001_2002,nhanes2003_2004,nhanes2005_2006,nhanes2007_2008,nhanes2009_2010,nhanes2011_2012,nhanes2013_2014,nhanes2015_2016,nhanes2017_2018)
#temp=list(nhanes1999_2000)

# ALL
lapply(temp, function(x) {print(weighted.mean(x$riagendr,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$ridageyr,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$hdl,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$lbxtc,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$asbp,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$curr_smq,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$isDiabetic,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$fpg_reg,x$wt))})

## NHANESII
nhanesII=read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/FRS/Old Framingham/NHANESII/nhanesII_frs_old.dta") %>% mutate(isDiabetic = ifelse(fpg_reg >= 126,1,0))
nhanesII = nhanesII[complete.cases(nhanesII[ , c("SEX","AGEYR_AT_INT","lbdhdd","lbxtc","asbp","curr_smq","fpg_reg")]),]
tempII = list(nhanesII)
lapply(tempII, function(x) {print(weighted.mean(x$SEX,x$wt))})
lapply(tempII, function(x) {print(weighted.mean(x$AGEYR_AT_INT,x$wt))})
lapply(tempII, function(x) {print(weighted.mean(x$lbdhdd,x$wt))})
lapply(tempII, function(x) {print(weighted.mean(x$lbxtc,x$wt))})
lapply(tempII, function(x) {print(weighted.mean(x$asbp,x$wt))})
lapply(tempII, function(x) {print(weighted.mean(x$curr_smq,x$wt))})
lapply(tempII, function(x) {print(weighted.mean(x$isDiabetic,x$wt))})
lapply(tempII, function(x) {print(weighted.mean(x$fpg_reg,x$wt))})

## NHANESIII
nhanesIIIP1 = read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/FRS/Old Framingham/NHANESIII/nhanesIIIP1_frs_old.dta") %>% mutate(isDiabetic = ifelse(fpg_reg >= 126,1,0))
nhanesIIIP2 = read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/FRS/Old Framingham/NHANESIII/nhanesIIIP2_frs_old.dta") %>% mutate(isDiabetic = ifelse(fpg_reg >= 126,1,0))
nhanesIIIP1 = nhanesIIIP1[complete.cases(nhanesIIIP1[ , c("HSSEX","HSAGEIR","hdl","lbxtc","asbp","curr_smq","fpg_reg")]),]
nhanesIIIP2 = nhanesIIIP2[complete.cases(nhanesIIIP2[ , c("HSSEX","HSAGEIR","hdl","lbxtc","asbp","curr_smq","fpg_reg")]),]
source("/Users/bryankim/Documents/NBER/Case Deaton/Code/NHANES II&III/create_wts_from_cleaned_old_nhanesIII.R")
tempIII = list(nhanesIIIP1,nhanesIIIP2)
lapply(tempIII, function(x) {print(weighted.mean(x$HSSEX,x$wt))})
lapply(tempIII, function(x) {print(weighted.mean(x$HSAGEIR,x$wt))})
lapply(tempIII, function(x) {print(weighted.mean(x$hdl,x$wt))})
lapply(tempIII, function(x) {print(weighted.mean(x$lbxtc,x$wt))})
lapply(tempIII, function(x) {print(weighted.mean(x$asbp,x$wt))})
lapply(tempIII, function(x) {print(weighted.mean(x$curr_smq,x$wt))})
lapply(tempIII, function(x) {print(weighted.mean(x$isDiabetic,x$wt))})
lapply(tempIII, function(x) {print(weighted.mean(x$fpg_reg,x$wt))})


# ATP3 
nhanes1999_2000_atp3 = read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/FRS/ATP3/nhanes_1999_2000_frs_atp3.dta") %>% filter(ridageyr <= 74)
table(nhanes1999_2000_atp3$treated)

temp=list(nhanes1999_2000_atp3)

# ALL
lapply(temp, function(x) {print(weighted.mean(x$riagendr,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$ridageyr,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$hdl,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$lbxtc,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$asbp,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$curr_smq,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$treated,x$wt))})


# Pooled Cohorty 
source("/Users/bryankim/Documents/NBER/Case Deaton/Code/NHANES_continuous/load_data.R")

nhanes1999_2000= nhanes1999_2000 %>% filter((race %in% c(1,2)))
nhanes2001_2002= nhanes2001_2002 %>% filter((race %in% c(1,2)))
nhanes2003_2004= nhanes2003_2004 %>% filter((race %in% c(1,2)))
nhanes2005_2006= nhanes2005_2006 %>% filter((race %in% c(3,4))) %>% mutate(race=ifelse(race==3,1,2))
nhanes2007_2008= nhanes2007_2008 %>% filter((race %in% c(3,4))) %>% mutate(race=ifelse(race==3,1,2))
nhanes2009_2010= nhanes2009_2010 %>% filter((race %in% c(3,4))) %>% mutate(race=ifelse(race==3,1,2))
nhanes2011_2012= nhanes2011_2012 %>% filter((race %in% c(3,4))) %>% mutate(race=ifelse(race==3,1,2))
nhanes2013_2014= nhanes2013_2014 %>% filter((race %in% c(3,4))) %>% mutate(race=ifelse(race==3,1,2))
nhanes2015_2016= nhanes2015_2016 %>% filter((race %in% c(3,4))) %>% mutate(race=ifelse(race==3,1,2))
nhanes2017_2018= nhanes2017_2018 %>% filter((race %in% c(3,4))) %>% mutate(race=ifelse(race==3,1,2))

temp = list(nhanes1999_2000,nhanes2001_2002,nhanes2003_2004,nhanes2005_2006,nhanes2007_2008,nhanes2009_2010,nhanes2011_2012,nhanes2013_2014,nhanes2015_2016,nhanes2017_2018)

# ALL
lapply(temp, function(x) {print(weighted.mean(x$riagendr,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$ridageyr,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$hdl,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$lbxtc,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$asbp,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$curr_smq,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$isDiabetic,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$fpg_reg,x$wt))})



