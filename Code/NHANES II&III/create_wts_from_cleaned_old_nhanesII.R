temp=list(nhanesII)
temp = temp %>% lapply(function(x) {mutate(x, M1 = ifelse(age >= 45 & age <= 54 & sex == 1, 1, 0))})
temp = temp %>% lapply(function(x) {mutate(x, M1 = ifelse(age >= 45 & age <= 54 & sex == 1, 1, 0))})
temp = temp %>% lapply(function(x) {mutate(x, F1 = ifelse(age >= 45 & age <= 54 & sex == 2, 1, 0))})
# 55-64, MALES & FEMALES
temp = temp %>% lapply(function(x) {mutate(x, M2 = ifelse(age >= 55 & age <= 64 & sex == 1, 1, 0))})
temp = temp %>% lapply(function(x) {mutate(x, F2 = ifelse(age >= 55 & age <= 64 & sex == 2, 1, 0))})
# 65-74, MALES & FEMALES
temp = temp %>% lapply(function(x) {mutate(x, M3 = ifelse(age >= 65 & age <= 74 & sex == 1, 1, 0))})
temp = temp %>% lapply(function(x) {mutate(x, F3 = ifelse(age >= 65 & age <= 74 & sex == 2, 1, 0))})
# 75+, MALES & FEMALES
#temp = temp %>% lapply(function(x) {mutate(x, M4 = ifelse(age >= 75 & sex == 1, 1, 0))})
#temp = temp %>% lapply(function(x) {mutate(x, F4 = ifelse(age >= 75 & sex == 2, 1, 0))})

# year="nhanesII"
# for (sex in c("M","F")) {
#   for (cat in c(1,2,3)) {
#     assign(paste("w_",sex,cat,"_",year,sep = ""),temp[[1]] %>% filter(eval(parse(text = paste(sex,cat,sep=""))) == 1) %>% select(exam_final_wt) %>% sum)
#   }
# }
nhanesII=temp[[1]]
w_M1_nhanesII = temp[[1]] %>% filter(M1 == 1) %>% select(exam_final_wt) %>% sum
w_F1_nhanesII = temp[[1]] %>% filter(F1 == 1) %>% select(exam_final_wt) %>% sum
w_M2_nhanesII = temp[[1]] %>% filter(M2 == 1) %>% select(exam_final_wt) %>% sum
w_F2_nhanesII = temp[[1]] %>% filter(F2 == 1) %>% select(exam_final_wt) %>% sum
w_M3_nhanesII = temp[[1]] %>% filter(M3 == 1) %>% select(exam_final_wt) %>% sum
w_F3_nhanesII = temp[[1]] %>% filter(F3 == 1) %>% select(exam_final_wt) %>% sum

temp=list(nhanesII)


temp[[1]] = mutate(temp[[1]],wt = case_when(M1 == 1 ~ eval(exam_final_wt)*(eval(w_M1_2009_2010)/(eval(w_M1_nhanesII))),
                                            F1 == 1 ~ eval(exam_final_wt)*(eval(w_F1_2009_2010)/(eval(w_F1_nhanesII))),
                                            M2 == 1 ~ eval(exam_final_wt)*(eval(w_M2_2009_2010)/(eval(w_M2_nhanesII))),
                                            F2 == 1 ~ eval(exam_final_wt)*(eval(w_F2_2009_2010)/(eval(w_F2_nhanesII))),
                                            M3 == 1 ~ eval(exam_final_wt)*(eval(w_M3_2009_2010)/(eval(w_M3_nhanesII))),
                                            F3 == 1 ~ eval(exam_final_wt)*(eval(w_F3_2009_2010)/(eval(w_F3_nhanesII))),
                                            #M4 == 1 ~ eval(exam_final_wt)*(eval(w_M4_2009_2010)/(eval(w_M4_nhanesII))),
                                            #F4 == 1 ~ eval(exam_final_wt)*(eval(w_F4_2009_2010)/(eval(w_F4_nhanesII))),
                                            TRUE ~ NA_real_))

nhanesII=temp[[1]]