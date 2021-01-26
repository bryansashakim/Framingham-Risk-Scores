

# ATP3 stuff
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