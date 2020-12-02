temp=list(nhanesII)
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
temp = temp %>% lapply(function(x) {mutate(x, M4 = ifelse(AGEYR_AT_INT >= 75 & SEX == 1, 1, 0))})
temp = temp %>% lapply(function(x) {mutate(x, F4 = ifelse(AGEYR_AT_INT >= 75 & SEX == 2, 1, 0))})
nhanesII=temp[[1]]

temp=list(nhanesIIIP2)
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
nhanesIIIP2=temp[[1]]