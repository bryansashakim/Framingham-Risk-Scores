### Required packages ###
library(ggplot2); library(dplyr); library(tidyr);library(haven)

# Load Data
## Old Framingham
nhanes1999_2000=read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/FRS/Old Framingham/continuous/all_nhanes1999_2000_for_frs.dta") %>% filter(race %in% c(1,2)) %>% mutate(isDiabetic = ifelse(lbxgh >= 6.5,1,0))
nhanes2001_2002=read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/FRS/Old Framingham/continuous/all_nhanes2001_2002_for_frs.dta") %>% filter(race %in% c(1,2)) %>% mutate(isDiabetic = ifelse(lbxgh >= 6.5,1,0))
nhanes2003_2004=read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/FRS/Old Framingham/continuous/all_nhanes2003_2004_for_frs.dta") %>% filter(race %in% c(1,2)) %>% mutate(isDiabetic = ifelse(lbxgh >= 6.5,1,0))
nhanes2005_2006=read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/FRS/Old Framingham/continuous/all_nhanes2005_2006_for_frs.dta") %>% filter(race %in% c(1,2)) %>% mutate(isDiabetic = ifelse(lbxgh >= 6.5,1,0))
nhanes2007_2008=read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/FRS/Old Framingham/continuous/all_nhanes2007_2008_for_frs.dta") %>% filter(race %in% c(1,2)) %>% mutate(isDiabetic = ifelse(lbxgh >= 6.5,1,0))
nhanes2009_2010=read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/FRS/Old Framingham/continuous/all_nhanes2009_2010_for_frs.dta") %>% filter(race %in% c(1,2)) %>% mutate(isDiabetic = ifelse(lbxgh >= 6.5,1,0))
nhanes2011_2012=read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/FRS/Old Framingham/continuous/all_nhanes2011_2012_for_frs.dta") %>% filter(race %in% c(1,2)) %>% mutate(isDiabetic = ifelse(lbxgh >= 6.5,1,0))
nhanes2013_2014=read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/FRS/Old Framingham/continuous/all_nhanes2013_2014_for_frs.dta") %>% filter(race %in% c(1,2)) %>% mutate(isDiabetic = ifelse(lbxgh >= 6.5,1,0))
nhanes2015_2016=read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/FRS/Old Framingham/continuous/all_nhanes2015_2016_for_frs.dta") %>% filter(race %in% c(1,2)) %>% mutate(isDiabetic = ifelse(lbxgh >= 6.5,1,0))
nhanes2017_2018=read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/FRS/Old Framingham/continuous/all_nhanes2017_2018_for_frs.dta") %>% filter(race %in% c(1,2)) %>% mutate(isDiabetic = ifelse(lbxgh >= 6.5,1,0))

## complete cases
nhanes1999_2000= nhanes1999_2000[complete.cases(nhanes1999_2000[ , c("sex","race","age","hdl","lbxtc","asbp","smq020","lbxgh")]),]
nhanes2001_2002= nhanes2001_2002[complete.cases(nhanes2001_2002[ , c("sex","race","age","hdl","lbxtc","asbp","smq020","lbxgh")]),]
nhanes2003_2004= nhanes2003_2004[complete.cases(nhanes2003_2004[ , c("sex","race","age","hdl","lbxtc","asbp","smq020","lbxgh")]),]
nhanes2005_2006= nhanes2005_2006[complete.cases(nhanes2005_2006[ , c("sex","race","age","hdl","lbxtc","asbp","smq020","lbxgh")]),]
nhanes2007_2008= nhanes2007_2008[complete.cases(nhanes2007_2008[ , c("sex","race","age","hdl","lbxtc","asbp","smq020","lbxgh")]),]
nhanes2009_2010= nhanes2009_2010[complete.cases(nhanes2009_2010[ , c("sex","race","age","hdl","lbxtc","asbp","smq020","lbxgh")]),]
nhanes2011_2012= nhanes2011_2012[complete.cases(nhanes2011_2012[ , c("sex","race","age","hdl","lbxtc","asbp","smq020","lbxgh")]),]
nhanes2013_2014= nhanes2013_2014[complete.cases(nhanes2013_2014[ , c("sex","race","age","hdl","lbxtc","asbp","smq020","lbxgh")]),]
nhanes2015_2016= nhanes2015_2016[complete.cases(nhanes2015_2016[ , c("sex","race","age","hdl","lbxtc","asbp","smq020","lbxgh")]),]
nhanes2017_2018= nhanes2017_2018[complete.cases(nhanes2017_2018[ , c("sex","race","age","hdl","lbxtc","asbp","smq020","lbxgh")]),]

df_list = list(nhanes1999_2000,nhanes2001_2002,nhanes2003_2004,nhanes2005_2006,nhanes2007_2008,nhanes2009_2010,nhanes2011_2012,nhanes2013_2014,nhanes2015_2016,nhanes2017_2018)

############################
### RUN adjust_weights.R ###
############################
source("/Users/bryankim/Documents/NBER/Case Deaton/Code/adjust_weights.R")