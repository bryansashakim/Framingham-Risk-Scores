temp=list(nhanesII_pooled)
temp = temp %>% lapply(function(x) {mutate(x, M1 = ifelse(AGEYR_AT_INT >= 45 & AGEYR_AT_INT <= 54 & SEX == 1, 1, 0))})
temp = temp %>% lapply(function(x) {mutate(x, M1 = ifelse(AGEYR_AT_INT >= 45 & AGEYR_AT_INT <= 54 & SEX == 1, 1, 0))})
temp = temp %>% lapply(function(x) {mutate(x, F1 = ifelse(AGEYR_AT_INT >= 45 & AGEYR_AT_INT <= 54 & SEX == 2, 1, 0))})
# 55-64, MALES & FEMALES
temp = temp %>% lapply(function(x) {mutate(x, M2 = ifelse(AGEYR_AT_INT >= 55 & AGEYR_AT_INT <= 64 & SEX == 1, 1, 0))})
temp = temp %>% lapply(function(x) {mutate(x, F2 = ifelse(AGEYR_AT_INT >= 55 & AGEYR_AT_INT <= 64 & SEX == 2, 1, 0))})
# 65-74, MALES & FEMALES
temp = temp %>% lapply(function(x) {mutate(x, M3 = ifelse(AGEYR_AT_INT >= 65 & AGEYR_AT_INT <= 74 & SEX == 1, 1, 0))})
temp = temp %>% lapply(function(x) {mutate(x, F3 = ifelse(AGEYR_AT_INT >= 65 & AGEYR_AT_INT <= 74 & SEX == 2, 1, 0))})
# 75+, MALES & FEMALES
#temp = temp %>% lapply(function(x) {mutate(x, M4 = ifelse(AGEYR_AT_INT >= 75 & SEX == 1, 1, 0))})
#temp = temp %>% lapply(function(x) {mutate(x, F4 = ifelse(AGEYR_AT_INT >= 75 & SEX == 2, 1, 0))})

year="nhanesII_pooled"
for (sex in c("M","F")) {
  for (cat in c(1,2,3)) {
    assign(paste("w_",sex,cat,"_",year,sep = ""),temp[[1]] %>% filter(eval(parse(text = paste(sex,cat,sep=""))) == 1) %>% select(exam_final_wt) %>% sum)
  }
}


temp[[1]] = mutate(temp[[1]],wt = case_when(M1 == 1 ~ eval(exam_final_wt)*(eval(w_M1_2009_2010)/(eval(w_M1_nhanesIIIP2))),
                                            F1 == 1 ~ eval(exam_final_wt)*(eval(w_F1_2009_2010)/(eval(w_F1_nhanesIIIP2))),
                                            M2 == 1 ~ eval(exam_final_wt)*(eval(w_M2_2009_2010)/(eval(w_M2_nhanesIIIP2))),
                                            F2 == 1 ~ eval(exam_final_wt)*(eval(w_F2_2009_2010)/(eval(w_F2_nhanesIIIP2))),
                                            M3 == 1 ~ eval(exam_final_wt)*(eval(w_M3_2009_2010)/(eval(w_M3_nhanesIIIP2))),
                                            F3 == 1 ~ eval(exam_final_wt)*(eval(w_F3_2009_2010)/(eval(w_F3_nhanesIIIP2))),
                                            #M4 == 1 ~ eval(exam_final_wt)*(eval(w_M4_2009_2010)/(eval(w_M4_nhanesIIIP2))),
                                            #F4 == 1 ~ eval(exam_final_wt)*(eval(w_F4_2009_2010)/(eval(w_F4_nhanesIIIP2))),
                                            TRUE ~ NA_real_))

nhanesII_pooled=temp[[1]]