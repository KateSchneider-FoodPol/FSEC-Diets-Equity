* Kate Schneider


// Part 1 // Housekeeping
* Working directory
global myfiles "C:\Users\kates\OneDrive - Johns Hopkins\FSEC\Diets & equity\FSEC Diets & Equity Shared Folder"
global analysis "\Analysis"
global data "\Data\USDA Food Environment Atlas"
cd "$myfiles"

* Import and merge food atlas datasets all at state and county level
import excel using "$myfiles$data\FoodEnvironmentAtlas", sheet("ACCESS") firstrow clear
	tempfile access
	save `access', replace
import excel using "$myfiles$data\FoodEnvironmentAtlas", sheet("STORES") firstrow clear
	tempfile stores
	save `stores', replace
import excel using "$myfiles$data\FoodEnvironmentAtlas", sheet("RESTAURANTS") firstrow clear
	tempfile restaurants
	save `restaurants', replace
import excel using "$myfiles$data\FoodEnvironmentAtlas", sheet("ASSISTANCE") firstrow clear
	tempfile assistance
	save `assistance', replace
import excel using "$myfiles$data\FoodEnvironmentAtlas", sheet("INSECURITY") firstrow clear
	tempfile insecurity
	save `insecurity', replace
import excel using "$myfiles$data\FoodEnvironmentAtlas", sheet("TAXES") firstrow clear
	tempfile taxes
	save `taxes', replace
import excel using "$myfiles$data\FoodEnvironmentAtlas", sheet("LOCAL") firstrow clear
	drop if FIPS==""
	tempfile local
	save `local', replace
import excel using "$myfiles$data\FoodEnvironmentAtlas", sheet("HEALTH") firstrow clear
	tempfile health
	save `health', replace
import excel using "$myfiles$data\FoodEnvironmentAtlas", sheet("SOCIOECONOMIC") firstrow clear
	tempfile socioeconomic
	save `socioeconomic', replace
import excel using "$myfiles$data\FoodEnvironmentAtlas", sheet("Supplemental Data - County") firstrow clear
	tempfile county
	save `county', replace

use `access', clear
merge 1:1 FIPS using `stores', nogenerate 
merge 1:1 FIPS using `restaurants', nogenerate 
merge 1:1 FIPS using `assistance', nogenerate 
merge 1:1 FIPS using `insecurity', nogenerate 
merge 1:1 FIPS using `taxes', nogenerate 
merge 1:1 FIPS using `local', nogenerate 
merge 1:1 FIPS using `health', nogenerate 
merge 1:1 FIPS using `socioeconomic', nogenerate
destring FIPS, replace 
lab var LACCESS_POP10 "Population, low access to store, 2010"
lab var LACCESS_POP15 "Population, low access to store, 2015"
lab var PCH_LACCESS_POP_10_15 "Population, low access to store (% change), 2010 -15"
lab var PCT_LACCESS_POP10 "Population, low access to store (%), 2010"
lab var PCT_LACCESS_POP15 "Population, low access to store (%), 2015"
lab var LACCESS_LOWI10 "Low income & low access to store, 2010"
lab var LACCESS_LOWI15 "Low income & low access to store, 2015"
lab var PCH_LACCESS_LOWI_10_15 "Low income & low access to store (% change), 2010 - 15"
lab var PCT_LACCESS_LOWI10 "Low income & low access to store (%), 2010"
lab var PCT_LACCESS_LOWI15 "Low income & low access to store (%), 2015"
lab var LACCESS_HHNV10 "Households, no car & low access to store, 2010"
lab var LACCESS_HHNV15 "Households, no car & low access to store, 2015"
lab var PCH_LACCESS_HHNV_10_15 "Households, no car & low access to store (% change), 2010 - 15"
lab var PCT_LACCESS_HHNV10 "Households, no car & low access to store (%), 2010"
lab var PCT_LACCESS_HHNV15 "Households, no car & low access to store (%), 2015"
lab var LACCESS_SNAP15 "SNAP households, low access to store, 2015"
lab var PCT_LACCESS_SNAP15 "SNAP households, low access to store (%), 2015"
lab var LACCESS_CHILD10 "Children, low access to store, 2010"
lab var LACCESS_CHILD15 "Children, low access to store, 2015"
lab var PCT_LACCESS_CHILD10 "Children, low access to store (%), 2010"
lab var PCT_LACCESS_CHILD15 "Children, low access to store (%), 2015"
lab var LACCESS_SENIORS10 "Seniors, low access to store, 2010"
lab var LACCESS_SENIORS15 "Seniors, low access to store, 2015"
lab var PCH_LACCESS_SENIORS_10_15 "Seniors, low access to store (% change), 2010 -15"
lab var PCT_LACCESS_SENIORS10 "Seniors, low access to store (%), 2010"
lab var PCT_LACCESS_SENIORS15 "Seniors, low access to store (%), 2015"
lab var LACCESS_WHITE15 "White, low access to store, 2015"
lab var PCT_LACCESS_WHITE15 "White, low access to store (%), 2015"
lab var LACCESS_BLACK15 "Black, low access to store, 2015"
lab var PCT_LACCESS_BLACK15 "Black, low access to store (%), 2015"
lab var LACCESS_HISP15 "Hispanic ethnicity, low access to store, 2015"
lab var PCT_LACCESS_HISP15 "Hispanic ethnicity, low access to store (%), 2015"
lab var LACCESS_NHASIAN15 "Asian, low access to store, 2015"
lab var PCT_LACCESS_NHASIAN15 "Asian, low access to store (%), 2015"
lab var LACCESS_NHNA15 "American Indian or Alaska Native, low access to store, 2015"
lab var PCT_LACCESS_NHNA15 "American Indian or Alaska Native, low access to store (%), 2015"
lab var LACCESS_NHPI15 "Hawaiian or Pacific Islander, low access to store, 2015"
lab var PCT_LACCESS_NHPI15 "Hawaiian or Pacific Islander, low access to store (%), 2015"
lab var LACCESS_MULTIR15 "Multiracial, low access to store, 2015"
lab var PCT_LACCESS_MULTIR15 "Multiracial, low access to store (%), 2015"
lab var GROC11 "Grocery stores, 2011"
lab var GROC16 "Grocery stores, 2016"
lab var PCH_GROC_11_16 "Grocery stores (% change), 2011-16"
lab var GROCPTH11 "Grocery stores/1,000 pop, 2011"
lab var GROCPTH16 "Grocery stores/1,000 pop, 2016"
lab var PCH_GROCPTH_11_16 "Grocery stores/1,000 pop (% change), 2011-16"
lab var SUPERC11 "Supercenters & club stores, 2011"
lab var SUPERC16 "Supercenters & club stores, 2016"
lab var PCH_SUPERC_11_16 "Supercenters & club stores (% change), 2011-16"
lab var SUPERCPTH11 "Supercenters & club stores/1,000 pop, 2011"
lab var SUPERCPTH16 "Supercenters & club stores/1,000 pop, 2016"
lab var PCH_SUPERCPTH_11_16 "Supercenters & club stores/1,000 pop (% change), 2011-16"
lab var CONVS11 "Convenience stores, 2011"
lab var CONVS16 "Convenience stores, 2016"
lab var PCH_CONVS_11_16 "Convenience stores (% change), 2011-16"
lab var CONVSPTH11 "Convenience stores/1,000 pop, 2011"
lab var CONVSPTH16 "Convenience stores/1,000 pop, 2016"
lab var PCH_CONVSPTH_11_16 "Convenience stores/1,000 pop (% change), 2011-16"
lab var SPECS11 "Specialized food stores, 2011"
lab var SPECS16 "Specialized food stores, 2016"
lab var PCH_SPECS_11_16 "Specialized food stores (% change), 2011-16"
lab var SPECSPTH11 "Specialized food stores/1,000 pop, 2011"
lab var SPECSPTH16 "Specialized food stores/1,000 pop, 2016"
lab var PCH_SPECSPTH_11_16 "Specialized food stores/1,000 pop (% change), 2011-16"
lab var SNAPS12 "SNAP-authorized stores, 2012"
lab var SNAPS17 "SNAP-authorized stores, 2017"
lab var PCH_SNAPS_12_17 "SNAP-authorized stores (% change), 2012-17"
lab var SNAPSPTH12 "SNAP-authorized stores/1,000 pop, 2012"
lab var SNAPSPTH17 "SNAP-authorized stores/1,000 pop, 2017"
lab var PCH_SNAPSPTH_12_17 "SNAP-authorized stores/1,000 pop (% change), 2012-17"
lab var WICS11 "WIC-authorized stores, 2011"
lab var WICS16 "WIC-authorized stores, 2016"
lab var PCH_WICS_11_16 "WIC-authorized stores (% change), 2011-16"
lab var WICSPTH11 "WIC-authorized stores/1,000 pop, 2011"
lab var WICSPTH16 "WIC-authorized stores/1,000 pop, 2016"
lab var PCH_WICSPTH_11_16 "WIC-authorized stores/1,000 pop (% change), 2011-16"
lab var FFR11 "Fast-food restaurants, 2011"
lab var FFR16 "Fast-food restaurants, 2016"
lab var PCH_FFR_11_16 "Fast-food restaurants (% change), 2011-16"
lab var FFRPTH11 "Fast-food restaurants/1,000 pop, 2011"
lab var FFRPTH16 "Fast-food restaurants/1,000 pop, 2016"
lab var PCH_FFRPTH_11_16 "Fast-food restaurants/1,000 pop (% change), 2011-16"
lab var FSR11 "Full-service restaurants, 2011"
lab var FSR16 "Full-service restaurants, 2016"
lab var PCH_FSR_11_16 "Full-service restaurants (% change), 2011-16"
lab var FSRPTH11 "Full-service restaurants/1,000 pop, 2011"
lab var FSRPTH16 "Full-service restaurants/1,000 pop, 2016"
lab var PCH_FSRPTH_11_16 "Full-service restaurants/1,000 pop (% change), 2011-16"
lab var PC_FFRSALES07 "Expenditures per capita, fast food, 2007*"
lab var PC_FFRSALES12 "Expenditures per capita, fast food, 2012*"
lab var PC_FSRSALES07 "Expenditures per capita, restaurants, 2007*"
lab var PC_FSRSALES12 "Expenditures per capita, restaurants, 2012*"
lab var REDEMP_SNAPS12 "SNAP redemptions/SNAP-authorized stores, 2012"
lab var REDEMP_SNAPS17 "SNAP redemptions/SNAP-authorized stores, 2017"
lab var PCH_REDEMP_SNAPS_12_17 "SNAP redemptions/SNAP-authorized stores (% change), 2012-17"
lab var PCT_SNAP12 "SNAP participants (% pop), 2012*"
lab var PCT_SNAP17 "SNAP participants (% pop), 2017*"
lab var PCH_SNAP_12_17 "SNAP participants (change % pop), 2012-17*"
lab var PC_SNAPBEN12 "SNAP benefits per capita, 2012"
lab var PC_SNAPBEN17 "SNAP benefits per capita, 2017"
lab var PCH_PC_SNAPBEN_12_17 "SNAP benefits per capita (% change), 2012-17"
lab var SNAP_PART_RATE11 "SNAP participants (% eligible pop), 2011*"
lab var SNAP_PART_RATE16 "SNAP participants (% eligible pop), 2016*"
lab var SNAP_OAPP09 "SNAP online application, 2009*"
lab var SNAP_OAPP16 "SNAP online application, 2016*"
lab var SNAP_CAP09 "SNAP Combined Application Project , 2009*"
lab var SNAP_CAP16 "SNAP Combined Application Project , 2016*"
lab var SNAP_BBCE09 "SNAP Broad-based Categorical Eligibility, 2009*"
lab var SNAP_BBCE16 "SNAP Broad-based Categorical Eligibility, 2016*"
lab var SNAP_REPORTSIMPLE09 "SNAP simplified reporting, 2009*"
lab var SNAP_REPORTSIMPLE16 "SNAP simplified reporting, 2016*"
lab var PCT_NSLP12 "National School Lunch Program participants (% children), 2012*"
lab var PCT_NSLP17 "National School Lunch Program participants (% children), 2017*"
lab var PCH_NSLP_12_17 "National School Lunch Program participants (change % children), 2012-17*"
lab var PCT_FREE_LUNCH10 "Students eligible for free lunch (%), 2010"
lab var PCT_FREE_LUNCH15 "Students eligible for free lunch (%), 2015"
lab var PCT_REDUCED_LUNCH10 "Students eligible for reduced-price lunch (%), 2010"
lab var PCT_REDUCED_LUNCH15 "Students eligible for reduced-price lunch (%), 2015"
lab var PCT_SBP12 "School Breakfast Program participants (% children), 2012*"
lab var PCT_SBP17 "School Breakfast Program participants (% children), 2017*"
lab var PCH_SBP_12_17 "School Breakfast Program participants (change % children), 2012-17*"
lab var PCT_SFSP12 "Summer Food Service Program participants (% children), 2012*"
lab var PCT_SFSP17 "Summer Food Service Program participants (% children), 2017*"
lab var PCH_SFSP_12_17 "Summer Food Program participants (change % children), 2012-17*"
lab var PC_WIC_REDEMP11 "WIC redemptions per capita, 2011"
lab var PC_WIC_REDEMP16 "WIC redemptions per capita, 2016"
lab var PCH_PC_WIC_REDEMP_11_16 "WIC redemptions per capita (% change), 2011-16"
lab var REDEMP_WICS11 "WIC redemptions/WIC-authorized stores, 2011"
lab var REDEMP_WICS16 "WIC redemptions/WIC-authorized stores, 2016"
lab var PCH_REDEMP_WICS_11_16 "WIC redemptions/WIC-authorized stores (% change), 2011-16"
lab var PCT_WIC12 "WIC participants (% pop), 2012*"
lab var PCT_WIC17 "WIC participants (% pop), 2017*"
lab var PCH_WIC_12_17 "WIC participants (change % pop), 2012-17*"
lab var PCT_WICINFANTCHILD14 "WIC infant and children participants (% infant & children), 2014*"
lab var PCT_WICINFANTCHILD16 "WIC infant and children participants (% infant & children), 2016*"
lab var PCH_WICINFANTCHILD_14_16 "WIC infant and children participants (change % infant & children), 2014-16*"
lab var PCT_WICWOMEN14 "WIC women participants (% women), 2014*"
lab var PCT_WICWOMEN16 "WIC women participants (% women), 2016*"
lab var PCH_WICWOMEN_14_16 "WIC women participants (change % women), 2014-16*"
lab var PCT_CACFP12 "Child & Adult Care (% pop), 2012*"
lab var PCT_CACFP17 "Child & Adult Care (% pop), 2017*"
lab var PCH_CACFP_12_17 "Child & Adult Care (change % pop), 2012-17*"
lab var FDPIR12 "FDPIR Sites, 2012"
lab var FDPIR15 "FDPIR Sites, 2015"
lab var PCH_FDPIR_12_15 "FDPIR Sites, 2012-15"
lab var FOOD_BANKS18 "Food Banks, 2018"
lab var FOODINSEC_12_14 "Household food insecurity (%, three-year average), 2012-14*"
lab var FOODINSEC_15_17 "Household food insecurity (%, three-year average), 2015-17*"
lab var CH_FOODINSEC_14_17 "Household food insecurity (change %),2012-14 to 2015-17*"
lab var VLFOODSEC_12_14 "Household very low food security (%, three-year average), 2012-14*"
lab var VLFOODSEC_15_17 "Household very low food security (%, three-year average), 2015-17*"
lab var CH_VLFOODSEC_14_17 "Household very low food security (change %), 2012-14 to 2015-17*"
lab var SODATAX_STORES14 "Soda sales tax, retail stores, 2014*"
lab var SODATAX_VENDM14 "Soda sales tax, vending, 2014*"
lab var CHIPSTAX_STORES14 "Chip & pretzel sales tax, retail stores, 2014*"
lab var CHIPSTAX_VENDM14 "Chip & pretzel sales tax, vending, 2014*"
lab var FOOD_TAX14 "General food sales tax, retail stores, 2014*"
lab var DIRSALES_FARMS07 "Farms with direct sales, 2007"
lab var DIRSALES_FARMS12 "Farms with direct sales, 2012"
lab var PCH_DIRSALES_FARMS_07_12 "Farms with direct sales (% change), 2007 - 12"
lab var PCT_LOCLFARM07 "Farms with direct sales (%), 2007"
lab var PCT_LOCLFARM12 "Farms with direct sales (%), 2012"
lab var PCT_LOCLSALE07 "Direct farm sales (%), 2007"
lab var PCT_LOCLSALE12 "Direct farm sales (%), 2012"
lab var DIRSALES07 "Direct farm sales, 2007"
lab var DIRSALES12 "Direct farm sales, 2012"
lab var PCH_DIRSALES_07_12 "Direct farm sales (% change), 2007 - 12"
lab var PC_DIRSALES07 "Direct farm sales per capita, 2007"
lab var PC_DIRSALES12 "Direct farm sales per capita, 2012"
lab var PCH_PC_DIRSALES_07_12 "Direct farm sales per capita (% change), 2007 - 12"
lab var FMRKT13 "Farmers' markets, 2013"
lab var FMRKT18 "Farmers' markets, 2018"
lab var PCH_FMRKT_13_18 "Farmers' markets (% change), 2013-18"
lab var FMRKTPTH13 "Farmers' markets/1,000 pop, 2013"
lab var FMRKTPTH18 "Farmers' markets/1,000 pop, 2018"
lab var PCH_FMRKTPTH_13_18 "Farmers' markets/1,000 pop (% change), 2013-18"
lab var FMRKT_SNAP18 "Farmers' markets that report accepting SNAP, 2018"
lab var PCT_FMRKT_SNAP18 "Farmers' markets that report accepting SNAP (%), 2018"
lab var FMRKT_WIC18 "Farmers' markets that report accepting WIC, 2018"
lab var PCT_FMRKT_WIC18 "Farmers' markets that report accepting WIC (%), 2018"
lab var FMRKT_WICCASH18 "Farmers' markets that report accepting WIC Cash, 2018"
lab var PCT_FMRKT_WICCASH18 "Farmers' markets that report accepting WIC Cash (%), 2018"
lab var FMRKT_SFMNP18 "Farmers' markets that report accepting SFMNP, 2018"
lab var PCT_FMRKT_SFMNP18 "Farmers' markets that report accepting SFMNP (%), 2018"
lab var FMRKT_CREDIT18 "Farmers' markets that report accepting credit cards, 2018"
lab var PCT_FMRKT_CREDIT18 "Farmers' markets that report accepting credit cards (%), 2018"
lab var FMRKT_FRVEG18 "Farmers' markets that report selling fruit & vegetables, 2018"
lab var PCT_FMRKT_FRVEG18 "Farmers' markets that report selling fruit & vegetables (%), 2018"
lab var FMRKT_ANMLPROD18 "Farmers' markets that report selling animal products, 2018"
lab var PCT_FMRKT_ANMLPROD18 "Farmers' markets that report selling animal products (%), 2018"
lab var FMRKT_BAKED18 "Farmers' markets that report selling baked/prepared food products, 2018"
lab var PCT_FMRKT_BAKED18 "Farmers' markets that report selling baked/prepared food products (%), 2018"
lab var FMRKT_OTHERFOOD18 "Farmers' markets that report selling other food products, 2018"
lab var PCT_FMRKT_OTHERFOOD18 "Farmers' markets that report selling other food products (%), 2018"
lab var VEG_FARMS07 "Vegetable farms, 2007"
lab var VEG_FARMS12 "Vegetable farms, 2012"
lab var PCH_VEG_FARMS_07_12 "Vegetable farms (% change), 2007 - 12"
lab var VEG_ACRES07 "Vegetable acres harvested, 2007"
lab var VEG_ACRES12 "Vegetable acres harvested, 2012"
lab var PCH_VEG_ACRES_07_12 "Vegetable acres harvested (% change), 2007 - 12"
lab var VEG_ACRESPTH07 "Vegetable acres harvested/1,000 pop, 2007"
lab var VEG_ACRESPTH12 "Vegetable acres harvested/1,000 pop, 2012"
lab var PCH_VEG_ACRESPTH_07_12 "Vegetable acres harvested/1,000 pop (% change), 2007 - 12"
lab var FRESHVEG_FARMS07 "Farms with vegetables harvested for fresh market, 2007"
lab var FRESHVEG_FARMS12 "Farms with vegetables harvested for fresh market, 2012"
lab var PCH_FRESHVEG_FARMS_07_12 "Farms with vegetables harvested for fresh market (% change), 2007 - 12"
lab var FRESHVEG_ACRES07 "Vegetable acres harvested for fresh market, 2007"
lab var FRESHVEG_ACRES12 "Vegetable acres harvested for fresh market, 2012"
lab var PCH_FRESHVEG_ACRES_07_12 "Vegetable acres harvested for fresh market (% change), 2007 - 12"
lab var FRESHVEG_ACRESPTH07 "Vegetable acres harvested for fresh market/1,000 pop, 2007"
lab var FRESHVEG_ACRESPTH12 "Vegetable acres harvested for fresh market/1,000 pop, 2012"
lab var PCH_FRESHVEG_ACRESPTH_07_12 "Vegetable acres harvested for fresh market/1,000 pop (% change), 2007 - 12"
lab var ORCHARD_FARMS07 "Orchard farms, 2007"
lab var ORCHARD_FARMS12 "Orchard farms, 2012"
lab var PCH_ORCHARD_FARMS_07_12 "Orchard farms (% change), 2007 - 12"
lab var ORCHARD_ACRES07 "Orchard acres, 2007"
lab var ORCHARD_ACRES12 "Orchard acres, 2012"
lab var PCH_ORCHARD_ACRES_07_12 "Orchard acres (% change), 2007 - 12"
lab var ORCHARD_ACRESPTH07 "Orchard acres/1,000 pop, 2007"
lab var ORCHARD_ACRESPTH12 "Orchard acres/1,000 pop, 2012"
lab var PCH_ORCHARD_ACRESPTH_07_12 "Orchard acres/1,000 pop (% change), 2007 - 12"
lab var BERRY_FARMS07 "Berry farms, 2007"
lab var BERRY_FARMS12 "Berry farms, 2012"
lab var PCH_BERRY_FARMS_07_12 "Berry farms (% change), 2007 - 12"
lab var BERRY_ACRES07 "Berry acres, 2007"
lab var BERRY_ACRES12 "Berry acres, 2012"
lab var PCH_BERRY_ACRES_07_12 "Berry acres (% change), 2007 - 12"
lab var BERRY_ACRESPTH07 "Berry acres/1,000 pop, 2007"
lab var BERRY_ACRESPTH12 "Berry acres/1,000 pop, 2012"
lab var PCH_BERRY_ACRESPTH_07_12 "Berry acres/1,000 pop (% change), 2007 - 12"
lab var SLHOUSE07 "Small slaughterhouse facilities, 2007"
lab var SLHOUSE12 "Small slaughterhouse facilities, 2012"
lab var PCH_SLHOUSE_07_12 "Small slaughterhouse facilities (% change), 2007 - 12"
lab var GHVEG_FARMS07 "Greenhouse vegetable and fresh herb farms, 2007"
lab var GHVEG_FARMS12 "Greenhouse vegetable and fresh herb farms, 2012"
lab var PCH_GHVEG_FARMS_07_12 "Greenhouse vegetable and fresh herb farms (% change), 2007 - 12"
lab var GHVEG_SQFT07 "Greenhouse veg and fresh herb sq feet, 2007"
lab var GHVEG_SQFT12 "Greenhouse veg and fresh herb sq feet, 2012"
lab var PCH_GHVEG_SQFT_07_12 "Greenhouse veg and fresh herb sq feet (% change), 2007 - 12"
lab var GHVEG_SQFTPTH07 "Greenhouse veg and fresh herb sq feet/1,000 pop, 2007"
lab var GHVEG_SQFTPTH12 "Greenhouse veg and fresh herb sq feet/1,000 pop, 2012"
lab var PCH_GHVEG_SQFTPTH_07_12 "Greenhouse veg and fresh herb sq feet/1,000 pop (% change), 2007 - 12"
lab var FOODHUB18 "Food hubs, 2018"
lab var CSA07 "CSA farms, 2007"
lab var CSA12 "CSA farms, 2012"
lab var PCH_CSA_07_12 "CSA farms (% change), 2007 - 12"
lab var AGRITRSM_OPS07 "Agritourism operations, 2007"
lab var AGRITRSM_OPS12 "Agritourism operations, 2012"
lab var PCH_AGRITRSM_OPS_07_12 "Agritourism operations (% change), 2007 - 12"
lab var AGRITRSM_RCT07 "Agritourism receipts, 2007"
lab var AGRITRSM_RCT12 "Agritourism receipts, 2012"
lab var PCH_AGRITRSM_RCT_07_12 "Agritourism receipts (% change), 2007 - 12"
lab var FARM_TO_SCHOOL13 "Farm to school program, 2013"
lab var FARM_TO_SCHOOL15 "Farm to school program, 2015"
lab var PCT_DIABETES_ADULTS08 "Adult diabetes rate, 2008"
lab var PCT_DIABETES_ADULTS13 "Adult diabetes rate, 2013"
lab var PCT_OBESE_ADULTS12 "Adult obesity rate, 2012*"
lab var PCT_OBESE_ADULTS17 "Adult obesity rate, 2017*"
lab var PCT_HSPA17 "High schoolers physically active (%), 2017*"
lab var RECFAC11 "Recreation & fitness facilities, 2011"
lab var RECFAC16 "Recreation & fitness facilities, 2016"
lab var PCH_RECFAC_11_16 "Recreation & fitness facilities (% change), 2011-16"
lab var RECFACPTH11 "Recreation & fitness facilities/1,000 pop, 2011"
lab var RECFACPTH16 "Recreation & fitness facilities/1,000 pop, 2016"
lab var PCH_RECFACPTH_11_16 "Recreation & fitness facilities/1,000 pop (% change), 2011-16"
lab var PCT_NHWHITE10 "% White, 2010"
lab var PCT_NHBLACK10 "% Black, 2010"
lab var PCT_HISP10 "% Hispanic, 2010"
lab var PCT_NHASIAN10 "% Asian, 2010"
lab var PCT_NHNA10 "% American Indian or Alaska Native, 2010"
lab var PCT_NHPI10 "% Hawaiian or Pacific Islander, 2010"
lab var PCT_65OLDER10 "% Population 65 years or older, 2010"
lab var PCT_18YOUNGER10 "% Population under age 18, 2010"
lab var MEDHHINC15 "Median household income, 2015"
lab var POVRATE15 "Poverty rate, 2015"
lab var PERPOV10 "Persistent-poverty counties, 2010"
lab var CHILDPOVRATE15 "Child poverty rate, 2015"
lab var PERCHLDPOV10 "Persistent-child-poverty counties, 2010"
lab var METRO13 "Metro/nonmetro counties, 2010"
lab var POPLOSS10 "Population-loss counties, 2010"

save "$myfiles$analysis\FoodEnviroAtlas_2020", replace

import excel using "$myfiles\Data\USDA Rural Urban Codes\ruralurbancodes2013", sheet("Rural-urban Continuum Code 2013") firstrow clear
	destring FIPS, replace
	drop if FIPS==.
	ren County_Name County
	tempfile rural
	save `rural', replace
	
use "$myfiles$analysis\FoodEnviroAtlas_2020", clear
merge m:1 FIPS State using `rural', keepusing(Population_2010 RUCC_2013 RUCC_Description)
drop if _merge==2 // Note: unmatched are all territories (Puerto Rico, Guam, US Virgin Islands, etc.)
drop _merge

save "$myfiles$analysis\FSECDiets_USCountyLevelData", replace

// PART 2 // PHYSICAL ACCESS

* Rural/urban classification 
tab RUCC_2013
tab RUCC_Description
encode RUCC_Description, gen(RUCC)
describe RUCC
labellist RUCC

* Low access to a store by urban/rural
tabstat PCT_LACCESS_POP15, stats(min max mean p50 n)
tabstat PCT_LACCESS_POP15 if PCT_LACCESS_POP15>=60, stats(n)
tabstat PCT_LACCESS_POP15 if PCT_LACCESS_POP15>=95, stats(n)
histogram PCT_LACCESS_POP15, freq ytitle(Number of counties) bcolor(gs9) graphregion(fcolor(gs16))
graph export "$myfiles$analysis\Low access to store histogram.png", replace

graph box PCT_LACCESS_POP15, yline(19.2, lcolor(cranberry)) over(RUCC, label(angle(45) labsize(vsmall)) relabel(1 "Urban >1m" 2 "Urban 250k-1m" 3 "Urban <250k" 4 "Rural peri-urban" 5 "Rural remote" 6 "Suburban small peri-urban" 7 "Suburban small remote" 8 "Suburban >20k peri-urban" 9 "Suburban >20k remote")) graphregion(fcolor(gs16)) box(1, fcolor(gs9) lcolor(black)) noouts note("")
graph export "$myfiles$analysis\Low access to store by urban-rurual.png", replace
	* Note for interpretation: outliers not displayed, red line indicates median 	over all counties of 19.2%
	
	* Number of counties per RUCC grouping:
	estpost tabstat PCT_LACCESS_POP15, stats(n) by(RUCC)
	labellist RUCC