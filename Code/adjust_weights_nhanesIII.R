## FORMING AGE-SEX GROUPS FOR EACH PERSON
# 45-54, MALES & FEMALES
#lapply(df_list, function(x) {mutate(temp, M1 = ifelse(ridageyr >= 45 & ridageyr <= 54 & riagendr == 1, 1, 0))})
temp = temp %>% lapply(function(x) {mutate(x, M1 = ifelse(HSAGEIR >= 45 & HSAGEIR <= 54 & HSSEX == 1, 1, 0))})
temp = temp %>% lapply(function(x) {mutate(x, M1 = ifelse(HSAGEIR >= 45 & HSAGEIR <= 54 & HSSEX == 1, 1, 0))})

temp = temp %>% lapply(function(x) {mutate(x, F1 = ifelse(HSAGEIR >= 45 & HSAGEIR <= 54 & HSSEX == 2, 1, 0))})
# 55-64, MALES & FEMALES
temp = temp %>% lapply(function(x) {mutate(x, M2 = ifelse(HSAGEIR >= 55 & HSAGEIR <= 64 & HSSEX == 1, 1, 0))})
temp = temp %>% lapply(function(x) {mutate(x, F2 = ifelse(HSAGEIR >= 55 & HSAGEIR <= 64 & HSSEX == 2, 1, 0))})
# 65-74, MALES & FEMALES
temp = temp %>% lapply(function(x) {mutate(x, M3 = ifelse(HSAGEIR >= 65 & HSAGEIR <= 74 & HSSEX == 1, 1, 0))})
temp = temp %>% lapply(function(x) {mutate(x, F3 = ifelse(HSAGEIR >= 65 & HSAGEIR <= 74 & HSSEX == 2, 1, 0))})
# 75+, MALES & FEMALES
temp = temp %>% lapply(function(x) {mutate(x, M4 = ifelse(HSAGEIR >= 75 & HSSEX == 1, 1, 0))})
temp = temp %>% lapply(function(x) {mutate(x, F4 = ifelse(HSAGEIR >= 75 & HSSEX == 2, 1, 0))})
