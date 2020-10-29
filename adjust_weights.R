## FORMING AGE-SEX GROUPS FOR EACH PERSON
# 45-54, MALES & FEMALES
#lapply(df_list, function(x) {mutate(temp, M1 = ifelse(ridageyr >= 45 & ridageyr <= 54 & riagendr == 1, 1, 0))})
temp = df_list %>% lapply(function(x) {mutate(x, M1 = ifelse(ridageyr >= 45 & ridageyr <= 54 & riagendr == 1, 1, 0))})
temp = temp %>% lapply(function(x) {mutate(x, M1 = ifelse(ridageyr >= 45 & ridageyr <= 54 & riagendr == 1, 1, 0))})

temp = temp %>% lapply(function(x) {mutate(x, F1 = ifelse(ridageyr >= 45 & ridageyr <= 54 & riagendr == 2, 1, 0))})
# 55-64, MALES & FEMALES
temp = temp %>% lapply(function(x) {mutate(x, M2 = ifelse(ridageyr >= 55 & ridageyr <= 64 & riagendr == 1, 1, 0))})
temp = temp %>% lapply(function(x) {mutate(x, F2 = ifelse(ridageyr >= 55 & ridageyr <= 64 & riagendr == 2, 1, 0))})
# 65-74, MALES & FEMALES
temp = temp %>% lapply(function(x) {mutate(x, M3 = ifelse(ridageyr >= 65 & ridageyr <= 74 & riagendr == 1, 1, 0))})
temp = temp %>% lapply(function(x) {mutate(x, F3 = ifelse(ridageyr >= 65 & ridageyr <= 74 & riagendr == 2, 1, 0))})
# 75+, MALES & FEMALES
temp = temp %>% lapply(function(x) {mutate(x, M4 = ifelse(ridageyr >= 75 & riagendr == 1, 1, 0))})
temp = temp %>% lapply(function(x) {mutate(x, F4 = ifelse(ridageyr >= 75 & riagendr == 2, 1, 0))})



## FOR 2009-2010, FORM SUM OF WEIGHTS FOR EACH AGE-SEX GROUP - call it w_as_2009_2010
w_M1_2009_2010 = temp[[6]] %>% filter(M1 == 1) %>% select(wtint2yr) %>% sum
w_F1_2009_2010 = temp[[6]] %>% filter(F1 == 1) %>% select(wtint2yr) %>% sum
w_M2_2009_2010 = temp[[6]] %>% filter(M2 == 1) %>% select(wtint2yr) %>% sum
w_F2_2009_2010 = temp[[6]] %>% filter(F2 == 1) %>% select(wtint2yr) %>% sum
w_M3_2009_2010 = temp[[6]] %>% filter(M3 == 1) %>% select(wtint2yr) %>% sum
w_F3_2009_2010 = temp[[6]] %>% filter(F3 == 1) %>% select(wtint2yr) %>% sum
w_M4_2009_2010 = temp[[6]] %>% filter(M4 == 1) %>% select(wtint2yr) %>% sum
w_F4_2009_2010 = temp[[6]] %>% filter(F4 == 1) %>% select(wtint2yr) %>% sum


## FORM SUM OF WEIGHT FOR EACH AGE-SEX GROUP IN EACH OTHER YEAR 
index = 1
for (year in c("1999_2000","2001_2002","2003_2004","2005_2006","2007_2008","2009_2010","2011_2012","2013_2014","2015_2016","2017_2018"))
  
{
  for (sex in c("M","F")) {
    for (cat in c(1,2,3,4)) {
      assign(paste("w_",sex,cat,"_",year,sep = ""),temp[[index]] %>% filter(eval(parse(text = paste(sex,cat,sep=""))) == 1) %>% select(wtint2yr) %>% sum)
    }
  }
 index = index + 1
}

temp[[1]] = mutate(temp[[1]],wt = case_when(M1 == 1 ~ eval(wtint2yr)*(eval(w_M1_2009_2010)/(eval(w_M1_1999_2000))),
                                            F1 == 1 ~ eval(wtint2yr)*(eval(w_F1_2009_2010)/(eval(w_F1_1999_2000))),
                                            M2 == 1 ~ eval(wtint2yr)*(eval(w_M2_2009_2010)/(eval(w_M2_1999_2000))),
                                            F2 == 1 ~ eval(wtint2yr)*(eval(w_F2_2009_2010)/(eval(w_F2_1999_2000))),
                                            M3 == 1 ~ eval(wtint2yr)*(eval(w_M3_2009_2010)/(eval(w_M3_1999_2000))),
                                            F3 == 1 ~ eval(wtint2yr)*(eval(w_F3_2009_2010)/(eval(w_F3_1999_2000))),
                                            M4 == 1 ~ eval(wtint2yr)*(eval(w_M4_2009_2010)/(eval(w_M4_1999_2000))),
                                            F4 == 1 ~ eval(wtint2yr)*(eval(w_F4_2009_2010)/(eval(w_F4_1999_2000))),
                                            TRUE ~ NA_real_))


temp[[2]] = mutate(temp[[2]],wt = case_when(M1 == 1 ~ eval(wtint2yr)*(eval(w_M1_2009_2010)/(eval(w_M1_2001_2002))),
                                              F1 == 1 ~ eval(wtint2yr)*(eval(w_F1_2009_2010)/(eval(w_F1_2001_2002))),
                                              M2 == 1 ~ eval(wtint2yr)*(eval(w_M2_2009_2010)/(eval(w_M2_2001_2002))),
                                              F2 == 1 ~ eval(wtint2yr)*(eval(w_F2_2009_2010)/(eval(w_F2_2001_2002))),
                                              M3 == 1 ~ eval(wtint2yr)*(eval(w_M3_2009_2010)/(eval(w_M3_2001_2002))),
                                              F3 == 1 ~ eval(wtint2yr)*(eval(w_F3_2009_2010)/(eval(w_F3_2001_2002))),
                                              M4 == 1 ~ eval(wtint2yr)*(eval(w_M4_2009_2010)/(eval(w_M4_2001_2002))),
                                              F4 == 1 ~ eval(wtint2yr)*(eval(w_F4_2009_2010)/(eval(w_F4_2001_2002))),
                                              TRUE ~ NA_real_))

temp[[3]] = mutate(temp[[3]],wt = case_when(M1 == 1 ~ eval(wtint2yr)*(eval(w_M1_2009_2010)/(eval(w_M1_2003_2004))),
                                            F1 == 1 ~ eval(wtint2yr)*(eval(w_F1_2009_2010)/(eval(w_F1_2003_2004))),
                                            M2 == 1 ~ eval(wtint2yr)*(eval(w_M2_2009_2010)/(eval(w_M2_2003_2004))),
                                            F2 == 1 ~ eval(wtint2yr)*(eval(w_F2_2009_2010)/(eval(w_F2_2003_2004))),
                                            M3 == 1 ~ eval(wtint2yr)*(eval(w_M3_2009_2010)/(eval(w_M3_2003_2004))),
                                            F3 == 1 ~ eval(wtint2yr)*(eval(w_F3_2009_2010)/(eval(w_F3_2003_2004))),
                                            M4 == 1 ~ eval(wtint2yr)*(eval(w_M4_2009_2010)/(eval(w_M4_2003_2004))),
                                            F4 == 1 ~ eval(wtint2yr)*(eval(w_F4_2009_2010)/(eval(w_F4_2003_2004))),
                                            TRUE ~ NA_real_))

temp[[4]] = mutate(temp[[4]],wt = case_when(M1 == 1 ~ eval(wtint2yr)*(eval(w_M1_2009_2010)/(eval(w_M1_2005_2006))),
                                            F1 == 1 ~ eval(wtint2yr)*(eval(w_F1_2009_2010)/(eval(w_F1_2005_2006))),
                                            M2 == 1 ~ eval(wtint2yr)*(eval(w_M2_2009_2010)/(eval(w_M2_2005_2006))),
                                            F2 == 1 ~ eval(wtint2yr)*(eval(w_F2_2009_2010)/(eval(w_F2_2005_2006))),
                                            M3 == 1 ~ eval(wtint2yr)*(eval(w_M3_2009_2010)/(eval(w_M3_2005_2006))),
                                            F3 == 1 ~ eval(wtint2yr)*(eval(w_F3_2009_2010)/(eval(w_F3_2005_2006))),
                                            M4 == 1 ~ eval(wtint2yr)*(eval(w_M4_2009_2010)/(eval(w_M4_2005_2006))),
                                            F4 == 1 ~ eval(wtint2yr)*(eval(w_F4_2009_2010)/(eval(w_F4_2005_2006))),
                                            TRUE ~ NA_real_))
temp[[5]] = mutate(temp[[5]],wt = case_when(M1 == 1 ~ eval(wtint2yr)*(eval(w_M1_2009_2010)/(eval(w_M1_2007_2008))),
                                            F1 == 1 ~ eval(wtint2yr)*(eval(w_F1_2009_2010)/(eval(w_F1_2007_2008))),
                                            M2 == 1 ~ eval(wtint2yr)*(eval(w_M2_2009_2010)/(eval(w_M2_2007_2008))),
                                            F2 == 1 ~ eval(wtint2yr)*(eval(w_F2_2009_2010)/(eval(w_F2_2007_2008))),
                                            M3 == 1 ~ eval(wtint2yr)*(eval(w_M3_2009_2010)/(eval(w_M3_2007_2008))),
                                            F3 == 1 ~ eval(wtint2yr)*(eval(w_F3_2009_2010)/(eval(w_F3_2007_2008))),
                                            M4 == 1 ~ eval(wtint2yr)*(eval(w_M4_2009_2010)/(eval(w_M4_2007_2008))),
                                            F4 == 1 ~ eval(wtint2yr)*(eval(w_F4_2009_2010)/(eval(w_F4_2007_2008))),
                                            TRUE ~ NA_real_))

temp[[6]] = mutate(temp[[6]],wt = case_when(M1 == 1 ~ eval(wtint2yr)*(eval(w_M1_2009_2010)/(eval(w_M1_2009_2010))),
                                            F1 == 1 ~ eval(wtint2yr)*(eval(w_F1_2009_2010)/(eval(w_F1_2009_2010))),
                                            M2 == 1 ~ eval(wtint2yr)*(eval(w_M2_2009_2010)/(eval(w_M2_2009_2010))),
                                            F2 == 1 ~ eval(wtint2yr)*(eval(w_F2_2009_2010)/(eval(w_F2_2009_2010))),
                                            M3 == 1 ~ eval(wtint2yr)*(eval(w_M3_2009_2010)/(eval(w_M3_2009_2010))),
                                            F3 == 1 ~ eval(wtint2yr)*(eval(w_F3_2009_2010)/(eval(w_F3_2009_2010))),
                                            M4 == 1 ~ eval(wtint2yr)*(eval(w_M4_2009_2010)/(eval(w_M4_2009_2010))),
                                            F4 == 1 ~ eval(wtint2yr)*(eval(w_F4_2009_2010)/(eval(w_F4_2009_2010))),
                                            TRUE ~ NA_real_))

temp[[7]] = mutate(temp[[7]],wt = case_when(M1 == 1 ~ eval(wtint2yr)*(eval(w_M1_2009_2010)/(eval(w_M1_2011_2012))),
                                            F1 == 1 ~ eval(wtint2yr)*(eval(w_F1_2009_2010)/(eval(w_F1_2011_2012))),
                                            M2 == 1 ~ eval(wtint2yr)*(eval(w_M2_2009_2010)/(eval(w_M2_2011_2012))),
                                            F2 == 1 ~ eval(wtint2yr)*(eval(w_F2_2009_2010)/(eval(w_F2_2011_2012))),
                                            M3 == 1 ~ eval(wtint2yr)*(eval(w_M3_2009_2010)/(eval(w_M3_2011_2012))),
                                            F3 == 1 ~ eval(wtint2yr)*(eval(w_F3_2009_2010)/(eval(w_F3_2011_2012))),
                                            M4 == 1 ~ eval(wtint2yr)*(eval(w_M4_2009_2010)/(eval(w_M4_2011_2012))),
                                            F4 == 1 ~ eval(wtint2yr)*(eval(w_F4_2009_2010)/(eval(w_F4_2011_2012))),
                                            TRUE ~ NA_real_))

temp[[8]] = mutate(temp[[8]],wt = case_when(M1 == 1 ~ eval(wtint2yr)*(eval(w_M1_2009_2010)/(eval(w_M1_2013_2014))),
                                            F1 == 1 ~ eval(wtint2yr)*(eval(w_F1_2009_2010)/(eval(w_F1_2013_2014))),
                                            M2 == 1 ~ eval(wtint2yr)*(eval(w_M2_2009_2010)/(eval(w_M2_2013_2014))),
                                            F2 == 1 ~ eval(wtint2yr)*(eval(w_F2_2009_2010)/(eval(w_F2_2013_2014))),
                                            M3 == 1 ~ eval(wtint2yr)*(eval(w_M3_2009_2010)/(eval(w_M3_2013_2014))),
                                            F3 == 1 ~ eval(wtint2yr)*(eval(w_F3_2009_2010)/(eval(w_F3_2013_2014))),
                                            M4 == 1 ~ eval(wtint2yr)*(eval(w_M4_2009_2010)/(eval(w_M4_2013_2014))),
                                            F4 == 1 ~ eval(wtint2yr)*(eval(w_F4_2009_2010)/(eval(w_F4_2013_2014))),
                                            TRUE ~ NA_real_))

temp[[9]] = mutate(temp[[9]],wt = case_when(M1 == 1 ~ eval(wtint2yr)*(eval(w_M1_2009_2010)/(eval(w_M1_2015_2016))),
                                            F1 == 1 ~ eval(wtint2yr)*(eval(w_F1_2009_2010)/(eval(w_F1_2015_2016))),
                                            M2 == 1 ~ eval(wtint2yr)*(eval(w_M2_2009_2010)/(eval(w_M2_2015_2016))),
                                            F2 == 1 ~ eval(wtint2yr)*(eval(w_F2_2009_2010)/(eval(w_F2_2015_2016))),
                                            M3 == 1 ~ eval(wtint2yr)*(eval(w_M3_2009_2010)/(eval(w_M3_2015_2016))),
                                            F3 == 1 ~ eval(wtint2yr)*(eval(w_F3_2009_2010)/(eval(w_F3_2015_2016))),
                                            M4 == 1 ~ eval(wtint2yr)*(eval(w_M4_2009_2010)/(eval(w_M4_2015_2016))),
                                            F4 == 1 ~ eval(wtint2yr)*(eval(w_F4_2009_2010)/(eval(w_F4_2015_2016))),
                                            TRUE ~ NA_real_))

temp[[10]] = mutate(temp[[10]],wt = case_when(M1 == 1 ~ eval(wtint2yr)*(eval(w_M1_2009_2010)/(eval(w_M1_2017_2018))),
                                            F1 == 1 ~ eval(wtint2yr)*(eval(w_F1_2009_2010)/(eval(w_F1_2017_2018))),
                                            M2 == 1 ~ eval(wtint2yr)*(eval(w_M2_2009_2010)/(eval(w_M2_2017_2018))),
                                            F2 == 1 ~ eval(wtint2yr)*(eval(w_F2_2009_2010)/(eval(w_F2_2017_2018))),
                                            M3 == 1 ~ eval(wtint2yr)*(eval(w_M3_2009_2010)/(eval(w_M3_2017_2018))),
                                            F3 == 1 ~ eval(wtint2yr)*(eval(w_F3_2009_2010)/(eval(w_F3_2017_2018))),
                                            M4 == 1 ~ eval(wtint2yr)*(eval(w_M4_2009_2010)/(eval(w_M4_2017_2018))),
                                            F4 == 1 ~ eval(wtint2yr)*(eval(w_F4_2009_2010)/(eval(w_F4_2017_2018))),
                                            TRUE ~ NA_real_))


nhanes1999_2000 = temp[[1]]
nhanes2001_2002 = temp[[2]]
nhanes2003_2004 = temp[[3]]
nhanes2005_2006 = temp[[4]]
nhanes2007_2008 = temp[[5]]
nhanes2009_2010 = temp[[6]]
nhanes2011_2012 = temp[[7]]
nhanes2013_2014 = temp[[8]]
nhanes2015_2016 = temp[[9]]
nhanes2017_2018 = temp[[10]]






