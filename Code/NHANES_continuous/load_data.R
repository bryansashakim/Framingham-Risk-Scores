### Required packages ###
library(ggplot2); library(dplyr); library(tidyr);library(haven)

# Load Data
## Old Framingham
nhanes1999_2000=read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/FRS/Old Framingham/continuous/nhanes_1999_2000_frs_old.dta") %>% mutate(isDiabetic = ifelse(fpg >= 126,1,0))
nhanes2001_2002=read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/FRS/Old Framingham/continuous/nhanes_2001_2002_frs_old.dta") %>% mutate(isDiabetic = ifelse(fpg >= 126,1,0))
nhanes2003_2004=read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/FRS/Old Framingham/continuous/nhanes_2003_2004_frs_old.dta") %>% mutate(isDiabetic = ifelse(fpg >= 126,1,0))
nhanes2005_2006=read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/FRS/Old Framingham/continuous/nhanes_2005_2006_frs_old.dta") %>% mutate(isDiabetic = ifelse(fpg >= 126,1,0))
nhanes2007_2008=read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/FRS/Old Framingham/continuous/nhanes_2007_2008_frs_old.dta") %>% mutate(isDiabetic = ifelse(fpg >= 126,1,0))
nhanes2009_2010=read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/FRS/Old Framingham/continuous/nhanes_2009_2010_frs_old.dta") %>% mutate(isDiabetic = ifelse(fpg >= 126,1,0))
nhanes2011_2012=read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/FRS/Old Framingham/continuous/nhanes_2011_2012_frs_old.dta") %>% mutate(isDiabetic = ifelse(fpg >= 126,1,0))
nhanes2013_2014=read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/FRS/Old Framingham/continuous/nhanes_2013_2014_frs_old.dta") %>% mutate(isDiabetic = ifelse(fpg >= 126,1,0))
nhanes2015_2016=read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/FRS/Old Framingham/continuous/nhanes_2015_2016_frs_old.dta") %>% mutate(isDiabetic = ifelse(fpg >= 126,1,0))
nhanes2017_2018=read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/FRS/Old Framingham/continuous/nhanes_2017_2018_frs_old.dta") %>% mutate(isDiabetic = ifelse(fpg >= 126,1,0))

## complete cases
nhanes1999_2000= nhanes1999_2000[complete.cases(nhanes1999_2000[ , c("sex","age","hdl","lbxtc","asbp","curr_smq","fpg")]),]
nhanes2001_2002= nhanes2001_2002[complete.cases(nhanes2001_2002[ , c("sex","age","hdl","lbxtc","asbp","curr_smq","fpg")]),]
nhanes2003_2004= nhanes2003_2004[complete.cases(nhanes2003_2004[ , c("sex","age","hdl","lbxtc","asbp","curr_smq","fpg")]),]
nhanes2005_2006= nhanes2005_2006[complete.cases(nhanes2005_2006[ , c("sex","age","hdl","lbxtc","asbp","curr_smq","fpg")]),]
nhanes2007_2008= nhanes2007_2008[complete.cases(nhanes2007_2008[ , c("sex","age","hdl","lbxtc","asbp","curr_smq","fpg")]),]
nhanes2009_2010= nhanes2009_2010[complete.cases(nhanes2009_2010[ , c("sex","age","hdl","lbxtc","asbp","curr_smq","fpg")]),]
nhanes2011_2012= nhanes2011_2012[complete.cases(nhanes2011_2012[ , c("sex","age","hdl","lbxtc","asbp","curr_smq","fpg")]),]
nhanes2013_2014= nhanes2013_2014[complete.cases(nhanes2013_2014[ , c("sex","age","hdl","lbxtc","asbp","curr_smq","fpg")]),]
nhanes2015_2016= nhanes2015_2016[complete.cases(nhanes2015_2016[ , c("sex","age","hdl","lbxtc","asbp","curr_smq","fpg")]),]
nhanes2017_2018= nhanes2017_2018[complete.cases(nhanes2017_2018[ , c("sex","age","hdl","lbxtc","asbp","curr_smq","fpg")]),]

df_list = list(nhanes1999_2000,nhanes2001_2002,nhanes2003_2004,nhanes2005_2006,nhanes2007_2008,nhanes2009_2010,nhanes2011_2012,nhanes2013_2014,nhanes2015_2016,nhanes2017_2018)

############################
### RUN adjust_weights.R ###
############################
source("/Users/bryankim/Documents/NBER/Case Deaton/Code/adjust_weights.R")
