nhanes1999_2000 = nhanes1999_2000 %>% mutate(MW = ifelse(race == 1 & sex == 1, 1, 0))
nhanes1999_2000 = nhanes1999_2000 %>% mutate(FW = ifelse(race == 1 & sex == 2, 1, 0))
nhanes1999_2000 = nhanes1999_2000 %>% mutate(MB = ifelse(race == 2 & sex == 1, 1, 0))
nhanes1999_2000 = nhanes1999_2000 %>% mutate(FB = ifelse(race == 2 & sex == 2, 1, 0))
nhanes1999_2000$race_sex_cat = ifelse(nhanes1999_2000$MW==1, 1, NA)
nhanes1999_2000$race_sex_cat[nhanes1999_2000$FW == 1] = 2
nhanes1999_2000$race_sex_cat[nhanes1999_2000$MB == 1] = 3
nhanes1999_2000$race_sex_cat[nhanes1999_2000$FB == 1] = 4

nhanes2001_2002 = nhanes2001_2002 %>% mutate(MW = ifelse(race == 1 & sex == 1, 1, 0))
nhanes2001_2002 = nhanes2001_2002 %>% mutate(FW = ifelse(race == 1 & sex == 2, 1, 0))
nhanes2001_2002 = nhanes2001_2002 %>% mutate(MB = ifelse(race == 2 & sex == 1, 1, 0))
nhanes2001_2002 = nhanes2001_2002 %>% mutate(FB = ifelse(race == 2 & sex == 2, 1, 0))
nhanes2001_2002$race_sex_cat = ifelse(nhanes2001_2002$MW==1, 1, NA)
nhanes2001_2002$race_sex_cat[nhanes2001_2002$FW == 1] = 2
nhanes2001_2002$race_sex_cat[nhanes2001_2002$MB == 1] = 3
nhanes2001_2002$race_sex_cat[nhanes2001_2002$FB == 1] = 4

nhanes2003_2004 = nhanes2003_2004 %>% mutate(MW = ifelse(race == 1 & sex == 1, 1, 0))
nhanes2003_2004 = nhanes2003_2004 %>% mutate(FW = ifelse(race == 1 & sex == 2, 1, 0))
nhanes2003_2004 = nhanes2003_2004 %>% mutate(MB = ifelse(race == 2 & sex == 1, 1, 0))
nhanes2003_2004 = nhanes2003_2004 %>% mutate(FB = ifelse(race == 2 & sex == 2, 1, 0))
nhanes2003_2004$race_sex_cat = ifelse(nhanes2003_2004$MW==1, 1, NA)
nhanes2003_2004$race_sex_cat[nhanes2003_2004$FW == 1] = 2
nhanes2003_2004$race_sex_cat[nhanes2003_2004$MB == 1] = 3
nhanes2003_2004$race_sex_cat[nhanes2003_2004$FB == 1] = 4

nhanes2005_2006 = nhanes2005_2006 %>% mutate(MW = ifelse(race == 1 & sex == 1, 1, 0))
nhanes2005_2006 = nhanes2005_2006 %>% mutate(FW = ifelse(race == 1 & sex == 2, 1, 0))
nhanes2005_2006 = nhanes2005_2006 %>% mutate(MB = ifelse(race == 2 & sex == 1, 1, 0))
nhanes2005_2006 = nhanes2005_2006 %>% mutate(FB = ifelse(race == 2 & sex == 2, 1, 0))
nhanes2005_2006$race_sex_cat = ifelse(nhanes2005_2006$MW==1, 1, NA)
nhanes2005_2006$race_sex_cat[nhanes2005_2006$FW == 1] = 2
nhanes2005_2006$race_sex_cat[nhanes2005_2006$MB == 1] = 3
nhanes2005_2006$race_sex_cat[nhanes2005_2006$FB == 1] = 4

nhanes2007_2008 = nhanes2007_2008 %>% mutate(MW = ifelse(race == 1 & sex == 1, 1, 0))
nhanes2007_2008 = nhanes2007_2008 %>% mutate(FW = ifelse(race == 1 & sex == 2, 1, 0))
nhanes2007_2008 = nhanes2007_2008 %>% mutate(MB = ifelse(race == 2 & sex == 1, 1, 0))
nhanes2007_2008 = nhanes2007_2008 %>% mutate(FB = ifelse(race == 2 & sex == 2, 1, 0))
nhanes2007_2008$race_sex_cat = ifelse(nhanes2007_2008$MW==1, 1, NA)
nhanes2007_2008$race_sex_cat[nhanes2007_2008$FW == 1] = 2
nhanes2007_2008$race_sex_cat[nhanes2007_2008$MB == 1] = 3
nhanes2007_2008$race_sex_cat[nhanes2007_2008$FB == 1] = 4

nhanes2009_2010 = nhanes2009_2010 %>% mutate(MW = ifelse(race == 1 & sex == 1, 1, 0))
nhanes2009_2010 = nhanes2009_2010 %>% mutate(FW = ifelse(race == 1 & sex == 2, 1, 0))
nhanes2009_2010 = nhanes2009_2010 %>% mutate(MB = ifelse(race == 2 & sex == 1, 1, 0))
nhanes2009_2010 = nhanes2009_2010 %>% mutate(FB = ifelse(race == 2 & sex == 2, 1, 0))
nhanes2009_2010$race_sex_cat = ifelse(nhanes2009_2010$MW==1, 1, NA)
nhanes2009_2010$race_sex_cat[nhanes2009_2010$FW == 1] = 2
nhanes2009_2010$race_sex_cat[nhanes2009_2010$MB == 1] = 3
nhanes2009_2010$race_sex_cat[nhanes2009_2010$FB == 1] = 4

nhanes2011_2012 = nhanes2011_2012 %>% mutate(MW = ifelse(race == 1 & sex == 1, 1, 0))
nhanes2011_2012 = nhanes2011_2012 %>% mutate(FW = ifelse(race == 1 & sex == 2, 1, 0))
nhanes2011_2012 = nhanes2011_2012 %>% mutate(MB = ifelse(race == 2 & sex == 1, 1, 0))
nhanes2011_2012 = nhanes2011_2012 %>% mutate(FB = ifelse(race == 2 & sex == 2, 1, 0))
nhanes2011_2012$race_sex_cat = ifelse(nhanes2011_2012$MW==1, 1, NA)
nhanes2011_2012$race_sex_cat[nhanes2011_2012$FW == 1] = 2
nhanes2011_2012$race_sex_cat[nhanes2011_2012$MB == 1] = 3
nhanes2011_2012$race_sex_cat[nhanes2011_2012$FB == 1] = 4

nhanes2013_2014 = nhanes2013_2014 %>% mutate(MW = ifelse(race == 1 & sex == 1, 1, 0))
nhanes2013_2014 = nhanes2013_2014 %>% mutate(FW = ifelse(race == 1 & sex == 2, 1, 0))
nhanes2013_2014 = nhanes2013_2014 %>% mutate(MB = ifelse(race == 2 & sex == 1, 1, 0))
nhanes2013_2014 = nhanes2013_2014 %>% mutate(FB = ifelse(race == 2 & sex == 2, 1, 0))
nhanes2013_2014$race_sex_cat = ifelse(nhanes2013_2014$MW==1, 1, NA)
nhanes2013_2014$race_sex_cat[nhanes2013_2014$FW == 1] = 2
nhanes2013_2014$race_sex_cat[nhanes2013_2014$MB == 1] = 3
nhanes2013_2014$race_sex_cat[nhanes2013_2014$FB == 1] = 4

nhanes2015_2016 = nhanes2015_2016 %>% mutate(MW = ifelse(race == 1 & sex == 1, 1, 0))
nhanes2015_2016 = nhanes2015_2016 %>% mutate(FW = ifelse(race == 1 & sex == 2, 1, 0))
nhanes2015_2016 = nhanes2015_2016 %>% mutate(MB = ifelse(race == 2 & sex == 1, 1, 0))
nhanes2015_2016 = nhanes2015_2016 %>% mutate(FB = ifelse(race == 2 & sex == 2, 1, 0))
nhanes2015_2016$race_sex_cat = ifelse(nhanes2015_2016$MW==1, 1, NA)
nhanes2015_2016$race_sex_cat[nhanes2015_2016$FW == 1] = 2
nhanes2015_2016$race_sex_cat[nhanes2015_2016$MB == 1] = 3
nhanes2015_2016$race_sex_cat[nhanes2015_2016$FB == 1] = 4

nhanes2017_2018 = nhanes2017_2018 %>% mutate(MW = ifelse(race == 1 & sex == 1, 1, 0))
nhanes2017_2018 = nhanes2017_2018 %>% mutate(FW = ifelse(race == 1 & sex == 2, 1, 0))
nhanes2017_2018 = nhanes2017_2018 %>% mutate(MB = ifelse(race == 2 & sex == 1, 1, 0))
nhanes2017_2018 = nhanes2017_2018 %>% mutate(FB = ifelse(race == 2 & sex == 2, 1, 0))
nhanes2017_2018$race_sex_cat = ifelse(nhanes2017_2018$MW==1, 1, NA)
nhanes2017_2018$race_sex_cat[nhanes2017_2018$FW == 1] = 2
nhanes2017_2018$race_sex_cat[nhanes2017_2018$MB == 1] = 3
nhanes2017_2018$race_sex_cat[nhanes2017_2018$FB == 1] = 4


get_race_sex_sums = function(race,sex,age,hdl,totchol,asbp,smoker,diabetic) {
  #### MALES ####
  if (sex == 1 & race == 1) {
    sum = sum((mwhite_coeff[[1]]*log(age)),(mwhite_coeff[[2]]*log(totchol)),(mwhite_coeff[[3]]*log(totchol)*log(age)),(mwhite_coeff[[4]]*log(hdl)),(mwhite_coeff[[5]]*log(hdl)*log(age)),(mwhite_coeff[[6]]*log(asbp)),(mwhite_coeff[[7]]*smoker),(mwhite_coeff[[8]]*smoker*log(age)),(mwhite_coeff[[9]]*diabetic))
  }
  else if (sex==1 & race == 2){
    sum = sum((mblack_coeff[[1]]*log(age)),(mblack_coeff[[2]]*log(totchol)),(mblack_coeff[[3]]*log(hdl)),(mblack_coeff[[4]]*log(asbp)),(mblack_coeff[[5]]*smoker),(mblack_coeff[[6]]*diabetic))
  }
  #### FEMALES ####
  else if (sex==2 & race == 1){
    sum = sum((fwhite_coeff[[1]]*log(age)),(fwhite_coeff[[2]]*log(age)^2),(fwhite_coeff[[3]]*log(totchol)),(fwhite_coeff[[4]]*log(totchol)*log(age)),(fwhite_coeff[[5]]*log(hdl)),(fwhite_coeff[[6]]*log(hdl)*log(age)),(fwhite_coeff[[7]]*log(asbp)),(fwhite_coeff[[8]]*smoker),(fwhite_coeff[[9]]*smoker*log(age)),(fwhite_coeff[[10]]*diabetic))
  }
  else if (sex==2 & race == 2){
    sum = sum((fblack_coeff[[1]]*log(age)),(fblack_coeff[[2]]*log(totchol)),(fblack_coeff[[3]]*log(hdl)),(fblack_coeff[[4]]*log(hdl)*log(age)),(fblack_coeff[[5]]*log(asbp)),(fblack_coeff[[6]]*log(asbp)*log(age)),(fblack_coeff[[7]]*smoker),(fblack_coeff[[8]]*diabetic))
  }
  return(sum)
}

nhanes1999_2000$race_sex_sum = get_race_sex_sums %>% mapply(nhanes1999_2000$race,nhanes1999_2000$sex,nhanes1999_2000$age,nhanes1999_2000$hdl,nhanes1999_2000$lbxtc,nhanes1999_2000$asbp,nhanes1999_2000$curr_smq,nhanes1999_2000$isDiabetic)
nhanes1999_2000_means = nhanes1999_2000 %>%
  group_by(race_sex_cat) %>%
  summarise_at(vars(race_sex_sum),              # Specify column
               list(name = mean))
nhanes1999_2000_means=nhanes1999_2000_means[,2]

nhanes2001_2002$race_sex_sum = get_race_sex_sums %>% mapply(nhanes2001_2002$race,nhanes2001_2002$sex,nhanes2001_2002$age,nhanes2001_2002$hdl,nhanes2001_2002$lbxtc,nhanes2001_2002$asbp,nhanes2001_2002$curr_smq,nhanes2001_2002$isDiabetic)
nhanes2001_2002_means = nhanes2001_2002 %>%
  group_by(race_sex_cat) %>%
  summarise_at(vars(race_sex_sum),              # Specify column
               list(name = mean))
nhanes2001_2002_means=nhanes2001_2002_means[,2]

nhanes2003_2004$race_sex_sum = get_race_sex_sums %>% mapply(nhanes2003_2004$race,nhanes2003_2004$sex,nhanes2003_2004$age,nhanes2003_2004$hdl,nhanes2003_2004$lbxtc,nhanes2003_2004$asbp,nhanes2003_2004$curr_smq,nhanes2003_2004$isDiabetic)
nhanes2003_2004_means = nhanes2003_2004 %>%
  group_by(race_sex_cat) %>%
  summarise_at(vars(race_sex_sum),              # Specify column
               list(name = mean))
nhanes2003_2004_means=nhanes2003_2004_means[,2]

nhanes2005_2006$race_sex_sum = get_race_sex_sums %>% mapply(nhanes2005_2006$race,nhanes2005_2006$sex,nhanes2005_2006$age,nhanes2005_2006$hdl,nhanes2005_2006$lbxtc,nhanes2005_2006$asbp,nhanes2005_2006$curr_smq,nhanes2005_2006$isDiabetic)
nhanes2005_2006_means = nhanes2005_2006 %>%
  group_by(race_sex_cat) %>%
  summarise_at(vars(race_sex_sum),              # Specify column
               list(name = mean))
nhanes2005_2006_means=nhanes2005_2006_means[,2]

nhanes2007_2008$race_sex_sum = get_race_sex_sums %>% mapply(nhanes2007_2008$race,nhanes2007_2008$sex,nhanes2007_2008$age,nhanes2007_2008$hdl,nhanes2007_2008$lbxtc,nhanes2007_2008$asbp,nhanes2007_2008$curr_smq,nhanes2007_2008$isDiabetic)
nhanes2007_2008_means = nhanes2007_2008 %>%
  group_by(race_sex_cat) %>%
  summarise_at(vars(race_sex_sum),              # Specify column
               list(name = mean))
nhanes2007_2008_means=nhanes2007_2008_means[,2]

nhanes2009_2010$race_sex_sum = get_race_sex_sums %>% mapply(nhanes2009_2010$race,nhanes2009_2010$sex,nhanes2009_2010$age,nhanes2009_2010$hdl,nhanes2009_2010$lbxtc,nhanes2009_2010$asbp,nhanes2009_2010$curr_smq,nhanes2009_2010$isDiabetic)
nhanes2009_2010_means = nhanes2009_2010 %>%
  group_by(race_sex_cat) %>%
  summarise_at(vars(race_sex_sum),              # Specify column
               list(name = mean))
nhanes2009_2010_means=nhanes2009_2010_means[,2]

nhanes2011_2012$race_sex_sum = get_race_sex_sums %>% mapply(nhanes2011_2012$race,nhanes2011_2012$sex,nhanes2011_2012$age,nhanes2011_2012$hdl,nhanes2011_2012$lbxtc,nhanes2011_2012$asbp,nhanes2011_2012$curr_smq,nhanes2011_2012$isDiabetic)
nhanes2011_2012_means = nhanes2011_2012 %>%
  group_by(race_sex_cat) %>%
  summarise_at(vars(race_sex_sum),              # Specify column
               list(name = mean))
nhanes2011_2012_means=nhanes2011_2012_means[,2]

nhanes2013_2014$race_sex_sum = get_race_sex_sums %>% mapply(nhanes2013_2014$race,nhanes2013_2014$sex,nhanes2013_2014$age,nhanes2013_2014$hdl,nhanes2013_2014$lbxtc,nhanes2013_2014$asbp,nhanes2013_2014$curr_smq,nhanes2013_2014$isDiabetic)
nhanes2013_2014_means = nhanes2013_2014 %>%
  group_by(race_sex_cat) %>%
  summarise_at(vars(race_sex_sum),              # Specify column
               list(name = mean))
nhanes2013_2014_means=nhanes2013_2014_means[,2]

nhanes2015_2016$race_sex_sum = get_race_sex_sums %>% mapply(nhanes2015_2016$race,nhanes2015_2016$sex,nhanes2015_2016$age,nhanes2015_2016$hdl,nhanes2015_2016$lbxtc,nhanes2015_2016$asbp,nhanes2015_2016$curr_smq,nhanes2015_2016$isDiabetic)
nhanes2015_2016_means = nhanes2015_2016 %>%
  group_by(race_sex_cat) %>%
  summarise_at(vars(race_sex_sum),              # Specify column
               list(name = mean))
nhanes2015_2016_means=nhanes2015_2016_means[,2]

nhanes2017_2018$race_sex_sum = get_race_sex_sums %>% mapply(nhanes2017_2018$race,nhanes2017_2018$sex,nhanes2017_2018$age,nhanes2017_2018$hdl,nhanes2017_2018$lbxtc,nhanes2017_2018$asbp,nhanes2017_2018$curr_smq,nhanes2017_2018$isDiabetic)
nhanes2017_2018_means = nhanes2017_2018 %>%
  group_by(race_sex_cat) %>%
  summarise_at(vars(race_sex_sum),              # Specify column
               list(name = mean))
nhanes2017_2018_means=nhanes2017_2018_means[,2]
