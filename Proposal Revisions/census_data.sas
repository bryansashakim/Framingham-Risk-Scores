* Written by R;
*  write.foreign(df_census, "/Users/bryankim/Documents/NBER/Case Deaton/Proposal Revisions//census_data.txt",  ;

DATA  rdata ;
LENGTH
 STATE2K $ 2
 state $ 2
 county $ 43
 pop1980 $ 7
 pop1990 $ 7
 pop2000 $ 7
;

INFILE  "/Users/bryankim/Documents/NBER/Case Deaton/Proposal Revisions//census_data.txt" 
     DSD 
     LRECL= 85 ;
INPUT
 CNTY2K
 STATE2K
 state
 county
 pop1980
 pop1990
 pop2000 $ 
;
RUN;
