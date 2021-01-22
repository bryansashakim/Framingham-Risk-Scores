### Required packages ###
library(ggplot2); library(dplyr); library(tidyr);library(haven)

# Load Data
nhanes1999_2000=read_dta("/Users/bryankim/Library/Mobile Documents/com~apple~CloudDocs/Documents/NBER/Case Deaton/Data/FRS/continuous/nhanes_1999_2000_frs.dta")
nhanes2001_2002=read_dta("/Users/bryankim/Library/Mobile Documents/com~apple~CloudDocs/Documents/NBER/Case Deaton/Data/FRS/continuous/nhanes_2001_2002_frs.dta")
nhanes2003_2004=read_dta("/Users/bryankim/Library/Mobile Documents/com~apple~CloudDocs/Documents/NBER/Case Deaton/Data/FRS/continuous/nhanes_2003_2004_frs.dta")
nhanes2005_2006=read_dta("/Users/bryankim/Library/Mobile Documents/com~apple~CloudDocs/Documents/NBER/Case Deaton/Data/FRS/continuous/nhanes_2005_2006_frs.dta")
nhanes2007_2008=read_dta("/Users/bryankim/Library/Mobile Documents/com~apple~CloudDocs/Documents/NBER/Case Deaton/Data/FRS/continuous/nhanes_2007_2008_frs.dta")
nhanes2009_2010=read_dta("/Users/bryankim/Library/Mobile Documents/com~apple~CloudDocs/Documents/NBER/Case Deaton/Data/FRS/continuous/nhanes_2009_2010_frs.dta")
nhanes2011_2012=read_dta("/Users/bryankim/Library/Mobile Documents/com~apple~CloudDocs/Documents/NBER/Case Deaton/Data/FRS/continuous/nhanes_2011_2012_frs.dta")
nhanes2013_2014=read_dta("/Users/bryankim/Library/Mobile Documents/com~apple~CloudDocs/Documents/NBER/Case Deaton/Data/FRS/continuous/nhanes_2013_2014_frs.dta")
nhanes2015_2016=read_dta("/Users/bryankim/Library/Mobile Documents/com~apple~CloudDocs/Documents/NBER/Case Deaton/Data/FRS/continuous/nhanes_2015_2016_frs.dta")
nhanes2017_2018=read_dta("/Users/bryankim/Library/Mobile Documents/com~apple~CloudDocs/Documents/NBER/Case Deaton/Data/FRS/continuous/nhanes_2017_2018_frs.dta")

## complete cases
nhanes1999_2000= nhanes1999_2000[complete.cases(nhanes1999_2000[ , c("riagendr","ridageyr","hdl","lbxtc","asbp","curr_smq","fpg_reg")]),]
nhanes2001_2002= nhanes2001_2002[complete.cases(nhanes2001_2002[ , c("riagendr","ridageyr","hdl","lbxtc","asbp","curr_smq","fpg_reg")]),]
nhanes2003_2004= nhanes2003_2004[complete.cases(nhanes2003_2004[ , c("riagendr","ridageyr","hdl","lbxtc","asbp","curr_smq","fpg_reg")]),]
nhanes2005_2006= nhanes2005_2006[complete.cases(nhanes2005_2006[ , c("riagendr","ridageyr","hdl","lbxtc","asbp","curr_smq","fpg_reg")]),]
nhanes2007_2008= nhanes2007_2008[complete.cases(nhanes2007_2008[ , c("riagendr","ridageyr","hdl","lbxtc","asbp","curr_smq","fpg_reg")]),]
nhanes2009_2010= nhanes2009_2010[complete.cases(nhanes2009_2010[ , c("riagendr","ridageyr","hdl","lbxtc","asbp","curr_smq","fpg_reg")]),]
nhanes2011_2012= nhanes2011_2012[complete.cases(nhanes2011_2012[ , c("riagendr","ridageyr","hdl","lbxtc","asbp","curr_smq","fpg_reg")]),]
nhanes2013_2014= nhanes2013_2014[complete.cases(nhanes2013_2014[ , c("riagendr","ridageyr","hdl","lbxtc","asbp","curr_smq","fpg_reg")]),]
nhanes2015_2016= nhanes2015_2016[complete.cases(nhanes2015_2016[ , c("riagendr","ridageyr","hdl","lbxtc","asbp","curr_smq","fpg_reg")]),]
nhanes2017_2018= nhanes2017_2018[complete.cases(nhanes2017_2018[ , c("riagendr","ridageyr","hdl","lbxtc","asbp","curr_smq","fpg_reg")]),]

df_list = list(nhanes1999_2000,nhanes2001_2002,nhanes2003_2004,nhanes2005_2006,nhanes2007_2008,nhanes2009_2010,nhanes2011_2012,nhanes2013_2014,nhanes2015_2016,nhanes2017_2018)

############################
### RUN adjust_weights.R ###
############################
source("/Users/bryankim/Library/Mobile Documents/com~apple~CloudDocs/Documents/NBER/Case Deaton/Code/adjust_weights.R")
