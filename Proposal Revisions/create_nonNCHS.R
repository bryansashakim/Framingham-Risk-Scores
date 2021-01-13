library(dplyr)
library(janitor)
library(data.table)
library(foreign)
library(usmap)
library(haven)

census=readxl::read_xls("/Users/bryankim/Documents/TEMPORARY FILES/tab03.xls")
nber=read.csv("/Users/bryankim/Documents/TEMPORARY FILES/cencounts.csv")

census = census[-seq(1:12),]
census = census %>% row_to_names(row=1)
census = census %>% setnames(old=c("Codes","County Name", "State","April 1, 1990","April 1, 2000"),new=c("CNTY2K","county","state","pop1990","pop2000"))
census$CNTY2K = as.double(census$CNTY2K)

get_state_code = function(state) {
  return(usmap::fips(state))
}
census$STATE2K = mapply(get_state_code,census$state)

nber = nber[,c("fips","pop1980","name")]
nber = nber %>% setnames(old=c("fips"),new=c("CNTY2K"))

nber$state = substr(nber$name,1,2)
nber$county = substr(nber$name,4,nchar(nber$name))
l=which(nber$county %in% c("Alabama", "Alaska", "American Samoa", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "District of Columbia", "Florida", "Georgia", "Guam", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Minor Outlying Islands", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Northern Mariana Islands", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Puerto Rico", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "U.S. Virgin Islands", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"))
nber=nber[-l,]
nber = nber %>% filter(pop1980 != ".")
nber$STATE2K = mapply(get_state_code,nber$state)

df_census = left_join(census,nber,by=c("CNTY2K","STATE2K"))

df_census = df_census %>% 
  filter(!is.na(name) | !is.na(pop1980)) %>% 
  setnames(old=c("state.x","county.x"),new=c("state","county")) %>% 
  select(CNTY2K,STATE2K,state,county,pop1980,pop1990,pop2000)
 # setnames(old = "fips.x",new="fips") %>% 


write_sas(df_census, "/Users/bryankim/Documents/NBER/Case Deaton/Proposal Revisions/census_data.sas7bdat")
write_sas(df_census, "/Users/bryankim/Documents/NBER/Case Deaton/Proposal Revisions/census_data.sas7bdat")


hi=read.csv("/Users/bryankim/Documents/TEMPORARY FILES/ACSST5Y2012.S2701_2020-12-29T133216/ACSST5Y2012.S2701_data_with_overlays_2020-12-29T133206.csv")
employ = read.csv("/Users/bryankim/Documents/TEMPORARY FILES/ACSST5Y2010.S2301_2020-12-29T132537/ACSST5Y2010.S2301_data_with_overlays_2020-12-23T121742.csv")

employ = employ[,c("NAME","S2301_C01_004E","S2301_C01_005E","S2301_C01_026E","S2301_C01_027E","S2301_C01_028E","S2301_C01_029E","S2301_C01_001E","S2301_C03_004E","S2301_C03_005E","S2301_C03_026E","S2301_C03_027E","S2301_C03_028E","S2301_C03_029E")] %>% 
  setnames(old=c("NAME","S2301_C01_004E","S2301_C01_005E","S2301_C01_026E","S2301_C01_027E","S2301_C01_028E","S2301_C01_029E","S2301_C01_001E","S2301_C03_004E","S2301_C03_005E","S2301_C03_026E","S2301_C03_027E","S2301_C03_028E","S2301_C03_029E"),
           new=c("geo_name","total_pop_25_44","total_pop_45-54","total_pop_less_hs","total_pop_hs","total_pop_some_clg","total_pop_clg_grad","pop_16_over","per_employed_25_44","per_employed_45_54","per_employed_less_hs","per_employed_hs_grad","per_employed_some_clg","per_employed_clg_grad")) %>% 
  select("geo_name","total_pop_25_44","total_pop_45-54","total_pop_less_hs","total_pop_hs","total_pop_some_clg","total_pop_clg_grad","pop_16_over","per_employed_25_44","per_employed_45_54","per_employed_less_hs","per_employed_hs_grad","per_employed_some_clg","per_employed_clg_grad")

hi = hi[,c("NAME","S2701_C01_002E","S2701_C01_003E","S2701_C01_023E","S2701_C01_024E","S2701_C01_025E","S2701_C01_026E","S2701_C03_002E","S2701_C03_003E","S2701_C03_023E","S2701_C03_024E","S2701_C03_025E","S2701_C03_026E")] %>% 
  setnames(old=c("NAME","S2701_C01_002E","S2701_C01_003E","S2701_C01_023E","S2701_C01_024E","S2701_C01_025E","S2701_C01_026E","S2701_C03_002E","S2701_C03_003E","S2701_C03_023E","S2701_C03_024E","S2701_C03_025E","S2701_C03_026E"),
           new=c("geo_name","total_pop_less_18","total_pop_18_64","total_pop_less_hs","total_pop_hs","total_pop_some_clg","total_pop_clg_grad","per_ui_less_18","per_ui_less_18_64","per_ui_less_hs","per_ui_hs","per_ui_some_clg","per_ui_clg_grad")) %>% 
  select("geo_name","total_pop_less_18","total_pop_18_64","per_ui_less_18","per_ui_less_18_64","per_ui_less_hs","per_ui_hs","per_ui_some_clg","per_ui_clg_grad")

df_acs = left_join(employ,hi,by=c("geo_name"))

df_acs$state = sub(".*, ", "", df_acs$geo_name)
df_acs$county = sub('\\s*,.*','', df_acs$geo_name)
l=which(df_acs$state %in% c("Alabama", "Alaska", "American Samoa", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "District of Columbia", "Florida", "Georgia", "Guam", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Minor Outlying Islands", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Northern Mariana Islands", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "U.S. Virgin Islands", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"))
df_acs=df_acs[l,]
df_acs$STATE2K = mapply(get_state_code,df_acs$state)
get_county_code = function(s,c) {
  return(usmap::fips(state=s,county=c))
}
w=which(df_acs$county=="Wade Hampton Census Area") #Wade Hampton Census Area is not a valid county in Alaska. 
df_acs=df_acs[-w,]
g = which(df_acs$county=="Do?a Ana County")
df_acs$county[g]="Dona Ana County"
h = which(df_acs$county=="Shannon County")
df_acs=df_acs[-h,]
df_acs$CNTY2K = mapply(get_county_code,df_acs$state,df_acs$county)

df_acs=df_acs[,-c(1)]

df_acs = df_acs %>% select(state,county,STATE2K,CNTY2K,per_ui_less_hs,per_ui_some_clg,per_ui_clg_grad)

write_sas(df_acs, "/Users/bryankim/Documents/NBER/Case Deaton/Proposal Revisions/acs_data.sas7bdat")

# save df_census and df_acs

