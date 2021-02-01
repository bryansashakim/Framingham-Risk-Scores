# NHANES II

nhanesII=read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/FRS/Old Framingham/NHANESII/nhanesII_frs_old.dta") %>% mutate(isDiabetic = ifelse(fpg >= 126,1,0))
nhanesII$fpg[nhanesII$fpg==0] = NA
nhanesII = nhanesII[complete.cases(nhanesII[ , c("SEX","AGEYR_AT_INT","lbdhdd","lbxtc","asbp","curr_smq","fpg")]),]

nhanesII$frs = mapply(get_frs, nhanesII$SEX,nhanesII$AGEYR_AT_INT,nhanesII$lbdhdd,nhanesII$lbxtc,nhanesII$asbp,nhanesII$curr_smq,nhanesII$fpg)
# ALL
weighted.mean(nhanesII$frs,nhanesII$exam_final_wt)
weighted.mean(nhanesII$frs,nhanesII$wt)

# NHANES III
nhanesIIIP1 = read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/FRS/Old Framingham/NHANESIII/nhanesIIIP1_frs_old.dta") %>% mutate(isDiabetic = ifelse(fpg >= 126,1,0))
nhanesIIIP2 = read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/FRS/Old Framingham/NHANESIII/nhanesIIIP2_frs_old.dta") %>% mutate(isDiabetic = ifelse(fpg >= 126,1,0))
nhanesIIIP1$fpg[nhanesIIIP1$fpg==0] = NA
nhanesIIIP2$fpg[nhanesIIIP2$fpg==0] = NA

nhanesIIIP1 = nhanesIIIP1[complete.cases(nhanesIIIP1[ , c("HSSEX","HSAGEIR","hdl","lbxtc","asbp","curr_smq","fpg")]),]
nhanesIIIP2 = nhanesIIIP2[complete.cases(nhanesIIIP2[ , c("HSSEX","HSAGEIR","hdl","lbxtc","asbp","curr_smq","fpg")]),]

source("/Users/bryankim/Documents/NBER/Case Deaton/Code/NHANES II&III/create_wts_from_cleaned_old_nhanesIII.R")

nhanesIIIP1$frs = mapply(get_frs, nhanesIIIP1$HSSEX,nhanesIIIP1$HSAGEIR,nhanesIIIP1$hdl,nhanesIIIP1$lbxtc,nhanesIIIP1$asbp,nhanesIIIP1$smoke_sts,nhanesIIIP1$fpg)
nhanesIIIP2$frs = mapply(get_frs, nhanesIIIP2$HSSEX,nhanesIIIP2$HSAGEIR,nhanesIIIP2$hdl,nhanesIIIP2$lbxtc,nhanesIIIP2$asbp,nhanesIIIP2$smoke_sts,nhanesIIIP2$fpg)


#FOR NHANES III
tempIII = list(nhanesIIIP1,nhanesIIIP2)
tempIIIP1 = list(nhanesIIIP1)
tempIIIP2 = list(nhanesIIIP2)

length(tempIII) # should be 2

# ALL
weighted.mean(nhanesIIIP1$frs,nhanesIIIP1$WTPFQX1)
weighted.mean(nhanesIIIP1$frs,nhanesIIIP1$wt)
weighted.mean(nhanesIIIP2$frs,nhanesIIIP2$WTPFQX2)
weighted.mean(nhanesIIIP2$frs,nhanesIIIP2$wt)


# NHANES CONTINUOUS

source("/Users/bryankim/Documents/NBER/Case Deaton/Code/NHANES_continuous/load_data.R")

df_list = list(nhanes1999_2000,nhanes2001_2002,nhanes2003_2004,nhanes2005_2006,nhanes2007_2008,nhanes2009_2010,nhanes2011_2012,nhanes2013_2014,nhanes2015_2016,nhanes2017_2018)

print(length(df_list))

source("/Users/bryankim/Documents/NBER/Case Deaton/Code/NHANES_continuous/compute_frs.R")

nhanes1999_2000= nhanes1999_2000[complete.cases(nhanes1999_2000[ , c("riagendr","ridageyr","hdl","lbxtc","asbp","curr_smq","fpg")]),]
nhanes2001_2002= nhanes2001_2002[complete.cases(nhanes2001_2002[ , c("riagendr","ridageyr","hdl","lbxtc","asbp","curr_smq","fpg")]),]
nhanes2003_2004= nhanes2003_2004[complete.cases(nhanes2003_2004[ , c("riagendr","ridageyr","hdl","lbxtc","asbp","curr_smq","fpg")]),]
nhanes2005_2006= nhanes2005_2006[complete.cases(nhanes2005_2006[ , c("riagendr","ridageyr","hdl","lbxtc","asbp","curr_smq","fpg")]),]
nhanes2007_2008= nhanes2007_2008[complete.cases(nhanes2007_2008[ , c("riagendr","ridageyr","hdl","lbxtc","asbp","curr_smq","fpg")]),]
nhanes2009_2010= nhanes2009_2010[complete.cases(nhanes2009_2010[ , c("riagendr","ridageyr","hdl","lbxtc","asbp","curr_smq","fpg")]),]
nhanes2011_2012= nhanes2011_2012[complete.cases(nhanes2011_2012[ , c("riagendr","ridageyr","hdl","lbxtc","asbp","curr_smq","fpg")]),]
nhanes2013_2014= nhanes2013_2014[complete.cases(nhanes2013_2014[ , c("riagendr","ridageyr","hdl","lbxtc","asbp","curr_smq","fpg")]),]
nhanes2015_2016= nhanes2015_2016[complete.cases(nhanes2015_2016[ , c("riagendr","ridageyr","hdl","lbxtc","asbp","curr_smq","fpg")]),]
nhanes2017_2018= nhanes2017_2018[complete.cases(nhanes2017_2018[ , c("riagendr","ridageyr","hdl","lbxtc","asbp","curr_smq","fpg")]),]

nhanes1999_2000$frs = mapply(get_frs, nhanes1999_2000$riagendr,nhanes1999_2000$ridageyr,nhanes1999_2000$hdl,nhanes1999_2000$lbxtc,nhanes1999_2000$asbp,nhanes1999_2000$curr_smq,nhanes1999_2000$fpg)
nhanes2001_2002$frs = mapply(get_frs, nhanes2001_2002$riagendr,nhanes2001_2002$ridageyr,nhanes2001_2002$hdl,nhanes2001_2002$lbxtc,nhanes2001_2002$asbp,nhanes2001_2002$curr_smq,nhanes2001_2002$fpg)
nhanes2003_2004$frs = mapply(get_frs, nhanes2003_2004$riagendr,nhanes2003_2004$ridageyr,nhanes2003_2004$hdl,nhanes2003_2004$lbxtc,nhanes2003_2004$asbp,nhanes2003_2004$curr_smq,nhanes2003_2004$fpg)
nhanes2005_2006$frs = mapply(get_frs, nhanes2005_2006$riagendr,nhanes2005_2006$ridageyr,nhanes2005_2006$hdl,nhanes2005_2006$lbxtc,nhanes2005_2006$asbp,nhanes2005_2006$curr_smq,nhanes2005_2006$fpg)
nhanes2007_2008$frs = mapply(get_frs, nhanes2007_2008$riagendr,nhanes2007_2008$ridageyr,nhanes2007_2008$hdl,nhanes2007_2008$lbxtc,nhanes2007_2008$asbp,nhanes2007_2008$curr_smq,nhanes2007_2008$fpg)
nhanes2009_2010$frs = mapply(get_frs, nhanes2009_2010$riagendr,nhanes2009_2010$ridageyr,nhanes2009_2010$hdl,nhanes2009_2010$lbxtc,nhanes2009_2010$asbp,nhanes2009_2010$curr_smq,nhanes2009_2010$fpg)
nhanes2011_2012$frs = mapply(get_frs, nhanes2011_2012$riagendr,nhanes2011_2012$ridageyr,nhanes2011_2012$hdl,nhanes2011_2012$lbxtc,nhanes2011_2012$asbp,nhanes2011_2012$curr_smq,nhanes2011_2012$fpg)
nhanes2013_2014$frs = mapply(get_frs, nhanes2013_2014$riagendr,nhanes2013_2014$ridageyr,nhanes2013_2014$hdl,nhanes2013_2014$lbxtc,nhanes2013_2014$asbp,nhanes2013_2014$curr_smq,nhanes2013_2014$fpg)
nhanes2015_2016$frs = mapply(get_frs, nhanes2015_2016$riagendr,nhanes2015_2016$ridageyr,nhanes2015_2016$hdl,nhanes2015_2016$lbxtc,nhanes2015_2016$asbp,nhanes2015_2016$curr_smq,nhanes2015_2016$fpg)
nhanes2017_2018$frs = mapply(get_frs, nhanes2017_2018$riagendr,nhanes2017_2018$ridageyr,nhanes2017_2018$hdl,nhanes2017_2018$lbxtc,nhanes2017_2018$asbp,nhanes2017_2018$curr_smq,nhanes2017_2018$fpg)

df_list = list(nhanes1999_2000,nhanes2001_2002,nhanes2003_2004,nhanes2005_2006,nhanes2007_2008,nhanes2009_2010,nhanes2011_2012,nhanes2013_2014,nhanes2015_2016,nhanes2017_2018)

"ALL"
lapply(df_list, function(x) print(weighted.mean(x$frs,x$wtint2yr)))
lapply(df_list, function(x) print(weighted.mean(x$frs,x$wt)))

##### BY EDUCATION #####
# <HS 
lapply(df_list, function(x) {df_list = filter(x,x$dmdeduc2 <= 2);print(weighted.mean(df_list$frs,df_list$wtint2yr))})

# HS
lapply(df_list, function(x) {df_list = filter(x,x$dmdeduc2 == 3);print(weighted.mean(df_list$frs,df_list$wtint2yr))})

# Some College
lapply(df_list, function(x) {df_list = filter(x,x$dmdeduc2 == 4);print(weighted.mean(df_list$frs,df_list$wtint2yr))})

# College Grad
lapply(df_list, function(x) {df_list = filter(x,x$dmdeduc2 == 5);print(weighted.mean(df_list$frs,df_list$wtint2yr))})

##### BY AGE #####
# 45-54
lapply(df_list, function(x) {df_list = filter(x,x$ridageyr >=45 & x$ridageyr <=54);print(weighted.mean(df_list$frs,df_list$wtint2yr))})
# 55-64
lapply(df_list, function(x) {df_list = filter(x,x$ridageyr >=55 & x$ridageyr <=64);print(weighted.mean(df_list$frs,df_list$wtint2yr))})
# 65-74
lapply(df_list, function(x) {df_list = filter(x,x$ridageyr >=65 & x$ridageyr <=74);print(weighted.mean(df_list$frs,df_list$wtint2yr))})
# 75+
lapply(df_list, function(x) {df_list = filter(x,x$ridageyr >=75);print(weighted.mean(df_list$frs,df_list$wtint2yr))})
# 85+
lapply(df_list, function(x) {df_list = filter(x,x$ridageyr >= 85);print(weighted.mean(df_list$frs,df_list$wtint2yr))})

## AGE-SEX ADJUSTED ##
##### BY EDUCATION #####
# <HS 
lapply(df_list, function(x) {df_list = filter(x,x$dmdeduc2 <= 2);print(weighted.mean(df_list$frs,df_list$wt))})

# HS
lapply(df_list, function(x) {df_list = filter(x,x$dmdeduc2 == 3);print(weighted.mean(df_list$frs,df_list$wt))})

# Some College
lapply(df_list, function(x) {df_list = filter(x,x$dmdeduc2 == 4);print(weighted.mean(df_list$frs,df_list$wt))})

# College Grad
lapply(df_list, function(x) {df_list = filter(x,x$dmdeduc2 == 5);print(weighted.mean(df_list$frs,df_list$wt))})

##### BY AGE #####
# 45-54
lapply(df_list, function(x) {df_list = filter(x,x$ridageyr >=45 & x$ridageyr <=54);print(weighted.mean(df_list$frs,df_list$wt))})
# 55-64
lapply(df_list, function(x) {df_list = filter(x,x$ridageyr >=55 & x$ridageyr <=64);print(weighted.mean(df_list$frs,df_list$wt))})
# 65-74
lapply(df_list, function(x) {df_list = filter(x,x$ridageyr >=65 & x$ridageyr <=74);print(weighted.mean(df_list$frs,df_list$wt))})
# 75+
lapply(df_list, function(x) {df_list = filter(x,x$ridageyr >=75);print(weighted.mean(df_list$frs,df_list$wt))})
# 85+
lapply(df_list, function(x) {df_list = filter(x,x$ridageyr >= 85);print(weighted.mean(df_list$frs,df_list$wt))})






