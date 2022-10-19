* Kate Schneider
* Charts frequence of references

// Part 1: Data management
global myfiles "C:\Users\kschne29\OneDrive - Johns Hopkins\FSEC\Diets & equity\FSEC Diets & Equity Shared Folder"
global data "\Data"
global analysis "\Analysis"
cd "$myfiles$analysis"

* import data
import delimited using "$myfiles$analysis\References.csv", clear
drop if v2=="Publication year"
ren v1 publication
ren v2 year
lab var publication "Publication"
lab var year "Year"
encode publication, gen(pub)
lab var pub "Publication"
destring year, replace

egen v1=seq()
collapse (count) v1, by(pub)
ren v1 freq
lab var freq "Frequency"

sort freq
graph hbar freq if freq>1 & pub!=141, sort(freq) over(pub, label(labsize(tiny)) sort(freq)) ytitle("Frequency") ylabel(, labsize(small)) 
graph export "References.png", replace