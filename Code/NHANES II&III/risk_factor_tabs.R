


# ATP3 stuff
## NHANES II
nhanesII_atp3 = read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/FRS/ATP3/nhanesII_frs_atp3.dta")

temp=list(nhanesII_atp3)

# ALL
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


