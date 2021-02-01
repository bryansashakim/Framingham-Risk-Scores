# Old Framingham

## NHANES II
temp=list(nhanesII)
# ALL
lapply(temp, function(x) {print(weighted.mean(x$sex,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$age,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$hdl,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$lbxtc,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$asbp,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$curr_smq,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$isDiabetic,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$fpg,x$wt))})

## NHANES III
temp=list(nhanesIIIP1)
# ALL
lapply(temp, function(x) {print(weighted.mean(x$sex,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$age,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$hdl,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$lbxtc,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$asbp,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$curr_smq,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$isDiabetic,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$fpg,x$wt))})

temp=list(nhanesIIIP2)
# ALL
lapply(temp, function(x) {print(weighted.mean(x$sex,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$age,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$hdl,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$lbxtc,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$asbp,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$curr_smq,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$isDiabetic,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$fpg,x$wt))})




# ATP3 stuff
## NHANES II
nhanesII_atp3 = read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/FRS/ATP3/nhanesII_frs_atp3.dta")

temp=list(nhanesII_atp3)

## ALL
lapply(temp, function(x) {print(weighted.mean(x$SEX,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$AGEYR_AT_INT,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$lbdhdd,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$lbxtc,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$asbp,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$curr_smq,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$treated,x$wt))})


## NHANES IIIP1
nhanesII_atp3 = read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/FRS/ATP3/nhanesIII_P1x_frs_atp3.dta")

temp=list(nhanesII_atp3)

# ALL
lapply(temp, function(x) {print(weighted.mean(x$HSSEX,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$HSAGEIR,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$HDP,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$TCP,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$asbp,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$curr_smq,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$treated,x$wt))})


# Pooled Cohort

## NHANES II
nhanesII_pooled=read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/FRS/Old Framingham/nhanesII/nhanesII_frs_old.dta") %>% mutate(isDiabetic = ifelse(fpg_reg >= 126,1,0)) %>% filter(race != 3) 
source("/Users/bryankim/Documents/NBER/Case Deaton/Code/NHANES II&III/create_wts_from_cleaned_pooled_nhanesII.R")
temp=list(nhanesII_pooled)
# ALL
lapply(temp, function(x) {print(weighted.mean(x$SEX,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$AGEYR_AT_INT,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$lbdhdd,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$lbxtc,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$asbp,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$curr_smq,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$isDiabetic,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$fpg_reg,x$wt))})

## NHANES III
nhanesIIIP1_pooled = read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/FRS/Old Framingham/NHANESIII/nhanesIIIP1_frs_old.dta") %>% mutate(isDiabetic = ifelse(fpg_reg >= 126,1,0)) %>% filter(race != 3) 
nhanesIIIP2_pooled = read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/FRS/Old Framingham/NHANESIII/nhanesIIIP2_frs_old.dta") %>% mutate(isDiabetic = ifelse(fpg_reg >= 126,1,0)) %>% filter(race != 3)
source("/Users/bryankim/Documents/NBER/Case Deaton/Code/NHANES II&III/create_wts_from_cleaned_pooled.R")
temp=list(nhanesIIIP1_pooled)
# ALL
lapply(temp, function(x) {print(weighted.mean(x$HSSEX,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$HSAGEIR,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$hdl,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$lbxtc,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$asbp,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$curr_smq,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$isDiabetic,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$fpg_reg,x$wt))})

temp=list(nhanesIIIP2_pooled)
# ALL
lapply(temp, function(x) {print(weighted.mean(x$HSSEX,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$HSAGEIR,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$hdl,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$lbxtc,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$asbp,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$curr_smq,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$isDiabetic,x$wt))})
lapply(temp, function(x) {print(weighted.mean(x$fpg_reg,x$wt))})

