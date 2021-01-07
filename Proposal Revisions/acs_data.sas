* Written by R;
*  write.foreign(df_acs, "/Users/bryankim/Documents/NBER/Case Deaton/Proposal Revisions//acs_data.txt",  ;

DATA  rdata ;
LENGTH
 state $ 20
 county $ 33
 STATE2K $ 2
 CNTY2K $ 5
 per_ui_less_hs $ 4
 per_ui_some_clg $ 4
 per_ui_clg_grad $ 4
;

INFILE  "/Users/bryankim/Documents/NBER/Case Deaton/Proposal Revisions//acs_data.txt" 
     DSD 
     LRECL= 82 ;
INPUT
 state
 county
 STATE2K
 CNTY2K
 per_ui_less_hs
 per_ui_some_clg
 per_ui_clg_grad $ 
;
RUN;
