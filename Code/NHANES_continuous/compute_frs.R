### Required packages ###
library(ggplot2); library(dplyr); library(tidyr);library(haven);library(readstata13);library(foreign);library(mice);library(MatchIt);library(stringdist);library(RecordLinkage);library(modelr)
### Parameters ###
f_base10 = 0.95012 # baseline 10-year survival for females
m_base10 = 0.88936 # baseline 10-year survival for males

f_rf <- list(log_age = 2.32888, log_hdl = -0.70833,log_totchol = 1.20904,log_SBP = 2.82263,Smoking = 0.52873,Diabetes = 0.69154) #  log of hazard ratio for each risk factor for females
m_rf <- list(log_age = 3.06117, log_hdl = -0.93263,log_totchol = 1.12370,log_SBP = 1.99881,Smoking = 0.65451,Diabetes = 0.57367) #  log of hazard ratio for each risk factor for males 
m_log_age = 3.06117; m_log_hdl = -0.93263;m_log_totchol = 1.12370;m_log_SBP = 1.99881;m_Smoking = 0.65451;m_Diabetes = 0.57367 #  log of hazard ratio for each risk factor for males 
f_log_age = 2.32888; f_log_hdl = -0.70833;f_log_totchol = 1.20904;f_log_SBP = 2.82263;f_Smoking = 0.52873;f_Diabetes = 0.69154 #  log of hazard ratio for each risk factor for females

betas <- list(f=f_rf,m=m_rf) # nested list of f_rf and m_rf

f_points=data.frame("points"=seq(-3,12),"age_low"=c(NA,NA,NA,30,NA,35,NA,40,45,NA,50,55,60,65,70,75),"age_high"=c(NA,NA,NA,34,NA,39,NA,44,49,NA,54,59,64,69,74,120),"HDL_low"=c(NA,60,50,45,35,0,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA),"HDL_high"=c(NA,1000,59,49,44,35,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA),"TotChol_low"=c(NA,NA,NA,0,160,NA,200,240,280,NA,NA,NA,NA,NA,NA,NA),"TotChol_high"=c(NA,NA,NA,160,199,NA,239,279,1000,NA,NA,NA,NA,NA,NA,NA), "SBP_low"=c(NA,NA,0,NA,NA,NA,120,130,NA,140,150,160,NA,NA,NA,NA),"SBP_high"=c(NA,NA,120,NA,NA,NA,129,139,NA,149,159,1000,NA,NA,NA,NA), "Smoker"=c(NA,NA,NA,"No",NA,NA,"Yes",NA,NA,NA,NA,NA,NA,NA,NA,NA), "Diabetic"=c(NA,NA,NA,"No",NA,NA,NA,"Yes",NA,NA,NA,NA,NA,NA,NA,NA))
m_points=data.frame("points"=seq(-2,15),"age_low"=c(NA,NA,30,NA,35,NA,NA,40,45,NA,50,NA,55,60,65,NA,70,75),"age_high"=c(NA,NA,34,NA,39,NA,NA,44,49,NA,54,NA,59,64,69,NA,74,120),"HDL_low"=c(60,50,45,35,0,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA),"HDL_high"=c(1000,59,49,44,35,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA),"TotChol_low"=c(NA,NA,0,160,200,240,280,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA),"TotChol_high"=c(NA,NA,160,199,239,279,1000,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA), "SBP_low"=c(NA,NA,0,NA,120,130,140,160,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA),"SBP_high"=c(NA,NA,120,NA,129,139,149,1000,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA), "Smoker"=c(NA,NA,"No",NA,NA,NA,"Yes",NA,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA), "Diabetic"=c(NA,NA,"No",NA,NA,"Yes",NA,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA))


################################################################################################################################################################
# This gets the row where the input (30 in this example) satisfies the condition that it is between the age_low and age_high columns of the data frame f_points
i=sapply(30, function(p) { which(f_points$age_low <= p & f_points$age_high >= p)})
# Delete all rows except row "i"
keep_df=f_points[-(setdiff(1:16,i)),]
################################################################################################################################################################

get_frs = function(riagendr,ridageyr,HDL,TotChol,sbp,smoker,diabetic) {
  list_pts=c() # Initiate list of points
  #### MALES ####
  if (riagendr == 1) {
    ## GET POINTS FROM AGE ##
    i=sapply(ridageyr, function(p) { which(m_points$age_low <= p & m_points$age_high >= p)}); keep_df=m_points[-(setdiff(1:length(m_points$points),i)),];m_age <<- keep_df[[1]]
    list_pts=append(list_pts,keep_df[[1]]) 
    ## GET POINTS FROM HDL ##
    i=sapply(HDL, function(p) { which(m_points$HDL_low <= p & m_points$HDL_high >= p)}); keep_df=m_points[-(setdiff(1:length(m_points$points),i)),];m_HDL <<- keep_df[[1]]
    list_pts=append(list_pts,keep_df[[1]])
    ## GET POINTS FROM TOTAL CHOLESTEROL ##
    i=sapply(TotChol, function(p) { which(m_points$TotChol_low <= p & m_points$TotChol_high >= p)}); keep_df=m_points[-(setdiff(1:length(m_points$points),i)),];m_TotChol <<- keep_df[[1]]
    list_pts=append(list_pts,keep_df[[1]])
    ## GET POINTS FROM SBP ##
    i=sapply(sbp, function(p) { which(m_points$SBP_low <= p & m_points$SBP_high >= p)}); keep_df=m_points[-(setdiff(1:length(m_points$points),i)),];m_SBP <<- keep_df[[1]]
    list_pts=append(list_pts,keep_df[[1]])
    ## GET POINTS FROM SMOKER ##
    if (isTRUE(smoker == 2)) {list_pts=append(list_pts,0)} else {list_pts=append(list_pts,4)}
    # m_smoke <<- 4
    ## GET POINTS FROM DIABETIC ##
    # if (isTRUE(diabetic < 6.5)) {list_pts=append(list_pts,0)} else {list_pts=append(list_pts,3)}
    if (isTRUE(diabetic >= 126)) {list_pts=append(list_pts,3)} else {list_pts=append(list_pts,0)}
    # m_diabetic <<- 3
  }
  #### FEMALES ####
  else {
    ## GET POINTS FROM AGE ##
    i=sapply(ridageyr, function(p) { which(f_points$age_low <= p & f_points$age_high >= p)}); keep_df=f_points[-(setdiff(1:length(f_points$points),i)),];f_age <<- keep_df[[1]]
    list_pts=append(list_pts,keep_df[[1]]) 
    ## GET POINTS FROM HDL ##
    i=sapply(HDL, function(p) { which(f_points$HDL_low <= p & f_points$HDL_high >= p)}); keep_df=f_points[-(setdiff(1:length(f_points$points),i)),];f_HDL <<- keep_df[[1]]
    list_pts=append(list_pts,keep_df[[1]])
    ## GET POINTS FROM TOTAL CHOLESTEROL ##
    i=sapply(TotChol, function(p) { which(f_points$TotChol_low <= p & f_points$TotChol_high >= p)}); keep_df=f_points[-(setdiff(1:length(f_points$points),i)),];f_TotChol <<- keep_df[[1]]
    list_pts=append(list_pts,keep_df[[1]])
    ## GET POINTS FROM SBP ##
    i=sapply(sbp, function(p) { which(f_points$SBP_low <= p & f_points$SBP_high >= p)}); keep_df=f_points[-(setdiff(1:length(f_points$points),i)),];f_SBP <<- keep_df[[1]]
    list_pts=append(list_pts,keep_df[[1]])
    ## GET POINTS FROM SMOKER ##
    if (isTRUE(smoker == 2)) {list_pts=append(list_pts,0)} else {list_pts=append(list_pts,3)}
    # f_smoke <<- 3
    ## GET POINTS FROM DIABETIC ##
    # if (isTRUE(diabetic <  6.5)) {list_pts=append(list_pts,0)} else {list_pts=append(list_pts,4)}
    if (isTRUE(diabetic >= 126)) {list_pts=append(list_pts,4)} else {list_pts=append(list_pts,0)}
    # f_diabetic <<- 4
  }
  return(sum(list_pts))
}
