temp1=list(nhanesIIIP1)
temp1 = temp1 %>% lapply(function(x) {mutate(x, M1 = ifelse(HSAGEIR >= 45 & HSAGEIR <= 54 & HSSEX == 1, 1, 0))})
temp1 = temp1 %>% lapply(function(x) {mutate(x, M1 = ifelse(HSAGEIR >= 45 & HSAGEIR <= 54 & HSSEX == 1, 1, 0))})
temp1 = temp1 %>% lapply(function(x) {mutate(x, F1 = ifelse(HSAGEIR >= 45 & HSAGEIR <= 54 & HSSEX == 2, 1, 0))})
# 55-64, MALES & FEMALES
temp1 = temp1 %>% lapply(function(x) {mutate(x, M2 = ifelse(HSAGEIR >= 55 & HSAGEIR <= 64 & HSSEX == 1, 1, 0))})
temp1 = temp1 %>% lapply(function(x) {mutate(x, F2 = ifelse(HSAGEIR >= 55 & HSAGEIR <= 64 & HSSEX == 2, 1, 0))})
# 65-74, MALES & FEMALES
temp1 = temp1 %>% lapply(function(x) {mutate(x, M3 = ifelse(HSAGEIR >= 65 & HSAGEIR <= 74 & HSSEX == 1, 1, 0))})
temp1 = temp1 %>% lapply(function(x) {mutate(x, F3 = ifelse(HSAGEIR >= 65 & HSAGEIR <= 74 & HSSEX == 2, 1, 0))})
# 75+, MALES & FEMALES
temp1 = temp1 %>% lapply(function(x) {mutate(x, M4 = ifelse(HSAGEIR >= 75 & HSSEX == 1, 1, 0))})
temp1 = temp1 %>% lapply(function(x) {mutate(x, F4 = ifelse(HSAGEIR >= 75 & HSSEX == 2, 1, 0))})
nhanesIIIP1=temp1[[1]]


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
