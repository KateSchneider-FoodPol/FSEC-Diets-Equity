* Kate Schneider
* Download NHANES dietary and demographic data, calculate HEI

// Link to all NHANES datasets: https://wwwn.cdc.gov/nchs/nhanes/default.aspx
// Codebook for demographics: https://wwwn.cdc.gov/Nchs/Nhanes/2017-2018/DEMO_J.htm

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

lab def gen 1 "Male" 2 "Female"
lab val riagendr gen
lab val dmdhrgnd gen

cap lab drop eth
lab def eth 1 "Mexican American" 2 "Other Hispanic" 3 "Non-Hispanic White" 4 "Non-Hispanic Black" 6	"Non-Hispanic Asian" 7 "Other Race, incl. Multi-Racial"
lab val ridreth3 eth

lab def agegroup 1	"<20 years" 2 "20-39 years"	3 "40-59 years" 4 "60+ years"
lab val dmdhragz

lab def inc 1 "$ 0 to $ 4,999" 2 "$ 5,000 to $ 9,999" 3 "$10,000 to $14,999" 4 "$15,000 to $19,999" 5 "$20,000 to $24,999" 6 "$25,000 to $34,999" 7 "$35,000 to $44,999" 8 "$45,000 to $54,999" 9 "$55,000 to $64,999" 10 "$65,000 to $74,999" 12 "$20,000 and Over" 13 "Under $20,000" 14 "$75,000 to $99,999" 15 "$100,000 and Over" 77 "Refused" 99 "Don't know"
lab val indhhin2 inc

//income to poverty ratio
egen incpovratgrp=cut(indfmpir), at(.25,.5,.75,1,1.5,2,5)
tab incpovratgrp
lab var incpovratgrp "Ratio of household income to poverty line"

save NHANES_HEI_20172018, replace

use NHANES_HEI_20172018, clear
epctile hei if ridageyr>=18 & hei!=. [pw=wtmec2yr], percentiles(50)
graph box hei if ridageyr>=18 & hei!=. [pw=wtmec2yr], over(ridreth3) over(incpovratgrp, gap(*3)) asyvars legend(size(small) col(3) symxsize(3)) ytitle("Healthy Eating Index (HEI-2015)", size(small)) b1title("Ratio of household income to poverty line", size(small)) noouts note("") yline(51, lcolor(gray))
graph export "Fig2.png", replace

table ridreth3 incpovratgrp if ridageyr>=18 & hei!=.