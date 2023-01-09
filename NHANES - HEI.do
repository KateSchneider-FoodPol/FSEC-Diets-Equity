* Kate Schneider
* Replication files for "Inequities in access to healthy diets" - NHANES
* Table 1 & 2
* Figure 1
* Supplementary tables 1 & 2

// Link to all NHANES datasets: https://wwwn.cdc.gov/nchs/nhanes/default.aspx
// Codebook for demographics: https://wwwn.cdc.gov/Nchs/Nhanes/2017-2018/DEMO_J.htm

// Part 1: Data management
global myfiles "C:\Users\Kate S\OneDrive - Johns Hopkins\FSEC\Diets & equity\FSEC Diets & Equity Shared Folder"
global data "\Data\NHANES 2017-2018 Raw data"
global analysis "\Analysis"
global saveto "\Revised_Frontiers submission"
cd "$myfiles$analysis"

* Demographics
import sasxport5 "https://wwwn.cdc.gov/Nchs/Nhanes/2017-2018/DEMO_J.XPT", clear
sort seqn // seqn = unique identifier 
save DEMO_J, replace

* Food security
import sasxport5 "https://wwwn.cdc.gov/Nchs/Nhanes/2017-2018/FSQ_J.XPT", clear
sort seqn // seqn = unique identifier 
save FSQ_J, replace

* Disability
import sasxport5 "https://wwwn.cdc.gov/Nchs/Nhanes/2017-2018/DLQ_J.XPT", clear
sort seqn // seqn = unique identifier 
gen anydisability=.
	replace anydisability=1 if (dlq010==1 | dlq020==1 | dlq040==1 | dlq050==1 | dlq060==1 | dlq080==1)
	replace anydisability=2 if anydisability==.
keep seqn anydisability
save DLQ_J, replace

* Income
import sasxport5 "https://wwwn.cdc.gov/Nchs/Nhanes/2017-2018/INQ_J.XPT", clear
sort seqn // seqn = unique identifier
keep seqn inq132 inq300 inq320
save INQ_J, replace


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
merge 1:1 seqn using FSQ_J
drop if _merge!=3
drop _merge
merge 1:1 seqn using DLQ_J
drop if _merge!=3
drop _merge
merge 1:1 seqn using INQ_J
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
lab val indfmin2 inc

//income to poverty ratio
sum indfmpir, d
histogram indfmpir, freq
xtile inctopovquint= indfmpir [pw=wtmec2yr], nq(6) 
bys inctopovquint: sum indfmpir

cap lab drop incpov
lab def incpov 1 "Lowest quintile(0-1.18)" 2 "Second quintile (1.19-2)" 3 "Third Quintile (2.01-3.08)" 4 "Fourth Quintile (3.09-4.45)" 5 "Highest Quintile (4.47+)" 
lab val inctopovquint incpov

lab var inctopovquint "Ratio of household income-to-poverty Quintile"

recode riagendr (1=0) (2=1)
	lab def sex 0 "Male" 1 "Female"
	lab val riagendr sex
	lab var riagendr "Female (%)"
tab ridageyr
recode dmdcitzn (2=0)
	lab def cit 1 "Citizen of the U.S." 0 "Not citizen of the U.S."
	lab val dmdcitzn citizen
	lab var dmdcitzn "U.S. Citizen (%)"
	
* combine education variable for 18 and 19 year olds with those for people 20 and above for analysis of 18+
replace dmdeduc2=2 if ridageyr<20 & dmdeduc3==inlist(9,10,11,12)
replace dmdeduc2=3 if ridageyr<20 & dmdeduc3==inlist(13,14)
replace dmdeduc2=4 if ridageyr<20 & dmdeduc3==15
replace dmdeduc2=1 if ridageyr<20 & dmdeduc3==66
replace dmdeduc2=. if dmdeduc2==inlist(7,9) // replace refused and don't know (N=13) with missing
lab def ed 1 "Less than 9th grade" 2 "9-11th grade (Includes 12th grade with no diploma)" 3 "High school graduate/GED or equivalent" 4 "Some college or AA degree" 5 "College graduate or above" 
lab val dmdeduc2 ed
lab var dmdeduc2 "Education level"

lab def mstat 1 "Married" 2 "Widowed" 3 "Divorced" 4 "Separated" 5 "Never married" 6 "Living with partner" 
replace dmdmartl=. if dmdmartl==inlist(77,99) // replace refused and don't know (N=13) with missing
lab val dmdmartl mstat
lab var dmdmartl "Marital status"

recode sialang (2=0)
lab def lang 0 "Spanish" 1 "English"
lab val sialang lang
lab var sialang "% Interviews conducted in English (vs Spanish)"

lab def fs 1 "Food secure" 2 "Marginal food security" 3 "Low food security" 4 "Very low food security"
lab val fsdhh fs
lab val fsdad fs

lab def yesno 1 "Yes" 0 "No" 7 "Refused" 9 "Don't know"
foreach var in fsd151 fsd230 fsd660zc fsd061 fsd071 fsd081 fsd092 fsd111 fsd122 inq132 inq300 {
	recode `var' (2=0)
	lab val `var' yesno
}

lab def freq 1 "Often true" 2 "Sometimes true" 3 "Never true" 7 "Refused" 9 "Don't know"
foreach v in fsd032a fsd032b fsd032c fsd032d fsd032e fsd032f {
	lab val `v' freq
}

lab var anydisability "Any disability"
keep if ridageyr>=18

save NHANES_HEI_20172018, replace

//# US case study 
* diet quality outcomes
use NHANES_HEI_20172018, clear
svyset sdmvpsu [pw=wtmec2yr], strata(sdmvstra)

misstable sum riagendr ridageyr indfmpir inctopovquint ridreth3 dmdeduc2 indfmin2 anydisability hei fsdhh dmdhhsiz dmdfmsiz dmdhhsza dmdhhszb dmdhhsze 

// Table 1 // Assocation with HEI
* recode income
recode indfmin2 (1=13) (2=13) (3=13) (4=13)
recode indfmin2 (12 = 77) // recode "$20k and over" as refused, given the huge potential variation in this category -- METHODS NOTE (N=128)
tab indfmin2
describe indfmin2
recode indfmin2 (13 = 1)
lab def inc 1 "$20,000 and below", modify
lab val indfmin2 inc
eststo reg: svy, subpop(if indfmin2!=77 & indfmin2!=99 & dmdeduc2!=7 & dmdeduc2!=9): regress hei riagendr ridageyr b6.indfmin2  b3.ridreth3 b5.dmdeduc2 dmdfmsiz dmdhhsza dmdhhszb anydisability i.fsdhh
eststo reginteract: svy, subpop(if indfmin2!=77 & indfmin2!=99 & dmdeduc2!=7 & dmdeduc2!=9): regress hei ridageyr b6.indfmin2  b3.ridreth3 b5.dmdeduc2 dmdfmsiz dmdhhsza dmdhhszb anydisability i.fsdhh ridreth3##riagendr
esttab reg reginteract using "$myfiles$saveto\Table 1", replace wide rtf label nogaps se(%9.3f) star 
eststo meanhei: svy, subpop(if indfmin2!=77 & indfmin2!=99 & dmdeduc2!=7 & dmdeduc2!=9 & indfmin2!=. & dmdeduc2!=.): mean hei
esttab meanhei using "$myfiles$saveto\Table 1", append wide rtf label nogaps se(%9.3f) note("Note: Excludes those who refused to give income (N=86) or did not know (n=96) and those who refused to give education level (n=2) or did not know (n=6).")

//# Fig 2
lab def ed 1 "Less than 9th grade" 2 "9-12th (no diploma)" 3 "High school grad/GED/equiv" 4 "Some college or AA degree" 5 "College graduate or above", replace
lab val dmdeduc2 ed

graph box hei if indfmin2!=77 & indfmin2!=99 & dmdeduc2!=7 & dmdeduc2!=9 [pw=wtmec2yr], over(dmdeduc2) over(riagendr) asyvars ytitle("HEI (0-100)", margin(5)) yline(51, lcolor(gray)) legend(size(small) col(2) symxsize(3)) 
graph export "$myfiles$saveto\Fig 2-final.jpg", replace

//# Table 2 

gen colldeg=1 if dmdeduc2==5
replace colldeg=0 if dmdeduc2<5
eststo coll: svy, subpop(if indfmin2!=77 & indfmin2!=99 & dmdeduc2!=7 & dmdeduc2!=9): logit colldeg b1.ridreth3 i.inctopovquint riagendr ridageyr, or

gen foodinsecure=1 if inlist(fsdhh,2,3,4)
replace foodinsecure=0 if fsdhh==1
eststo fi: svy, subpop(if indfmin2!=77 & indfmin2!=99 & dmdeduc2!=7 & dmdeduc2!=9): logit foodinsecure b1.ridreth3 i.inctopovquint i.dmdeduc2 riagendr ridageyr , or
	* Linear regression to assess explanatory power of the independent variables:
	svy, subpop(if indfmin2!=77 & indfmin2!=99 & dmdeduc2!=7 & dmdeduc2!=9): reg foodinsecure b1.ridreth3 i.inctopovquint i.dmdeduc2 riagendr ridageyr

esttab coll fi using "$myfiles$saveto\Table 2", replace wide rtf label nogaps se(%9.3f) star eform mlabels("College Degree" "Experience Food Insecurity") 


// Show how income, education, and race/ethnicity are highly correlated
heatplot indfmpir i.dmdeduc2 i.ridreth3  if dmdeduc2!=7 & dmdeduc2!=9, xlabel(,angle(45) labsize(small)) ylabel(, labsize(small)) keylabels(all)

sum indfmpir

//# Supp Table 1 // NHANES summary statistics 
eststo sum1: estpost sum ridageyr dmdhhsiz dmdfmsiz dmdhhsza dmdhhszb dmdhhsze hei riagendr, listwise
esttab sum1 using "Supp Table 1", replace rtf label wide nostar cells("mean(fmt(%9.2f)) count(fmt(%9.0f))") 
eststo sum1a: estpost sum indfmpir, listwise
esttab sum1a using "Supp Table 1", append rtf label wide nostar cells("mean(fmt(%9.2f)) count(fmt(%9.0f))")
eststo sum2: estpost tab ridreth3 
esttab sum2 using "Supp Table 1", append rtf label wide varlabels(`e(labels)') nostar cells("b(fmt(%9.0f)) pct(fmt(%9.2f))")
replace dmdeduc2=9 if dmdeduc2==. | dmdeduc2==7
eststo sum3: estpost tab dmdeduc2 
esttab sum3 using "Supp Table 1", append rtf label wide varlabels(`e(labels)') nostar cells("b(fmt(%9.0f)) pct(fmt(%9.2f))")
replace indfmin2=99 if indfmin2==. | indfmin2==77
eststo sum5: estpost tab indfmin2 
esttab sum5 using "Supp Table 1", append rtf label wide varlabels(`e(labels)') nostar cells("b(fmt(%9.0f)) pct(fmt(%9.2f))")

//# Supp Mat Table 2
tab inctopovquint, nolabel
replace inctopovquint=6 if inctopovquint==. // Missing
tabout ridreth3 inctopovquint using "Supp Table 2.xls", replace

	** to support note re differential income reporting:
	tab ridreth3 if indfmin2==. 
	
