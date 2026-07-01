




use "${datadir}/ACS2017-2021_finalready.dta", clear


***********************************************************************************************************************	*						
* TABLE 1	***********************************************************************************************************************	*						
************************************************************************************************************************			
		

	global dependent  expandedmarstat1  status_evermarried1 status_evermarried2 status_evermarried3 ///
					evermarr_det1 evermarr_det2 evermarr_det3 evermarr_det4 evermarr_det5 evermarr_det6 evermarr_det7 evermarr_det8 evermarr_det9 ///
					expandedmarstat11 expandedmarstat12 ///
					sp_bpl_ev1_1 sp_bpl_ev1_2 sp_bpl_ev2_4 sp_bpl_ev2_5  sp_bpl_ev3_7 sp_bpl_ev3_8   
					
	
	 	foreach y in $dependent    {
			
			replace `y'= 100*`y'
		}	
	
	
	

	qui eststo  desc0  : estpost tabstat  $dependent  									 , statistics(n mean    ) columns(statistics) 	
	qui eststo  desc1  : estpost tabstat  $dependent  if male==1						 , statistics(n mean    ) columns(statistics) 	
	qui eststo  desc2  : estpost tabstat  $dependent  if male==1 & inrange(agemig,18,25)  , statistics(n mean    ) columns(statistics) 	
	qui eststo  desc3  : estpost tabstat  $dependent  if male==1 & inrange(agemig,26,40)  , statistics(n mean    ) columns(statistics) 	
	
	qui eststo  desc4  : estpost tabstat  $dependent  if male==0						 , statistics(n mean    ) columns(statistics) 	
	qui eststo  desc5  : estpost tabstat  $dependent  if male==0 & inrange(agemig,18,25)  , statistics(n mean    ) columns(statistics) 	
	qui eststo  desc6  : estpost tabstat  $dependent  if male==0 & inrange(agemig,26,40)  , statistics(n mean    ) columns(statistics) 	

	
		
	nois esttab desc0  desc1  desc2  desc3 desc4  desc5  desc6    , label replace ///
		mtitles("all" "male" "male 18-25" "male 26-40" "female" "female 18-25" "female 26-40" )  ///
		cells( `"mean( fmt(1) pattern(1 ) )"' `""' )  varwidth(40) title(Table 1)

	nois esttab desc0  desc1  desc2  desc3 desc4  desc5  desc6   using "${result}/Table1.smcl" , label replace ///
			mtitles("all" "male" "male 18-25" "male 26-40" "female" "female 18-25" "female 26-40" )  ///
			cells( `"mean( fmt(1) pattern(1 ) )"' `""' ) varwidth(40)  title(Table 1)
	

