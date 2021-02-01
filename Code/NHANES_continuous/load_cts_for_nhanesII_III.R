nhanes1999_2000=read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/FRS/Old Framingham/continuous/nhanes_1999_2000_frs_old.dta")  
nhanes2001_2002=read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/FRS/Old Framingham/continuous/nhanes_2001_2002_frs_old.dta")  
nhanes2003_2004=read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/FRS/Old Framingham/continuous/nhanes_2003_2004_frs_old.dta")  
nhanes2005_2006=read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/FRS/Old Framingham/continuous/nhanes_2005_2006_frs_old.dta")  
nhanes2007_2008=read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/FRS/Old Framingham/continuous/nhanes_2007_2008_frs_old.dta")  
nhanes2009_2010=read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/FRS/Old Framingham/continuous/nhanes_2009_2010_frs_old.dta")  
nhanes2011_2012=read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/FRS/Old Framingham/continuous/nhanes_2011_2012_frs_old.dta")  
nhanes2013_2014=read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/FRS/Old Framingham/continuous/nhanes_2013_2014_frs_old.dta")  
nhanes2015_2016=read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/FRS/Old Framingham/continuous/nhanes_2015_2016_frs_old.dta")  
nhanes2017_2018=read_dta("/Users/bryankim/Documents/NBER/Case Deaton/Data/FRS/Old Framingham/continuous/nhanes_2017_2018_frs_old.dta")  

df_list = list(nhanes1999_2000,nhanes2001_2002,nhanes2003_2004,nhanes2005_2006,nhanes2007_2008,nhanes2009_2010,nhanes2011_2012,nhanes2013_2014,nhanes2015_2016,nhanes2017_2018)

source("/Users/bryankim/Documents/NBER/Case Deaton/Code/adjust_weights.R")
