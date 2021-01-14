nhanes1999_2000=read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/nhanes_1999_2000_frs.dta")
nhanes2001_2002=read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/nhanes_2001_2002_frs.dta")
nhanes2003_2004=read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/nhanes_2003_2004_frs.dta")
nhanes2005_2006=read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/nhanes_2005_2006_frs.dta")
nhanes2007_2008=read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/nhanes_2007_2008_frs.dta")
nhanes2009_2010=read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/nhanes_2009_2010_frs.dta")
nhanes2011_2012=read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/nhanes_2011_2012_frs.dta")
nhanes2013_2014=read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/nhanes_2013_2014_frs.dta")
nhanes2015_2016=read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/nhanes_2015_2016_frs.dta")
nhanes2017_2018=read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/nhanes_2017_2018_frs.dta")

df_list = list(nhanes1999_2000,nhanes2001_2002,nhanes2003_2004,nhanes2005_2006,nhanes2007_2008,nhanes2009_2010,nhanes2011_2012,nhanes2013_2014,nhanes2015_2016,nhanes2017_2018)

############################
### RUN adjust_weights.R ###
############################
source("/Users/bryankim/Documents/NBER/Case Deaton/Code/adjust_weights.R")

w_M1_2009_2010 = temp[[6]] %>% filter(M1 == 1) %>% select(wtint2yr) %>% sum
w_F1_2009_2010 = temp[[6]] %>% filter(F1 == 1) %>% select(wtint2yr) %>% sum
w_M2_2009_2010 = temp[[6]] %>% filter(M2 == 1) %>% select(wtint2yr) %>% sum
w_F2_2009_2010 = temp[[6]] %>% filter(F2 == 1) %>% select(wtint2yr) %>% sum
w_M3_2009_2010 = temp[[6]] %>% filter(M3 == 1) %>% select(wtint2yr) %>% sum
w_F3_2009_2010 = temp[[6]] %>% filter(F3 == 1) %>% select(wtint2yr) %>% sum
w_M4_2009_2010 = temp[[6]] %>% filter(M4 == 1) %>% select(wtint2yr) %>% sum
w_F4_2009_2010 = temp[[6]] %>% filter(F4 == 1) %>% select(wtint2yr) %>% sum

