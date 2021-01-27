# Race-Sex specific means
## assumes dataset has only Blacks and Whites
### White = 1 , Black =  2
### Male = 1 , Female = 2

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

nhanesII$race_sex_sum = get_race_sex_sums %>% mapply(nhanesII$RACE,nhanesII$SEX,nhanesII$AGEYR_AT_INT,nhanesII$lbdhdd,nhanesII$lbxtc,nhanesII$asbp,nhanesII$curr_smq,nhanesII$isDiabetic)
View(nhanesII %>% select(RACE,SEX,AGEYR_AT_INT,lbdhdd,lbxtc,asbp,curr_smq,isDiabetic,race_sex_cat,race_sex_sum))
nhanesII_means = nhanesII %>%
  group_by(race_sex_cat) %>%
  summarise_at(vars(race_sex_sum),              # Specify column
               list(name = mean))
nhanesII_means=nhanesII_means[,2]

nhanesIIIP1IP1$race_sex_sum = get_race_sex_sums %>% mapply(nhanesIIIP1$SEX,nhanesIIIP1$AGEYR_AT_INT,nhanesIIIP1$lbdhdd,nhanesIIIP1$lbxtc,nhanesIIIP1$asbp,nhanesIIIP1$curr_smq,nhanesIIIP1$isDiabetic)
nhanesIIIP1_means = nhanesIIIP1 %>%
  group_by(race_sex_cat) %>%
  summarise_at(vars(race_sex_sum),              # Specify column
               list(name = mean)) 
nhanesIIIP1_means=nhanesIIIP1_means[,2]

nhanesIIIP2IP1$race_sex_sum = get_race_sex_sums %>% mapply(nhanesIIIP2$HSSEX,nhanesIIIP2$HSAGEIR,nhanesIIIP2$HDP,nhanesIIIP2$TCP,nhanesIIIP2$asbp,nhanesIIIP2$curr_smq,nhanesIIIP2$isDiabetic)
nhanesIIIP2_means = nhanesIIIP2 %>%
  group_by(race_sex_cat) %>%
  summarise_at(vars(race_sex_sum),              # Specify column
               list(name = mean)) 
nhanesIIIP2_means=nhanesIIIP2_means[,2]



