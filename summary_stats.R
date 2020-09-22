### TABULATIONS BY YEAR ###
library(dplyr)

# read in nhanes_full
nhanes_full <- read.csv("/disk/homedirs/nber/kimcwa/Documents/casedeaton/NHANES/LMF Data/NHANES continuous/nhanes_full.csv")
nhanes_full_dta <- read_dta("Documents/casedeaton/NHANES/LMF Data/NHANES continuous/nhanes_full.dta")

# removing less than 18 yr olds
nhanes = nhanes_full %>% filter(ridageyr >= 18 | is.na(ridageyr))
nhanes_dta = nhanes_full_dta %>% filter(ridageyr >= 45 | is.na(ridageyr))


aggregate(nhanes[, c("asbp")], list(nhanes$year), mean)
aggregate(list(nhanes$year),nhanes[, c("ridageyr","asbp")], mean)

nhanes_dta %>%                                        
  group_by(year) %>%                        
  summarise_at(vars(c(asbp)),              
               list(name = mean))


### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### 
# After filtering for age >= 45
setwd("/homes/nber/kimcwa/Documents/casedeaton/NHANES/LMF Data/NHANES continuous")
for (i in c(1999,2001,2003,2005,2007,2009,2011,2013)) {
  assign(paste("nhanes_", i,"_",i+1, sep=""),read_dta(paste("nhanes_", i,"_",i+1,".dta", sep="")))
}

nhanes_1999_2000=nhanes_1999_2000  %>% filter(ridageyr >= 18)
nhanes_2001_2002=nhanes_2001_2002  %>% filter(ridageyr >= 18)
nhanes_2003_2004=nhanes_2003_2004  %>% filter(ridageyr >= 18)
nhanes_2005_2006=nhanes_2005_2006  %>% filter(ridageyr >= 18)
nhanes_2007_2008=nhanes_2007_2008  %>% filter(ridageyr >= 18)
nhanes_2009_2010=nhanes_2009_2010  %>% filter(ridageyr >= 18)
nhanes_2011_2012=nhanes_2011_2012  %>% filter(ridageyr >= 18)
nhanes_2013_2014=nhanes_2013_2014  %>% filter(ridageyr >= 18)

## TAB ridageyr
nhanes_1999_2000 %>%
  group_by(ridageyr) %>%
  summarise(n = n()) %>%
  mutate(totalN = (cumsum(n)),
         percent = round((n / sum(n))*100, 3),
         cumpercent = round(cumsum(freq = n / sum(n))*100,3))

               