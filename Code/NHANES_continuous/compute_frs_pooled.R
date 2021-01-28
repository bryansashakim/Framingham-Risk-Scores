
# Pooled Cohort

## equation for pooled cohort model


# Beta Coefficients
##  beta coeff for females whites
fwhite_coeff <- list(log_age = -29.799,log_agesq = 4.884,log_totchol = 13.540,log_agextotchol = -3.114,log_hdl = -13.578, log_agexhdl = 3.149,log_SBP = 2.019,curr_smq = 7.574,log_agexcurr_smq = -1.665,Diabetes = 0.661)
##  beta coeff for males whites
### ** __males dont have age^2 factor__ **
mwhite_coeff <- list(log_age = 12.344,log_totchol = 11.853,log_agextotchol = -2.664,log_hdl = -7.990, log_agexhdl = 1.769	,log_SBP = 1.797,curr_smq = 7.837	,log_agexcurr_smq = -1.795,Diabetes = 0.658)
##  beta coeff for females Blacks
fblack_coeff <- list(log_age = 17.114,log_totchol = 0.940,log_hdl = -18.920, log_agexhdl = 4.475,log_SBP = 29.291,log_agexsbp = -6.432,curr_smq = 0.691,Diabetes = 0.874)
##  beta coeff for males Blacks
### ** __males dont have age^2 factor__ **
mblack_coeff <- list(log_age = 2.469,log_totchol = 0.302,log_hdl = -0.307,log_SBP = 1.916,curr_smq = 0.549,Diabetes = 0.645)

# 10-year Baseline Survival rate 
## females
f_base10 = 0.9665
## males
m_base10 = 0.9144	

# males and whites
sum_MW = function(age,hdl,totchol,asbp,smoker,diabetic) {
  sum = sum((mwhite_coeff[[1]]*log(age)),(mwhite_coeff[[2]]*log(totchol)),(mwhite_coeff[[3]]*log(totchol)*log(age)),(mwhite_coeff[[4]]*log(hdl)),(mwhite_coeff[[5]]*log(hdl)*log(age)),(mwhite_coeff[[6]]*log(asbp)),(mwhite_coeff[[7]]*smoker),(mwhite_coeff[[8]]*smoker*log(age)),(mwhite_coeff[[9]]*diabetic))
  return(sum)
}
# males and blacks
sum_MB = function(age,hdl,totchol,asbp,smoker,diabetic) {
  sum = sum(mblack_coeff[[1]]*log(age),mblack_coeff[[2]]*log(totchol),mblack_coeff[[3]]*log(hdl),mblack_coeff[[4]]*log(asbp),mblack_coeff[[5]]*smoker,mblack_coeff[[6]]*diabetic)
  return(sum)
}
# females and whites
sum_FW = function(age,hdl,totchol,asbp,smoker,diabetic) {
  sum = sum((fwhite_coeff[[1]]*log(age)),(fwhite_coeff[[2]]*log(age)^2),(fwhite_coeff[[3]]*log(totchol)),(fwhite_coeff[[4]]*log(totchol)*log(age)),(fwhite_coeff[[5]]*log(hdl)),(fwhite_coeff[[6]]*log(hdl)*log(age)),(fwhite_coeff[[7]]*log(asbp)),(fwhite_coeff[[8]]*smoker),(fwhite_coeff[[9]]*smoker*log(age)),(fwhite_coeff[[10]]*diabetic))
  return(sum)
}
# females and blakcs
sum_FB = function(age,hdl,totchol,asbp,smoker,diabetic) {
  sum = sum((fblack_coeff[[1]]*log(age)),(fblack_coeff[[2]]*log(totchol)),(fblack_coeff[[3]]*log(hdl)),(fblack_coeff[[4]]*log(hdl)*log(age)),(fblack_coeff[[5]]*log(asbp)),(fblack_coeff[[6]]*log(asbp)*log(age)),(fblack_coeff[[7]]*smoker),(fblack_coeff[[8]]*diabetic))
  return(sum)
}


get_pooled_frs = function(survey,sex,race,age,hdl,totchol,asbp,smoker,diabetic) {
  #### MALES ####
  if (sex == 1 & race == 1) {
    ind_sum = sum_MW(age,hdl,totchol,asbp,smoker,diabetic)#;print(ind_sum)#;print(get(paste0(survey,"_means"))[1,1])
    int = ind_sum - get(paste0(survey,"_means"))[1,1]
    rho = 1 - (m_base10^(exp(int)))
  }
  else if (sex == 1 & race == 2) {
    ind_sum = sum_MB(age,hdl,totchol,asbp,smoker,diabetic)#;print(ind_sum)
    int = ind_sum - get(paste0(survey,"_means"))[3,1]#;print(int);print(get(paste0(survey,"_means"))[3,1])
    rho = 1 - (m_base10^(exp(int)))
  }
  #### FEMALES ####
  else if (sex==2 & race==1){
    ind_sum = sum_FW(age,hdl,totchol,asbp,smoker,diabetic)#;print(ind_sum);print(get(paste0(survey,"_means"))[2,1])
    int = ind_sum - get(paste0(survey,"_means"))[2,1]#;print(int)
    rho = 1 - (f_base10^(exp(int)))
  }
  else if (sex==2 & race==2){
    ind_sum = sum_FB(age,hdl,totchol,asbp,smoker,diabetic)#;print(ind_sum);print(get(paste0(survey,"_means"))[4,1])
    int = ind_sum - get(paste0(survey,"_means"))[4,1]
    rho = 1 - (f_base10^(exp(int)))
  }
  
  return(rho*100)
}

