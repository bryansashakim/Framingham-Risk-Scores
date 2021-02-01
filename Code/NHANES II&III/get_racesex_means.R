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

nhanesII_pooled$race_sex_sum = get_race_sex_sums %>% mapply(nhanesII_pooled$race,nhanesII_pooled$sex,nhanesII_pooled$age,nhanesII_pooled$hdl,nhanesII_pooled$lbxtc,nhanesII_pooled$asbp,nhanesII_pooled$curr_smq,nhanesII_pooled$isDiabetic)
nhanesII_pooled_means = nhanesII_pooled %>%
  group_by(race_sex_cat) %>%
  summarise_at(vars(race_sex_sum),              # Specify column
               list(name = mean))
nhanesII_pooled_means=nhanesII_pooled_means[,2]

nhanesIIIP1_pooled$race_sex_sum = get_race_sex_sums %>% mapply(nhanesIIIP1_pooled$race,nhanesIIIP1_pooled$sex,nhanesIIIP1_pooled$age,nhanesIIIP1_pooled$hdl,nhanesIIIP1_pooled$lbxtc,nhanesIIIP1_pooled$asbp,nhanesIIIP1_pooled$curr_smq,nhanesIIIP1_pooled$isDiabetic)
nhanesIIIP1_pooled_means = nhanesIIIP1_pooled %>%
  group_by(race_sex_cat) %>%
  summarise_at(vars(race_sex_sum),              # Specify column
               list(name = mean)) 
nhanesIIIP1_pooled_means=nhanesIIIP1_pooled_means[,2]

nhanesIIIP2_pooled$race_sex_sum = get_race_sex_sums %>% mapply(nhanesIIIP2_pooled$race,nhanesIIIP2_pooled$sex,nhanesIIIP2_pooled$age,nhanesIIIP2_pooled$hdl,nhanesIIIP2_pooled$lbxtc,nhanesIIIP2_pooled$asbp,nhanesIIIP2_pooled$curr_smq,nhanesIIIP2_pooled$isDiabetic)
# nhanesIIIP2_pooled = nhanesIIIP2_pooled %>% filter(!is.na(race_sex_cat))
# nhanesIIIP2_pooled$race_sex_sum2 = 0
# for (i in 1:length(nhanesIIIP2_pooled$race_sex_sum)) {
#   nhanesIIIP2_pooled$race_sex_sum2[i] = nhanesIIIP2_pooled$race_sex_sum[[i]]
# }
# nhanesIIIP2_pooled$race_sex_sum = nhanesIIIP2_pooled$race_sex_sum2

nhanesIIIP2_pooled_means = nhanesIIIP2_pooled %>%
  group_by(race_sex_cat) %>%
  summarise_at(vars(race_sex_sum),              # Specify column
               list(name = mean)) 
nhanesIIIP2_pooled_means=nhanesIIIP2_pooled_means[,2]



