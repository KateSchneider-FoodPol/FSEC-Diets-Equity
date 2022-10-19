* Kate Schneider


// Part 1 // Housekeeping
* Working directory
global myfiles "C:\Users\kates\OneDrive - Johns Hopkins\FSEC\Diets & equity\FSEC Diets & Equity Shared Folder"
global analysis "\Analysis"
global data "\Data\IPUMS"
cd "$myfiles"

// Part 2 // Data management
use "$myfiles$data\atus_00003", clear
describe
describe q* // data quality flags
foreach v of varlist q* {
		tab `v'
} // shows the records that have been imputed/cleaned/corrected

* Social group variables
global sdegroups region metro msasize famincome hh_size poverty130 foodstamp hh_numadults age sex race hispan asian marst yrimmig citizen educ educyrs empstat multjobs clwkr occ2 ind2 looking retired ped sed_eat diffany diffcare diffeye diffhear diffmob diffphys diffrem

foreach v of varlist $sdegroups {
	di `v'
	tab `v'
}

* Food shopping location and reason
tab store 
tab streason

* Time use
sum act* bls* ers* // these are from different data sources

* Survey weights
describe wt06 ehwt
misstable sum
	** ehwt should be used for eating and health module respondents due to non-response
	** analyze here only sample of respondents to eating and health module
		// confirm dataset includes only non-missing for EHM:
		tab eh_resp, m
		sum ped if ped!=9999
		histogram ped if ped!=9999

// Part 3 // Figures 

*ERS DATA - HAS ONLY EATING AND DRINKING*
* Time spent eating and drinking (primary) by racial and ethnic identity 	
	** Note: racial groups include Black, White, American Indian, and Pacific 	Islander plus the combinations thereof. Hispanic and Asian ethnic identity asked about separately and uses national origin classification.
	
graph box ped if ped!=9999 & ped>0 & race<211 [pw=ehwt], over(race, label(labsize(vsmall) angle(45))) title("Racial group identity", size(vsmall)) ytitle("Minutes", size(small)) noouts note("") name(race, replace)
	* sample size with non-zero response
	sum ped if ped!=9999 & ped>0
	tab race
	tab race, nolabel
	
graph box ped if ped!=9999 & ped>0 [pw=ehwt], title("Hispanic-Identifying", size(vsmall)) over(hispan, label(labsize(vsmall) angle(45))) ytitle("Minutes", size(small)) noouts note("")  name(hisp, replace)
	
graph box ped if ped!=9999 & ped>0 [pw=ehwt], title("Asian-Identifying", size(vsmall)) over(asian,  label(labsize(vsmall) angle(45))) ytitle("Minutes", size(small)) noouts note("")  name(asian, replace)

graph combine  race hisp asian, ycommon note("N=9,697. Outliers not shown." "Only racial groups with >10 observations shown in racial group panel" "(excludes 15 records from visualization.)", pos(3) ring(0) size(tiny))  title("Time spent eating and drinking per day by racial and ethnic identity", size(vsmall))

*BLS DATA HAS ALL ACTIVITIES OF INTEREST*
tab sex, nolabel
lab def sex 1 "Male" 2 "Female"
lab val sex sex

tab race
tab race, nolabel
lab def race 1 "White*" 2 "Black*" 3 "American Indian, AK native" 4 "Asian*" 5 "HI Pac Islander" 6 "White-Black" 7 "White-American Indian" 8 "White-Asian" 9 "White-Hawaiian" 10 "Black-American Indian" 11 "Black-Asian" 12 "Black-Hawaiian" 13 "Asian-Hawaiian" 14 "White-Black-American Indian" 15 "White-American Indian-Asian" 16 "White-Black-American Indian-Asian"
recode race (100=1) (110=2) (120=3) (131=4) (132=5) (200=6) (201=7) (202=8) (203=9) (210=10) (211=11) (212=12) (230=13) (300=14) (310=15) (400=16)
lab val race race

graph bar bls_food_food bls_food_travel bls_hhact_food bls_hhact_hwork bls_pcare_sleep bls_work [pw=wt06],  over(sex, label(labsize(tiny) angle(45))) over(race, label(labsize(tiny) angle(45))) stack ylabel(, labsize(vsmall)) ytitle("Minutes", size(vsmall)) legend(label(1 "Eating and drinking") label(2 "Travel time for eating and drinking") label(3 "Food prep and cleaning") label(4 "Housework") label(5 "Sleeping") label(6 "Working") size(vsmall) symysize(1) symxsize(3) placement(12) span margin(tiny) rowgap(*.5) row(1)) graphregion(margin(zero))
* Note for footer: *Denotes identifies as named racial group only.

graph export "$myfiles$analysis\timeuseXraceXsex.png", replace

	** Sample size
	table race sex