* Kate Schneider
* Download NHANES dietary and demographic data, calculate HEI

// Link to all NHANES datasets: https://wwwn.cdc.gov/nchs/nhanes/default.aspx
// Code credits:
	* NHANES general: Tim Plante https://blog.uvm.edu/tbplante/2018/03/02/downloading-and-analyzing-nhanes-datasets-with-stata-in-a-single-do-file/

// Part 1: Data management
global myfiles "C:\Users\kates\OneDrive - Johns Hopkins\FSEC\Diets & equity\FSEC Diets & Equity Shared Folder"
global data "\Data"
global analysis "\Analysis"
cd "$myfiles$analysis"

* Demographics
import sasxport5 "https://wwwn.cdc.gov/Nchs/Nhanes/2017-2018/DEMO_J.XPT", clear
sort seqn // seqn = unique identifier 
save DEMO_J, replace

* HEI-2015
import delimited using "HEI1718.csv", clear
sort seqn
sum
save HEI1718, replace

use DEMO_J, clear
sum
merge 1:1 seqn using HEI1718
drop if _merge!=3
drop _merge

* Dietary data (foods)
	// Technical support file - food codes
	import sasxport5 "https://wwwn.cdc.gov/Nchs/Nhanes/2017-2018/DRXFCD_J.XPT", clear
	save DRXFCD_J, replace
	
	// Day 1
	import sasxport5 "https://wwwn.cdc.gov/Nchs/Nhanes/2017-2018/DR1IFF_J.XPT", clear
	sort seqn  
	save DR1IFF_J, replace
	// Day 2
	import sasxport5 "https://wwwn.cdc.gov/Nchs/Nhanes/2017-2018/DR2IFF_J.XPT", clear
	sort seqn  
	save DR2IFF_J, replace

* Dietary data (nutrients)
	// Day 1
	import sasxport5 "https://wwwn.cdc.gov/Nchs/Nhanes/2017-2018/DR1TOT_J.XPT", clear
	sort seqn  
	save DR1TOT_J, replace
	// Day 2
	import sasxport5 "https://wwwn.cdc.gov/Nchs/Nhanes/2017-2018/DR2TOT_J.XPT", clear
	sort seqn  
	save DR2TOT_J, replace
	
clear 
use DEMO_J.dta, clear
merge 1:1 seqn using DR1TOT_J
drop _merge
merge 1:m seqn using DR1IFF_J
drop  _merge 
* unique identifier at dietary data level: dr1iline
unique seqn dr1iline
* merge in food names: following https://wwwn.cdc.gov/Nchs/Nhanes/2017-2018/DR1TOT_J.htm#Appendix_4._Adding_Food_Code_Descriptions_to_Your_Files
preserve	
use DRXFCD_J, clear
ren drxfdcd dr1ifdcd
tempfile foodcodes	
	save `foodcodes', replace
restore
	merge m:1 dr1ifdcd using `foodcodes'
save day1, replace

clear 
use DEMO_J.dta, clear
merge 1:1 seqn using DR2TOT_J
drop _merge
merge 1:m seqn using DR2IFF_J
drop  _merge 
* unique identifier at dietary data level: dr1iline
unique seqn dr2iline
* merge in food names: following https://wwwn.cdc.gov/Nchs/Nhanes/2017-2018/DR1TOT_J.htm#Appendix_4._Adding_Food_Code_Descriptions_to_Your_Files
preserve	
use DRXFCD_J, clear
ren drxfdcd dr2ifdcd
tempfile foodcodes	
	save `foodcodes', replace
restore
	merge m:1 dr2ifdcd using `foodcodes'
save day2, replace

// Part 2: Calculate HEI
* instructions: https://epi.grants.cancer.gov/hei/calculating-hei-scores.html

// Do file for calculating the Healthy Eating Index Score
// Total Calories (to be used in calculations)
gen Total_Calories = dr1tkcal + dr2tkcal
// Total Fruits Score
gen TF_Score = ((DR1T_F_TOTAL + DR2T_F_TOTAL) /
Total_Calories) * 1000
gen TF_Points = (TF_Score / 0.8) * 5
replace TF_Points = 5 if TF_Points >= 5
replace TF_Points = . if TF_Score == .
// Whole Fruits Score
gen WF_Score = ((DR1T_F_CITMLB + DR1T_F_OTHER +
DR2T_F_CITMLB + DR2T_F_OTHER) / Total_Calories) * 1000
gen WF_Points = (WF_Score / 0.4) * 5
replace WF_Points = 5 if WF_Points >= 5
replace WF_Points = . if WF_Score == .
// Total Vegetables Score
gen TV_Score = ((DR1T_V_TOTAL + DR1T_V_LEGUMES +
DR2T_V_TOTAL + DR2T_V_LEGUMES) / Total_Calories) * 1000
gen TV_Points = (TV_Score / 1.1) * 5
replace TV_Points = 5 if TV_Points >= 5
replace TV_Points = . if TV_Score == .
// Greans and Beans Score
gen GB_Score = ((DR1T_V_DRKGR + DR1T_V_LEGUMES +
DR2T_V_DRKGR + DR2T_V_LEGUMES) / Total_Calories) * 1000
gen GB_Points = (GB_Score / 0.2)
replace GB_Points = 5 if GB_Points >= 5
replace GB_Points = . if GB_Score == .
// Whole Grains Score
gen WG_Score = ((DR1T_G_WHOLE + DR2T_G_WHOLE) /
Total_Calories) * 1000
gen WG_Points = (WG_Score / 1.5) * 10
replace WG_Points = 10 if WG_Points >= 10
replace WG_Points = . if WG_Score == .
// Dairy Score
gen DA_Score = ((DR1T_D_TOTAL + DR2T_D_TOTAL) /
Total_Calories) * 1000
gen DA_Points = (DA_Score / 1.3) * 10
replace DA_Points = 10 if DA_Points >= 10
replace DA_Points = . if DA_Score == .
// Total Protein Foods Score
gen TP_Score = ((DR1T_PF_TOTAL + DR2T_PF_TOTAL) /
Total_Calories) * 1000
gen TP_Points = (TP_Score / 2.5) * 5
35
replace TP_Points = 5 if TP_Points >= 5
replace TP_Points = . if TP_Score == .
// Seafood and Plant Proteins
gen SP_Score = ((DR1T_PF_SEAFD_HI + DR2T_PF_SEAFD_HI +
DR1T_PF_SEAFD_LOW + DR2T_PF_SEAFD_LOW + DR1T_PF_SOY +
DR2T_PF_SOY + DR1T_PF_NUTSDS + DR2T_PF_NUTSDS +
DR1T_PF_LEGUMES + DR2T_PF_LEGUMES) / Total_Calories) * 1000
gen SP_Points = (SP_Score / 0.8) * 5
replace SP_Points = 5 if SP_Points >= 5
replace SP_Points = . if SP_Score == .
// Fatty Acids Score
gen FA_Score = (dr1tmfat + dr2tmfat + dr1tpfat + dr2tpfat)
/ (dr1tsfat + dr2tsfat)
gen FA_Points = ((FA_Score - 1.2) / 1.3) * 10
replace FA_Points = 0 if FA_Points <= 0
replace FA_Points = 10 if FA_Points >= 10
replace FA_Points = . if FA_Score == .
// Refined Grains Score
gen RG_Score = ((DR1T_G_REFINED + DR2T_G_REFINED) /
Total_Calories) * 1000
gen RG_Points = ((4.3 - RG_Score) / 2.5) * 10
replace RG_Points = 0 if RG_Points <= 0
replace RG_Points = 10 if RG_Points >= 10
replace RG_Points = . if RG_Score == .
// Sodium Score
gen NA_Score = ((dr1tsodi + dr2tsodi) / Total_Calories) *
1000
gen NA_Points = ((2000 - NA_Score) / 900) * 10
replace NA_Points = 0 if NA_Points <= 0
replace NA_Points = 10 if NA_Points >= 10
replace NA_Points = . if NA_Score == .
// Added Sugars
gen SU_Total_Calories = (DR1T_ADD_SUGARS + DR2T_ADD_SUGARS)
*16
gen SU_Score = (SU_Total_Calories / Total_Calories)
gen SU_Points = ((0.26 - SU_Score) / 0.195) * 10
replace SU_Points = 0 if SU_Points <= 0
replace SU_Points = 10 if SU_Points >= 10
replace SU_Points = . if SU_Score == .
// Saturated Fats
gen SF_Total_Calories = (dr1tsfat + dr2tsfat) * 9
gen SF_Score = (SF_Total_Calories / Total_Calories)
gen SF_Points = ((0.16 - SF_Score) / 0.08) * 10
replace SF_Points = 0 if SF_Points <= 0
replace SF_Points = 10 if SF_Points >= 10
replace SF_Points = . if SF_Score == .
// Calculate HEI
36
gen HEI = TF_Points + WF_Points + TV_Points + GB_Points +
WG_Points + DA_Points + TP_Points + SP_Points + FA_Points +
RG_Points + NA_Points + SU_Points + SF_Points

// weighting: use WTMEC2YR as the appropriate weight for dietary data
//   weight for interview data: wtint2yr 
//   weight for laboratory (MEC) data: wtmec2yr 
//   Sampling units (PSU): sdmvpsu
//   Strata: sdmvstra
//   Single unit: there isn't one. 
svyset sdmvpsu [pweight = wtmec2yr], strata(sdmvstra) vce(linearized) singleunit(missing)