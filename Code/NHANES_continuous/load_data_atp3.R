### Required packages ###
library(ggplot2); library(dplyr); library(tidyr);library(haven)

# Load Data
## Old Framingham
nhanes1999_2000_atp3=read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/FRS/ATP3/for FRS/nhanes_1999_2000_frs_atp3.dta") 
nhanes2001_2002_atp3=read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/FRS/ATP3/for FRS/nhanes_2001_2002_frs_atp3.dta") 
nhanes2003_2004_atp3=read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/FRS/ATP3/for FRS/nhanes_2003_2004_frs_atp3.dta") 
nhanes2005_2006_atp3=read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/FRS/ATP3/for FRS/nhanes_2005_2006_frs_atp3.dta") 
nhanes2007_2008_atp3=read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/FRS/ATP3/for FRS/nhanes_2007_2008_frs_atp3.dta") 
nhanes2009_2010_atp3=read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/FRS/ATP3/for FRS/nhanes_2009_2010_frs_atp3.dta") 
nhanes2011_2012_atp3=read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/FRS/ATP3/for FRS/nhanes_2011_2012_frs_atp3.dta") 
nhanes2013_2014_atp3=read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/FRS/ATP3/for FRS/nhanes_2013_2014_frs_atp3.dta") 
nhanes2015_2016_atp3=read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/FRS/ATP3/for FRS/nhanes_2015_2016_frs_atp3.dta") 
nhanes2017_2018_atp3=read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/FRS/ATP3/for FRS/nhanes_2017_2018_frs_atp3.dta") 

## complete cases
nhanes1999_2000_atp3= nhanes1999_2000_atp3[complete.cases(nhanes1999_2000_atp3[ , c("riagendr","age","hdl","lbxtc","asbp","smq020","treated_hpt")]),]
nhanes2001_2002_atp3= nhanes2001_2002_atp3[complete.cases(nhanes2001_2002_atp3[ , c("riagendr","age","hdl","lbxtc","asbp","smq020","treated_hpt")]),]
nhanes2003_2004_atp3= nhanes2003_2004_atp3[complete.cases(nhanes2003_2004_atp3[ , c("riagendr","age","hdl","lbxtc","asbp","smq020","treated_hpt")]),]
nhanes2005_2006_atp3= nhanes2005_2006_atp3[complete.cases(nhanes2005_2006_atp3[ , c("riagendr","age","hdl","lbxtc","asbp","smq020","treated_hpt")]),]
nhanes2007_2008_atp3= nhanes2007_2008_atp3[complete.cases(nhanes2007_2008_atp3[ , c("riagendr","age","hdl","lbxtc","asbp","smq020","treated_hpt")]),]
nhanes2009_2010_atp3= nhanes2009_2010_atp3[complete.cases(nhanes2009_2010_atp3[ , c("riagendr","age","hdl","lbxtc","asbp","smq020","treated_hpt")]),]
nhanes2011_2012_atp3= nhanes2011_2012_atp3[complete.cases(nhanes2011_2012_atp3[ , c("riagendr","age","hdl","lbxtc","asbp","smq020","treated_hpt")]),]
nhanes2013_2014_atp3= nhanes2013_2014_atp3[complete.cases(nhanes2013_2014_atp3[ , c("riagendr","age","hdl","lbxtc","asbp","smq020","treated_hpt")]),]
nhanes2015_2016_atp3= nhanes2015_2016_atp3[complete.cases(nhanes2015_2016_atp3[ , c("riagendr","age","hdl","lbxtc","asbp","smq020","treated_hpt")]),]
nhanes2017_2018_atp3= nhanes2017_2018_atp3[complete.cases(nhanes2017_2018_atp3[ , c("riagendr","age","hdl","lbxtc","asbp","smq020","treated_hpt")]),]

df_list = list(nhanes1999_2000_atp3,nhanes2001_2002_atp3,nhanes2003_2004_atp3,nhanes2005_2006_atp3,nhanes2007_2008_atp3,nhanes2009_2010_atp3,nhanes2011_2012_atp3,nhanes2013_2014_atp3,nhanes2015_2016_atp3,nhanes2017_2018_atp3)

############################
### RUN adjust_weights.R ###
############################
# source("/Users/bryankim/Documents/NBER/Case Deaton/Code/adjust_weights.R")


