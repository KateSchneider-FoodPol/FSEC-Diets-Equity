* Kate Schneider
* Food Systems Economic Commission
* Diets working group
* Diets & Equity analysis
* May 2021

* Working Folder
global data "C:\Users\kates\OneDrive - Johns Hopkins\FSEC Personal folder\Data"
global outputs "C:\Users\kates\OneDrive - Johns Hopkins\FSEC Personal folder\Outputs"
cd "$outputs"

* Create dataset
// AHEI provided by IHME
import delimited "$data/GBD/AHEI scores_GBD_Apr2021", clear
ren location country
lab var country ""
describe
encode sex, gen(sex1)
drop sex
ren sex1 sex
recode sex (2=0)
lab def sex 1 "Female" 0 "Male"
ren scorename dietcomponent
foreach v of varlist _all {
	lab var `v' ""
	}
drop agegroup
save AHEI, replace

// World Development Indicators
import delimited "$data/World Dev Indicators/World Dev Indicators", clear
ren v1 country
ren v2 iso
ren v3 series
drop v4
ren v5 var_2000
ren v6 var_2019
drop if country==""
reshape long var_, i(country series) j(year)
drop if series=="Series Name"
drop if series==""
encode series, gen(variablename)
drop series
replace var_="" if var_==".."
destring var_, replace
labellist variablename
reshape wide var_, i(country year) j(variablename)
ren var_4 GDPpc_PPP 
	lab var GDPpc_PPP "GDP per capita, PPP (constant 2017 international $)" 
ren var_5 gini
	lab var gini "Gini index (World Bank estimate)" 
ren var_6 incshare_quint4
	lab var incshare_quint4 "Income share held by fourth 20%" 
ren var_7 incshare_top10 
	lab var incshare_top10 "Income share held by highest 10%" 
ren var_8 incshare_quint5
	lab var incshare_quint5 "Income share held by highest 20%" 
ren var_9 incshare_bot10
	lab var incshare_bot "Income share held by lowest 10%" 
ren var_10 incshare_quint1 
	lab var incshare_quint1 "Income share held by lowest 20%"
ren var_11 incshare_quint2
	lab var incshare_quint2 "Income share held by second 20%" 
ren var_12 incshare_quint3 
	lab var incshare_quint3 "Income share held by third 20%"
drop var_1-var_3 var_13-var_38
save WDI, replace

use AHEI, clear
merge m:1 iso year using WDI
	* some small island nations are not in both datasets
	* WDI includes aggregate groups 
drop if _merge!=3
drop _merge
ren mean dcmean
ren upper dcupper
ren lower dclower

save FSECdietequity, replace

// Analysis
use FSECdietequity, clear
encode dietcomponent, gen(diet)
lab var dcmean "AHEI, all diet components (mean)"
scatter GDPpc_PPP dcmean if diet==1, by(year)
keep if diet==1
drop harmful
reshape wide dcmean-dclower GDPpc_PPP-incshare_quint3, ///
	i(country sex) j(year)
gen diet_diff=dcmean2000-dcmean2019
gen gdp_diff=GDPpc_PPP2000-GDPpc_PPP2019
gen gini_diff=gini2000-gini2019

tw (scatter gdp_diff diet_diff, sort(gdp_diff)) (lfit gdp_diff diet_diff), ///
	ytitle("Change in GDP per capita (US$ 2017 PPP) 2000-2019") ///
	xtitle("Change in Diet Quality (mean AHEI) 2000-2019") ///
	legend(label(1 "Difference in GDP"))
graph export "Change in GDP vs Change in Diet Quality.png", replace
