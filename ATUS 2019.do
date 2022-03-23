* Kate Schneider


// Part 1 // Housekeeping
* Working directory
global myfiles "C:\Users\kschne29\OneDrive - Johns Hopkins\FSEC\Diets & equity\FSEC Diets & Equity Shared Folder"
global analysis "\Analysis"
global data "\Data\2019 ATUS"
cd "$myfiles"

// Part 2 // Data management

**# Bookmark #1
**Respondent dataset
#delimit ;
 
import delimited
tucaseid
tulineno
tuyear
tumonth
teabsrsn
teern
teernh1o
teernh2
teernhro
teernhry
teernper
teernrt
teernuot
teernwkp
tehrftpt
tehrusl1
tehrusl2
tehruslt
teio1cow
teio1icd
teio1ocd
telayavl
telaylk
telfs
telkavl
telkm1
temjot
teret1
teschenr
teschft
teschlvl
tespempnot
tespuhrs
trchildnum
trdpftpt
trdtind1
trdtocc1
trernhly
trernupd
trernwa
trhernal
trhhchild
trholiday
trimind1
trmjind1
trmjocc1
trmjocgr
trnhhchild
trnumhou
trohhchild
trspftpt
trsppres
trtalone
trtalone_wk
trtcc
trtccc
trtccc_wk
trtcctot
trtchild
trtcoc
trtec
trtfamily
trtfriend
trthh
trthhfamily
trtnochild
trtnohh
trto
trtohh
trtohhchild
trtonhh
trtonhhchild
trtsponly
trtspouse
trtunmpart
trwernal
tryhhchild
tthr
ttot
ttwk
tuabsot
tubus
tubus1
tubus2ot
tubusl1
tubusl2
tubusl3
tubusl4
tucc2
tucc4
tucc5b_ck
tucc5_ck
tucc9
tudiarydate
tudiaryday
tudis
tudis1
tudis2
tuecytd
tuelder
tuelfreq
tuelnum
tuern2
tuernh1c
tufinlwgt
tufwk
tuio1mfg
tuiodp1
tuiodp2
tuiodp3
tulay
tulay6m
tulayavr
tulaydt
tulk
tulkavr
tulkdk1
tulkdk2
tulkdk3
tulkdk4
tulkdk5
tulkdk6
tulkm2
tulkm3
tulkm4
tulkm5
tulkm6
tulkps1
tulkps2
tulkps3
tulkps4
tulkps5
tulkps6
turetot
tuspabs
tuspusft
tuspwk
txabsrsn
txern
txernh1o
txernh2
txernhro
txernhry
txernper
txernrt
txernuot
txernwkp
txhrftpt
txhrusl1
txhrusl2
txhruslt
txio1cow
txio1icd
txio1ocd
txlayavl
txlaylk
txlfs
txlkavl
txlkm1
txmjot
txret1
txschenr
txschft
txschlvl
txspempnot
txspuhrs
txtcc
txtcctot
txtcoc
txthh
txtnohh
txto
txtohh
txtonhh
 using "$myfiles$data\atusresp_2019.dat", stringcols(1) ;
 
label variable teabsrsn "Edited: what was the main reason you were absent from your job last week?";
label variable teern "Edited: total weekly earnings from overtime pay, tips, and commissions (2 implied decimals)";
label variable teernh1o "Edited: excluding overtime pay, tips, and commissions, what is your hourly rate of pay on your main job? (2 implied decimals)";
label variable teernh2 "Edited: excluding overtime pay, tips, and commissions, what is your hourly rate of pay on your main job? (2 implied decimals)";
label variable teernhro "Edited: how many hours do you usually work per week at this rate?";
label variable teernhry "Edited: hourly/non-hourly status";
label variable teernper "Edited: for your main job, what is the easiest way for you to report your total earnings before taxes or other deductions: hourl";
label variable teernrt "Edited: even though you told me it is easier to report your earnings another way, are you paid at an hourly rate on this job?";
label variable teernuot "Edited: do you usually receive overtime pay, tips, or commissions at your main job?";
label variable teernwkp "Edited: how many weeks a year do you get paid?";
label variable tehrftpt "Edited: do you usually work more than 35 hours per week at your job(s)/family business?";
label variable tehrusl1 "Edited: how many hours per week do you usually work at your main job?";
label variable tehrusl2 "Edited: how many hours per week do you usually work at your other job(s)?";
label variable tehruslt "Edited: total hours usually worked per week (sum of TEHRUSL1 and TEHRUSL2)";
label variable teio1cow "Edited: individual class of worker code (main job)";
label variable teio1icd "Edited: industry code (main job)";
label variable teio1ocd "Edited: occupation code (main job)";
label variable telayavl "Edited: could you have returned to work in the last seven days if you had been recalled?";
label variable telaylk "Edited: even though you expect to be called back to work, have you been looking for work during the last four weeks?";
label variable telfs "Edited: labor force status";
label variable telkavl "Edited: could you have started a job in the last seven days if one had been offered?";
label variable telkm1 "Edited: what are all of the things you have done to find work during the last 4 weeks? (first method)";
label variable temjot "Edited: in the last seven days did you have more than one job?";
label variable teret1 "Edited: do you currently want a job, either full or part time?";
label variable teschenr "Edited: are you enrolled in high school, college, or university?";
label variable teschft "Edited: are you enrolled as a full-time or part-time student?";
label variable teschlvl "Edited: would that be high school, college, or university?";
label variable tespempnot "Edited: employment status of spouse or unmarried partner";
label variable tespuhrs "Edited: usual hours of work of spouse or unmarried partner";
label variable trchildnum "Number of household children < 18";
label variable trdpftpt "Full time or part time employment status of respondent";
label variable trdtind1 "Detailed industry recode (main job)";
label variable trdtocc1 "Detailed occupation recode (main job)";
label variable trernhly "Hourly earnings at main job (2 implied decimals)";
label variable trernupd "Earnings update flag";
label variable trernwa "Weekly earnings at main job (2 implied decimals)";
label variable trhernal "TRERNHLY: allocation flag";
label variable trhhchild "Presence of household children < 18";
label variable trholiday "Flag to indicate if diary day was a holiday";
label variable trimind1 "Intermediate industry recode (main job)";
label variable trmjind1 "Major industry recode (main job)";
label variable trmjocc1 "Major occupation recode (main job)";
label variable trmjocgr "Major occupation category (main job)";
label variable trnhhchild "Presence of own non-household child < 18";
label variable trnumhou "Number of people living in respondent's household";
label variable trohhchild "Presence of own household children < 18";
label variable trspftpt "Full time or part time employment status of spouse or unmarried partner";
label variable trsppres "Presence of the respondent's spouse or unmarried partner in the household";
label variable trtalone "Total nonwork-related time respondent spent alone (in minutes)";
label variable trtalone_wk "Total work- and nonwork-related time respondent spent alone (in minutes)";
label variable trtcc "Total time spent during diary day providing secondary childcare for household and own non-household children < 13";
label variable trtccc "Total nonwork-related time respondent spent with customers, clients, and coworkers (in minutes)";
label variable trtccc_wk "Total work- and nonwork-related time respondent spent with customers, clients, and coworkers (in minutes)";
label variable trtcctot "Total time spent during diary day providing secondary childcare for all children < 13";
label variable trtchild "Total time respondent spent with household or non-household children < 18";
label variable trtcoc "Total time spent during diary day providing secondary childcare for non-own, non-household children < 13";
label variable trtec "Total time spent providing eldercare (in minutes)";
label variable trtfamily "Total time respondent spent with family members";
label variable trtfriend "Total time respondent spent with friends";
label variable trthh "Total time spent during diary day providing secondary childcare for household children < 13";
label variable trthhfamily "Total time respondent spent with household family members";
label variable trtnochild "Total time respondent spent with non-own children < 18";
label variable trtnohh "Total time spent during diary day providing secondary childcare for non-own household children < 13";
label variable trto "Total time spent during diary day providing secondary childcare for own children < 13";
label variable trtohh "Total time spent during diary day providing secondary childcare for own household children < 13";
label variable trtohhchild "Total time respondent spent with own household children < 18";
label variable trtonhh "Total time spent during diary day providing secondary childcare for own non-household children < 13";
label variable trtonhhchild "Total time respondent spent with own non-household children < 18";
label variable trtsponly "Total time respondent spent with spouse only";
label variable trtspouse "Total time respondent spent with spouse (others may be present)";
label variable trtunmpart "Total time respondent spent with unmarried partner (others may be present)";
label variable trwernal "TRERNWA: allocation flag";
label variable tryhhchild "Age of youngest household child < 18";
label variable tthr "Hourly pay topcode flag";
label variable ttot "Overtime amount topcode flag";
label variable ttwk "Weekly earnings topcode flag";
label variable tuabsot "In the last seven days, did you have a job either full or part time?";
label variable tubus "Does anyone in the household own a business or a farm?";
label variable tubus1 "In the last seven days, did you do any unpaid work in the family business or farm?";
label variable tubus2ot "Do you receive payments or profits from the business?";
label variable tubusl1 "TULINENO of farm or business owner (first owner)";
label variable tubusl2 "TULINENO of farm or business owner (second owner)";
label variable tubusl3 "TULINENO of farm or business owner (third owner)";
label variable tubusl4 "TULINENO of farm or business owner (fourth owner)";
label variable tucaseid "ATUS Case ID (14-digit identifier)";
label variable tucc2 "Time first household child < 13 woke up";
label variable tucc4 "Time last household child < 13 went to bed";
label variable tucc5b_ck "Reason respondent did not report secondary childcare activities for non-own household children";
label variable tucc5_ck "Reason respondent did not report secondary childcare activities for own household children";
label variable tucc9 "Are the non-own, non-household children you cared for in TUCC8 related to you?";
label variable tudiarydate "Date of diary day (date about which the respondent was interviewed)";
label variable tudiaryday "Day of the week of diary day (day of the week about which the respondent was interviewed)";
label variable tudis "Last time we spoke to someone in this household you were reported to have a disability. Does your disability prevent you from do";
label variable tudis1 "Does your disability prevent you from accepting any kind of work during the next six months?";
label variable tudis2 "Do you have a disability that prevents you from accepting any kind of work during the next six months?";
label variable tuecytd "Did you provide any eldercare or assistance yesterday?";
label variable tuelder "Not including financial assistance or help you provided as part of your paid job, since the first of [REF_MONTH], have you provided any care of assistance for an adult who needed help because of a condition related to aging?";
label variable tuelfreq "How often did you provide this care?";
label variable tuelnum "Since the first of [REF_MONTH], how many people have you provided this care to?";
label variable tuern2 "Weekly overtime earnings (2 implied decimals)";
label variable tuernh1c "What is your hourly rate of pay on this job, excluding overtime pay, tips, or commissions? (2 implied decimals)";
label variable tufinlwgt "ATUS final weight";
label variable tufwk "In the last seven days did you do any work for pay or profit?";
label variable tuio1mfg "Is this business or organization mainly manufacturing, retail trade, wholesale trade, or something else? (main job)";
label variable tuiodp1 "Last time we spoke to someone in this household, you were reported to work for (employer's name). Do you still work for (employe";
label variable tuiodp2 "Have the usual activities and duties of your job changed since (month of CPS interview)? (main job)";
label variable tuiodp3 "Last time we spoke to someone in this household, you were reported as (occupation) and your usual duties were (activities). Is t";
label variable tulay "During the last seven days were you on layoff from your job?";
label variable tulay6m "Have you been given any indication that you will be recalled to work within the next 6 months?";
label variable tulayavr "Why could you not have started a job in the last week?";
label variable tulaydt "Has your employer given you a date to return to work? (to layoff job)";
label variable tulineno "ATUS person line number";
label variable tulk "Have you been doing anything to find work during the last four weeks?";
label variable tulkavr "Why could you not have started a job last week?";
label variable tulkdk1 "You said you have been trying to find work. How did you go about looking? (first method)";
label variable tulkdk2 "TULKDK1 text: (second method)";
label variable tulkdk3 "TULKDK1 text: (third method)";
label variable tulkdk4 "TULKDK1 text: (fourth method)";
label variable tulkdk5 "TULKDK1 text: (fifth method)";
label variable tulkdk6 "TULKDK1 text: (sixth method)";
label variable tulkm2 "What are all of the things you have done to find work during the last 4 weeks? (second method)";
label variable tulkm3 "TULKM2 text: (third method)";
label variable tulkm4 "TULKM2 text: (fourth method)";
label variable tulkm5 "TULKM2 text: (fifth method)";
label variable tulkm6 "TULKM2 text: (sixth method)";
label variable tulkps1 "Can you tell me more about what you did to search for work? (first method)";
label variable tulkps2 "TULKPS1 text: (second method)";
label variable tulkps3 "TULKPS1 text: (third method)";
label variable tulkps4 "TULKPS1 text: (fourth method)";
label variable tulkps5 "TULKPS1 text: (fifth method)";
label variable tulkps6 "TULKPS1 text: (sixth method)";
label variable tumonth "Month of diary day (month of day about which ATUS respondent was interviewed)";
label variable turetot "The last time we spoke to someone in this household you were reported to be retired. Are you still retired?";
label variable tuspabs "In the last seven days, did your spouse or unmarried partner have a job either full or part time?";
label variable tuspusft "Does your spouse or unmarried partner usually work 35 hours or more per week?";
label variable tuspwk "In the last seven days, did your spouse or unmarried partner do any work for pay or profit?";
label variable tuyear "Year of diary day (year of day about which respondent was interviewed)";
label variable txabsrsn "TEABSRSN: allocation flag";
label variable txern "TEERN: allocation flag";
label variable txernh1o "TEERNH1O: allocation flag";
label variable txernh2 "TEERNH2: allocation flag";
label variable txernhro "TEERNHRO: allocation flag";
label variable txernhry "TEERNHRY: allocation flag";
label variable txernper "TEERNPER: allocation flag";
label variable txernrt "TEERNRT: allocation flag";
label variable txernuot "TEERNUOT: allocation flag";
label variable txernwkp "TEERNWKP: allocation flag";
label variable txhrftpt "TEHRFTPT: allocation flag";
label variable txhrusl1 "TEHRUSL1: allocation flag";
label variable txhrusl2 "TEHRUSL2: allocation flag";
label variable txhruslt "TEHRUSLT: allocation flag";
label variable txio1cow "TEIO1COW: allocation flag";
label variable txio1icd "TEIO1ICD: allocation flag";
label variable txio1ocd "TEIO1OCD: allocation flag";
label variable txlayavl "TELAYAVL: allocation flag";
label variable txlaylk "TELAYLK: allocation flag";
label variable txlfs "TELFS: allocation flag";
label variable txlkavl "TELKAVL: allocation flag";
label variable txlkm1 "TELKM1: allocation flag";
label variable txmjot "TEMJOT: allocation flag";
label variable txret1 "TERET1: allocation flag";
label variable txschenr "TESCHENR: allocation flag";
label variable txschft "TESCHFT: allocation flag";
label variable txschlvl "TESCHLVL: allocation flag";
label variable txspempnot "TESPEMPNOT: allocation flag";
label variable txspuhrs "TESPUHRS: allocation flag";
label variable txtcc "TRTCC_LN and TRTCC: allocation flag";
label variable txtcctot "TRTCCTOT_LN and TRTCCTOT: allocation flag";
label variable txtcoc "TRTCOC_LN and TRTCOC: allocation flag";
label variable txthh "TRTHH_LN and TRTHH: allocation flag";
label variable txtnohh "TRTNOHH_LN and TRTNOHH: allocation flag";
label variable txto "TRTO_LN and TRTO: allocation flag";
label variable txtohh "TRTOHH_LN and TRTOHH: allocation flag";
label variable txtonhh "TRTONHH_LN and TRTONHH: allocation flag";
 
label define labelteabsrsn
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "On layoff (temporary or indefinite)"
2 "Slack work/business conditions"
3 "Waiting for a new job to begin"
4 "Vacation/personal days"
5 "Own illness/injury/medical problems"
6 "Childcare problems"
7 "Other family/personal obligation"
8 "Maternity/paternity leave"
9 "Labor dispute"
10 "Weather affected job"
11 "School/training"
12 "Civic/military duty"
13 "Does not work in the business"
14 "Other"
;
label define labelteernhry
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Paid hourly"
2 "Not paid hourly"
;
label define labelteernper
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Hourly"
2 "Weekly"
3 "Bi-weekly"
4 "Twice monthly"
5 "Monthly"
6 "Annually"
7 "Other"
;
label define labelteernrt
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
;
label define labelteernuot
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
;
label define labeltehrftpt
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
3 "Hours vary"
;
label define labelteio1cow
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Government, federal"
2 "Government, state"
3 "Government, local"
4 "Private, for profit"
5 "Private, nonprofit"
6 "Self-employed, incorporated"
7 "Self-employed, unincorporated"
8 "Without pay"
;
label define labeltelayavl
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
;
label define labeltelaylk
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
;
label define labeltelfs
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Employed - at work"
2 "Employed - absent"
3 "Unemployed - on layoff"
4 "Unemployed - looking"
5 "Not in labor force"
;
label define labeltelkavl
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
;
label define labeltelkm1
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Contacted employer directly/interview"
2 "Contacted public employment agency"
3 "Contacted private employment agency"
4 "Contacted friends or relatives"
5 "Contacted school/university employment center"
6 "Sent out resumes/filled out applications"
7 "Checked union/professional registers"
8 "Placed or answered ads"
9 "Other active"
10 "Looked at ads"
11 "Attended job training programs/courses"
12 "Nothing"
13 "Other passive"
;
label define labeltemjot
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
;
label define labelteret1
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes or maybe/it depends"
2 "No"
3 "Has a job"
;
label define labelteschenr
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
;
label define labelteschft
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Full time"
2 "Part time"
;
label define labelteschlvl
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "High school"
2 "College or university"
;
label define labeltespempnot
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Employed"
2 "Not employed"
;
label define labeltrdpftpt
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Full time"
2 "Part time"
;
label define labeltrdtocc1
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Management occupations"
2 "Business and financial operations occupations"
3 "Computer and mathematical science occupations"
4 "Architecture and engineering occupations"
5 "Life, physical, and social science occupations"
6 "Community and social service occupations"
7 "Legal occupations"
8 "Education, training, and library occupations"
9 "Arts, design, entertainment, sports, and media occupations"
10 "Healthcare practitioner and technical occupations"
11 "Healthcare support occupations"
12 "Protective service occupations"
13 "Food preparation and serving related occupations"
14 "Building and grounds cleaning and maintenance occupations"
15 "Personal care and service occupations"
16 "Sales and related occupations"
17 "Office and administrative support occupations"
18 "Farming, fishing, and forestry occupations"
19 "Construction and extraction occupations"
20 "Installation, maintenance, and repair occupations"
21 "Production occupations"
22 "Transportation and material moving occupations"
;
label define labeltrernupd
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Earnings carried forward from final CPS interview"
1 "Earnings updated in ATUS"
;
label define labeltrhernal
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "TRERNHLY does not contain allocated information"
1 "TRERNHLY contains allocated information"
;
label define labeltrhhchild
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
;
label define labeltrholiday
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Diary day was not a holiday"
1 "Diary day was a holiday"
;
label define labeltrimind1
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Agriculture, forestry, fishing, and hunting"
2 "Mining, quarrying, and oil and gas extraction"
3 "Construction"
4 "Manufacturing - durable goods"
5 "Manufacturing - non-durable goods"
6 "Wholesale trade"
7 "Retail trade"
8 "Transportation and warehousing"
9 "Utilities"
10 "Information"
11 "Finance and insurance"
12 "Real estate and rental and leasing"
13 "Professional and technical services"
14 "Management, administrative and waste management services"
15 "Educational services"
16 "Health care and social services"
17 "Arts, entertainment, and recreation"
18 "Accommodation and food services"
19 "Private households"
20 "Other services, except private households"
21 "Public administration"
;
label define labeltrmjind1
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Agriculture, forestry, fishing, and hunting"
2 "Mining, quarrying, and oil and gas extraction"
3 "Construction"
4 "Manufacturing"
5 "Wholesale and retail trade"
6 "Transportation and utilities"
7 "Information"
8 "Financial activities"
9 "Professional and business services"
10 "Educational and health services"
11 "Leisure and hospitality"
12 "Other services"
13 "Public administration"
;
label define labeltrmjocc1
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Management, business, and financial occupations"
2 "Professional and related occupations"
3 "Service occupations"
4 "Sales and related occupations"
5 "Office and administrative support occupations"
6 "Farming, fishing, and forestry occupations"
7 "Construction and extraction occupations"
8 "Installation, maintenance, and repair occupations"
9 "Production occupations"
10 "Transportation and material moving occupations"
;
label define labeltrmjocgr
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Management, professional, and related occupations"
2 "Service occupations"
3 "Sales and office occupations"
4 "Farming, fishing, and forestry occupations"
5 "Construction and maintenance occupations"
6 "Production, transportation, and material moving occupations"
;
label define labeltrnhhchild
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
;
label define labeltrohhchild
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
;
label define labeltrspftpt
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Full time"
2 "Part time"
3 "Hours vary"
;
label define labeltrsppres
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Spouse present"
2 "Unmarried partner present"
3 "No spouse or unmarried partner present"
;
label define labeltrwernal
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "TRERNWA does not contain allocated information"
1 "TRERNWA contains allocated information"
;
label define labeltthr
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Not topcoded"
1 "Topcoded"
;
label define labelttot
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Not topcoded"
1 "Topcoded"
;
label define labelttwk
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Not topcoded"
1 "Topcoded"
;
label define labeltuabsot
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
3 "Retired"
4 "Disabled"
5 "Unable to work"
;
label define labeltubus
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
;
label define labeltubus1
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
;
label define labeltubus2ot
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
;
label define labeltucc5b_ck
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "No secondary childcare activities"
2 "Respondent didn't know"
3 "Respondent refused to answer"
4 "Child was away from home yesterday"
5 "Respondent was away from home yesterday"
;
label define labeltucc5_ck
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "No secondary childcare activities"
2 "Respondent didn`t know"
3 "Respondent refused to answer"
4 "Child was away from home yesterday"
5 "Respondent was away from home yesterday"
;
label define labeltucc9
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
3 "Some are, some are not"
;
label define labeltudiaryday
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Sunday"
2 "Monday"
3 "Tuesday"
4 "Wednesday"
5 "Thursday"
6 "Friday"
7 "Saturday"
;
label define labeltudis
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
3 "Did not have a disability last time"
;
label define labeltudis1
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
;
label define labeltudis2
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
;
label define labeltuecytd
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
;
label define labeltuelder
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
;
label define labeltuelfreq
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Daily"
2 "Several times a week"
3 "About once a week"
4 "Several times a month"
5 "Once a month"
6 "One time"
7 "Other"
;
label define labeltufwk
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
3 "Retired"
4 "Disabled"
5 "Unable to work"
;
label define labeltuio1mfg
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Manufacturing"
2 "Retail trade"
3 "Wholesale trade"
4 "Something else"
;
label define labeltuiodp1
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
;
label define labeltuiodp2
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
;
label define labeltuiodp3
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
;
label define labeltulay
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
3 "Retired"
4 "Disabled"
5 "Unable to work"
;
label define labeltulay6m
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
;
label define labeltulayavr
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Own temporary illness"
2 "Going to school"
3 "Other"
;
label define labeltulaydt
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
;
label define labeltulk
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
3 "Retired"
4 "Disabled"
5 "Unable to work"
;
label define labeltulkavr
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Waiting for new job to begin"
2 "Own temporary illness"
3 "Going to school"
4 "Other"
;
label define labeltulkdk1
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Contacted employer directly/interview"
2 "Contacted public employment agency"
3 "Contacted private employment agency"
4 "Contacted friends or relatives"
5 "Contacted school/university employment center"
6 "Sent out resumes/filled out applications"
7 "Checked union/professional registers"
8 "Placed or answered ads"
9 "Other active"
10 "Looked at ads"
11 "Attended job training programs/courses"
12 "Nothing"
13 "Other passive"
;
label define labeltulkdk2
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Contacted employer directly/interview"
2 "Contacted public employment agency"
3 "Contacted private employment agency"
4 "Contacted friends or relatives"
5 "Contacted school/university employment center"
6 "Sent out resumes/filled out applications"
7 "Checked union/professional registers"
8 "Placed or answered ads"
9 "Other active"
10 "Looked at ads"
11 "Attended job training programs/courses"
13 "Other passive"
97 "No additional job search activities"
;
label define labeltulkdk3
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Contacted Employer Directly/Interview"
2 "Contacted Public Employment Agency"
3 "Contacted Private Employment Agency"
4 "Contacted Friends or Relatives"
5 "Contacted School/University Employment Center"
6 "Sent Out Resumes/Filled Out Applications"
7 "Check Union/Professional Registers"
8 "Placed or Answered Ads"
9 "Other Active"
10 "Looked at Ads"
11 "Attended Job Training Programs/Courses"
13 "Other Passive"
97 "No Additional Job Search Activities"
;
label define labeltulkdk4
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Contacted Employer Directly/Interview"
2 "Contacted Public Employment Agency"
3 "Contacted Private Employment Agency"
4 "Contacted Friends or Relatives"
5 "Contacted School/University Employment Center"
6 "Sent Out Resumes/Filled Out Applications"
7 "Check Union/Professional Registers"
8 "Placed or Answered Ads"
9 "Other Active"
10 "Looked at Ads"
11 "Attended Job Training Programs/Courses"
13 "Other Passive"
97 "No Additional Job Search Activities"
;
label define labeltulkdk5
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Contacted Employer Directly/Interview"
2 "Contacted Public Employment Agency"
3 "Contacted Private Employment Agency"
4 "Contacted Friends or Relatives"
5 "Contacted School/University Employment Center"
6 "Sent Out Resumes/Filled Out Applications"
7 "Check Union/Professional Registers"
8 "Placed or Answered Ads"
9 "Other Active"
10 "Looked at Ads"
11 "Attended Job Training Programs/Courses"
13 "Other Passive"
97 "No Additional Job Search Activities"
;
label define labeltulkdk6
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Contacted Employer Directly/Interview"
2 "Contacted Public Employment Agency"
3 "Contacted Private Employment Agency"
4 "Contacted Friends or Relatives"
5 "Contacted School/University Employment Center"
6 "Sent Out Resumes/Filled Out Applications"
7 "Check Union/Professional Registers"
8 "Placed or Answered Ads"
9 "Other Active"
10 "Looked at Ads"
11 "Attended Job Training Programs/Courses"
13 "Other Passive"
97 "No Additional Job Search Activities"
;
label define labeltulkm2
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Contacted employer directly/interview"
2 "Contacted public employment agency"
3 "Contacted private employment agency"
4 "Contacted friends or relatives"
5 "Contacted school/university employment center"
6 "Sent out resumes/filled out applications"
7 "Checked union/professional registers"
8 "Placed or answered ads"
9 "Other active"
10 "Looked at ads"
11 "Attended job training programs/courses"
13 "Other passive"
97 "No additional job search activities"
;
label define labeltulkm3
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Contacted employer directly/interview"
2 "Contacted public employment agency"
3 "Contacted private employment agency"
4 "Contacted friends or relatives"
5 "Contacted school/university employment center"
6 "Sent out resumes/filled out applications"
7 "Check union/professional registers"
8 "Placed or answered ads"
9 "Other active"
10 "Looked at ads"
11 "Attended job training programs/courses"
13 "Other passive"
97 "No additional job search activities"
;
label define labeltulkm4
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Contacted employer directly/interview"
2 "Contacted public employment agency"
3 "Contacted private employment agency"
4 "Contacted friends or relatives"
5 "Contacted school/university employment center"
6 "Sent out resumes/filled out applications"
7 "Check union/professional registers"
8 "Placed or answered ads"
9 "Other active"
10 "Looked at ads"
11 "Attended job training programs/courses"
13 "Other passive"
97 "No additional job search activities"
;
label define labeltulkm5
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Contacted employer directly/interview"
2 "Contacted public employment agency"
3 "Contacted private employment agency"
4 "Contacted friends or relatives"
5 "Contacted school/university employment center"
6 "Sent out resumes/filled out applications"
7 "Check union/professional registers"
8 "Placed or answered ads"
9 "Other active"
10 "Looked at ads"
11 "Attended job training programs/courses"
13 "Other passive"
97 "No additional job search activities"
;
label define labeltulkm6
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Contacted employer directly/interview"
2 "Contacted public employment agency"
3 "Contacted private employment agency"
4 "Contacted friends or relatives"
5 "Contacted school/university employment center"
6 "Sent out resumes/filled out applications"
7 "Check union/professional registers"
8 "Placed or answered ads"
9 "Other active"
10 "Looked at ads"
11 "Attended job training programs/courses"
13 "Other passive"
97 "No additional job search activities"
;
label define labeltulkps1
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Contacted employer directly/interview"
2 "Contacted public employment agency"
3 "Contacted private employment agency"
4 "Contacted friends or relatives"
5 "Contacted school/university employment center"
6 "Sent out resumes/filled out applications"
7 "Checked union/professional registers"
8 "Placed or answered ads"
9 "Other active"
10 "Looked at ads"
11 "Attended job training programs/courses"
12 "Nothing"
13 "Other passive"
97 "No more job search activities"
;
label define labeltulkps2
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Contacted employer directly/interview"
2 "Contacted public employment agency"
3 "Contacted private employment agency"
4 "Contacted friends or relatives"
5 "Contacted school/university employment center"
6 "Sent out resumes/filled out applications"
7 "Checked union/professional registers"
8 "Placed or answered ads"
9 "Other active"
10 "Looked at ads"
11 "Attended job training programs/courses"
13 "Other passive"
97 "No additional job search activities"
;
label define labeltulkps3
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Contacted Employer Directly/Interview"
2 "Contacted Public Employment Agency"
3 "Contacted Private Employment Agency"
4 "Contacted Friends or Relatives"
5 "Contacted School/University Employment Center"
6 "Sent Out Resumes/Filled Out Applications"
7 "Check Union/Professional Registers"
8 "Placed or Answered Ads"
9 "Other Active"
10 "Looked at Ads"
11 "Attended Job Training Programs/Courses"
13 "Other Passive"
97 "No Additional Job Search Activities"
;
label define labeltulkps4
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Contacted Employer Directly/Interview"
2 "Contacted Public Employment Agency"
3 "Contacted Private Employment Agency"
4 "Contacted Friends or Relatives"
5 "Contacted School/University Employment Center"
6 "Sent Out Resumes/Filled Out Applications"
7 "Check Union/Professional Registers"
8 "Placed or Answered Ads"
9 "Other Active"
10 "Looked at Ads"
11 "Attended Job Training Programs/Courses"
13 "Other Passive"
97 "No Additional Job Search Activities"
;
label define labeltulkps5
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Contacted Employer Directly/Interview"
2 "Contacted Public Employment Agency"
3 "Contacted Private Employment Agency"
4 "Contacted Friends or Relatives"
5 "Contacted School/University Employment Center"
6 "Sent Out Resumes/Filled Out Applications"
7 "Check Union/Professional Registers"
8 "Placed or Answered Ads"
9 "Other Active"
10 "Looked at Ads"
11 "Attended Job Training Programs/Courses"
13 "Other Passive"
97 "No Additional Job Search Activities"
;
label define labeltulkps6
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Contacted Employer Directly/Interview"
2 "Contacted Public Employment Agency"
3 "Contacted Private Employment Agency"
4 "Contacted Friends or Relatives"
5 "Contacted School/University Employment Center"
6 "Sent Out Resumes/Filled Out Applications"
7 "Check Union/Professional Registers"
8 "Placed or Answered Ads"
9 "Other Active"
10 "Looked at Ads"
11 "Attended Job Training Programs/Courses"
13 "Other Passive"
97 "No Additional Job Search Activities"
;
label define labelturetot
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
3 "Was not retired last time"
;
label define labeltuspabs
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
3 "Retired"
4 "Disabled"
5 "Unable to work"
;
label define labeltuspusft
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
3 "Hours vary"
4 "No longer has a job"
;
label define labeltuspwk
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Yes"
2 "No"
3 "Retired"
4 "Disabled"
5 "Unable to work"
;
label define labeltxabsrsn
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Value - No Change"
1 "Blank - No Change"
2 "Don`t Know - No Change"
3 "Refused - No Change"
10 "Value To Value"
11 "Blank To Value"
12 "Don`t Know To Value"
13 "Refused To Value"
20 "Value To Longitudinal Value"
21 "Blank To Longitudinal Value"
22 "Don`t Know To Longitudinal Value"
23 "Refused To Longitudinal Value"
30 "Value To Allocated Value Long."
31 "Blank To Allocated Value Long."
32 "Don`t Know To Allocated Value Long."
33 "Refused To Allocated Value Long."
40 "Value To Allocated Value"
41 "Blank To Allocated Value"
42 "Don`t Know To Allocated Value"
43 "Refused To Allocated Value"
50 "Value To Blank"
52 "Don`t Know To Blank"
53 "Refused To Blank"
;
label define labeltxern
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Value - No Change"
1 "Blank - No Change"
2 "Don`t Know - No Change"
3 "Refused - No Change"
10 "Value To Value"
11 "Blank To Value"
12 "Don`t Know To Value"
13 "Refused To Value"
20 "Value To Longitudinal Value"
21 "Blank To Longitudinal Value"
22 "Don`t Know To Longitudinal Value"
23 "Refused To Longitudinal Value"
30 "Value To Allocated Value Long."
31 "Blank To Allocated Value Long."
32 "Don`t Know To Allocated Value Long."
33 "Refused To Allocated Value Long."
40 "Value To Allocated Value"
41 "Blank To Allocated Value"
42 "Don`t Know To Allocated Value"
43 "Refused To Allocated Value"
50 "Value To Blank"
52 "Don`t Know To Blank"
53 "Refused To Blank"
;
label define labeltxernh1o
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Value - No Change"
1 "Blank - No Change"
2 "Don`t Know - No Change"
3 "Refused - No Change"
10 "Value To Value"
11 "Blank To Value"
12 "Don`t Know To Value"
13 "Refused To Value"
20 "Value To Longitudinal Value"
21 "Blank To Longitudinal Value"
22 "Don`t Know To Longitudinal Value"
23 "Refused To Longitudinal Value"
30 "Value To Allocated Value Long."
31 "Blank To Allocated Value Long."
32 "Don`t Know To Allocated Value Long."
33 "Refused To Allocated Value Long."
40 "Value To Allocated Value"
41 "Blank To Allocated Value"
42 "Don`t Know To Allocated Value"
43 "Refused To Allocated Value"
50 "Value To Blank"
52 "Don`t Know To Blank"
53 "Refused To Blank"
;
label define labeltxernh2
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Value - No Change"
1 "Blank - No Change"
2 "Don`t Know - No Change"
3 "Refused - No Change"
10 "Value To Value"
11 "Blank To Value"
12 "Don`t Know To Value"
13 "Refused To Value"
20 "Value To Longitudinal Value"
21 "Blank To Longitudinal Value"
22 "Don`t Know To Longitudinal Value"
23 "Refused To Longitudinal Value"
30 "Value To Allocated Value Long."
31 "Blank To Allocated Value Long."
32 "Don`t Know To Allocated Value Long."
33 "Refused To Allocated Value Long."
40 "Value To Allocated Value"
41 "Blank To Allocated Value"
42 "Don`t Know To Allocated Value"
43 "Refused To Allocated Value"
50 "Value To Blank"
52 "Don`t Know To Blank"
53 "Refused To Blank"
;
label define labeltxernhro
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Value - No Change"
1 "Blank - No Change"
2 "Don`t Know - No Change"
3 "Refused - No Change"
10 "Value To Value"
11 "Blank To Value"
12 "Don`t Know To Value"
13 "Refused To Value"
20 "Value To Longitudinal Value"
21 "Blank To Longitudinal Value"
22 "Don`t Know To Longitudinal Value"
23 "Refused To Longitudinal Value"
30 "Value To Allocated Value Long."
31 "Blank To Allocated Value Long."
32 "Don`t Know To Allocated Value Long."
33 "Refused To Allocated Value Long."
40 "Value To Allocated Value"
41 "Blank To Allocated Value"
42 "Don`t Know To Allocated Value"
43 "Refused To Allocated Value"
50 "Value To Blank"
52 "Don`t Know To Blank"
53 "Refused To Blank"
;
label define labeltxernhry
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Value - No Change"
1 "Blank - No Change"
2 "Don`t Know - No Change"
3 "Refused - No Change"
10 "Value To Value"
11 "Blank To Value"
12 "Don`t Know To Value"
13 "Refused To Value"
20 "Value To Longitudinal Value"
21 "Blank To Longitudinal Value"
22 "Don`t Know To Longitudinal Value"
23 "Refused To Longitudinal Value"
30 "Value To Allocated Value Long."
31 "Blank To Allocated Value Long."
32 "Don`t Know To Allocated Value Long."
33 "Refused To Allocated Value Long."
40 "Value To Allocated Value"
41 "Blank To Allocated Value"
42 "Don`t Know To Allocated Value"
43 "Refused To Allocated Value"
50 "Value To Blank"
52 "Don`t Know To Blank"
53 "Refused To Blank"
;
label define labeltxernper
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Value - No Change"
1 "Blank - No Change"
2 "Don`t Know - No Change"
3 "Refused - No Change"
10 "Value To Value"
11 "Blank To Value"
12 "Don`t Know To Value"
13 "Refused To Value"
20 "Value To Longitudinal Value"
21 "Blank To Longitudinal Value"
22 "Don`t Know To Longitudinal Value"
23 "Refused To Longitudinal Value"
30 "Value To Allocated Value Long."
31 "Blank To Allocated Value Long."
32 "Don`t Know To Allocated Value Long."
33 "Refused To Allocated Value Long."
40 "Value To Allocated Value"
41 "Blank To Allocated Value"
42 "Don`t Know To Allocated Value"
43 "Refused To Allocated Value"
50 "Value To Blank"
52 "Don`t Know To Blank"
53 "Refused To Blank"
;
label define labeltxernrt
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Value - No Change"
1 "Blank - No Change"
2 "Don`t Know - No Change"
3 "Refused - No Change"
10 "Value To Value"
11 "Blank To Value"
12 "Don`t Know To Value"
13 "Refused To Value"
20 "Value To Longitudinal Value"
21 "Blank To Longitudinal Value"
22 "Don`t Know To Longitudinal Value"
23 "Refused To Longitudinal Value"
30 "Value To Allocated Value Long."
31 "Blank To Allocated Value Long."
32 "Don`t Know To Allocated Value Long."
33 "Refused To Allocated Value Long."
40 "Value To Allocated Value"
41 "Blank To Allocated Value"
42 "Don`t Know To Allocated Value"
43 "Refused To Allocated Value"
50 "Value To Blank"
52 "Don`t Know To Blank"
53 "Refused To Blank"
;
label define labeltxernuot
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Value - No Change"
1 "Blank - No Change"
2 "Don`t Know - No Change"
3 "Refused - No Change"
10 "Value To Value"
11 "Blank To Value"
12 "Don`t Know To Value"
13 "Refused To Value"
20 "Value To Longitudinal Value"
21 "Blank To Longitudinal Value"
22 "Don`t Know To Longitudinal Value"
23 "Refused To Longitudinal Value"
30 "Value To Allocated Value Long."
31 "Blank To Allocated Value Long."
32 "Don`t Know To Allocated Value Long."
33 "Refused To Allocated Value Long."
40 "Value To Allocated Value"
41 "Blank To Allocated Value"
42 "Don`t Know To Allocated Value"
43 "Refused To Allocated Value"
50 "Value To Blank"
52 "Don`t Know To Blank"
53 "Refused To Blank"
;
label define labeltxernwkp
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Value - No Change"
1 "Blank - No Change"
2 "Don`t Know - No Change"
3 "Refused - No Change"
10 "Value To Value"
11 "Blank To Value"
12 "Don`t Know To Value"
13 "Refused To Value"
20 "Value To Longitudinal Value"
21 "Blank To Longitudinal Value"
22 "Don`t Know To Longitudinal Value"
23 "Refused To Longitudinal Value"
30 "Value To Allocated Value Long."
31 "Blank To Allocated Value Long."
32 "Don`t Know To Allocated Value Long."
33 "Refused To Allocated Value Long."
40 "Value To Allocated Value"
41 "Blank To Allocated Value"
42 "Don`t Know To Allocated Value"
43 "Refused To Allocated Value"
50 "Value To Blank"
52 "Don`t Know To Blank"
53 "Refused To Blank"
;
label define labeltxhrftpt
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Value - No Change"
1 "Blank - No Change"
2 "Don`t Know - No Change"
3 "Refused - No Change"
10 "Value To Value"
11 "Blank To Value"
12 "Don`t Know To Value"
13 "Refused To Value"
20 "Value To Longitudinal Value"
21 "Blank To Longitudinal Value"
22 "Don`t Know To Longitudinal Value"
23 "Refused To Longitudinal Value"
30 "Value To Allocated Value Long."
31 "Blank To Allocated Value Long."
32 "Don`t Know To Allocated Value Long."
33 "Refused To Allocated Value Long."
40 "Value To Allocated Value"
41 "Blank To Allocated Value"
42 "Don`t Know To Allocated Value"
43 "Refused To Allocated Value"
50 "Value To Blank"
52 "Don`t Know To Blank"
53 "Refused To Blank"
;
label define labeltxhrusl1
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Value - No Change"
1 "Blank - No Change"
2 "Don`t Know - No Change"
3 "Refused - No Change"
10 "Value To Value"
11 "Blank To Value"
12 "Don`t Know To Value"
13 "Refused To Value"
20 "Value To Longitudinal Value"
21 "Blank To Longitudinal Value"
22 "Don`t Know To Longitudinal Value"
23 "Refused To Longitudinal Value"
30 "Value To Allocated Value Long."
31 "Blank To Allocated Value Long."
32 "Don`t Know To Allocated Value Long."
33 "Refused To Allocated Value Long."
40 "Value To Allocated Value"
41 "Blank To Allocated Value"
42 "Don`t Know To Allocated Value"
43 "Refused To Allocated Value"
50 "Value To Blank"
52 "Don`t Know To Blank"
53 "Refused To Blank"
;
label define labeltxhrusl2
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Value - No Change"
1 "Blank - No Change"
2 "Don`t Know - No Change"
3 "Refused - No Change"
10 "Value To Value"
11 "Blank To Value"
12 "Don`t Know To Value"
13 "Refused To Value"
20 "Value To Longitudinal Value"
21 "Blank To Longitudinal Value"
22 "Don`t Know To Longitudinal Value"
23 "Refused To Longitudinal Value"
30 "Value To Allocated Value Long."
31 "Blank To Allocated Value Long."
32 "Don`t Know To Allocated Value Long."
33 "Refused To Allocated Value Long."
40 "Value To Allocated Value"
41 "Blank To Allocated Value"
42 "Don`t Know To Allocated Value"
43 "Refused To Allocated Value"
50 "Value To Blank"
52 "Don`t Know To Blank"
53 "Refused To Blank"
;
label define labeltxhruslt
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Value - No Change"
1 "Blank - No Change"
2 "Don`t Know - No Change"
3 "Refused - No Change"
10 "Value To Value"
11 "Blank To Value"
12 "Don`t Know To Value"
13 "Refused To Value"
20 "Value To Longitudinal Value"
21 "Blank To Longitudinal Value"
22 "Don`t Know To Longitudinal Value"
23 "Refused To Longitudinal Value"
30 "Value To Allocated Value Long."
31 "Blank To Allocated Value Long."
32 "Don`t Know To Allocated Value Long."
33 "Refused To Allocated Value Long."
40 "Value To Allocated Value"
41 "Blank To Allocated Value"
42 "Don`t Know To Allocated Value"
43 "Refused To Allocated Value"
50 "Value To Blank"
52 "Don`t Know To Blank"
53 "Refused To Blank"
;
label define labeltxio1cow
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Value - No Change"
1 "Blank - No Change"
2 "Don`t Know - No Change"
3 "Refused - No Change"
10 "Value To Value"
11 "Blank To Value"
12 "Don`t Know To Value"
13 "Refused To Value"
20 "Value To Longitudinal Value"
21 "Blank To Longitudinal Value"
22 "Don`t Know To Longitudinal Value"
23 "Refused To Longitudinal Value"
30 "Value To Allocated Value Long."
31 "Blank To Allocated Value Long."
32 "Don`t Know To Allocated Value Long."
33 "Refused To Allocated Value Long."
40 "Value To Allocated Value"
41 "Blank To Allocated Value"
42 "Don`t Know To Allocated Value"
43 "Refused To Allocated Value"
50 "Value To Blank"
52 "Don`t Know To Blank"
53 "Refused To Blank"
;
label define labeltxio1icd
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Value - No Change"
1 "Blank - No Change"
2 "Don`t Know - No Change"
3 "Refused - No Change"
10 "Value To Value"
11 "Blank To Value"
12 "Don`t Know To Value"
13 "Refused To Value"
20 "Value To Longitudinal Value"
21 "Blank To Longitudinal Value"
22 "Don`t Know To Longitudinal Value"
23 "Refused To Longitudinal Value"
30 "Value To Allocated Value Long."
31 "Blank To Allocated Value Long."
32 "Don`t Know To Allocated Value Long."
33 "Refused To Allocated Value Long."
40 "Value To Allocated Value"
41 "Blank To Allocated Value"
42 "Don`t Know To Allocated Value"
43 "Refused To Allocated Value"
50 "Value To Blank"
52 "Don`t Know To Blank"
53 "Refused To Blank"
;
label define labeltxio1ocd
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Value - No Change"
1 "Blank - No Change"
2 "Don`t Know - No Change"
3 "Refused - No Change"
10 "Value To Value"
11 "Blank To Value"
12 "Don`t Know To Value"
13 "Refused To Value"
20 "Value To Longitudinal Value"
21 "Blank To Longitudinal Value"
22 "Don`t Know To Longitudinal Value"
23 "Refused To Longitudinal Value"
30 "Value To Allocated Value Long."
31 "Blank To Allocated Value Long."
32 "Don`t Know To Allocated Value Long."
33 "Refused To Allocated Value Long."
40 "Value To Allocated Value"
41 "Blank To Allocated Value"
42 "Don`t Know To Allocated Value"
43 "Refused To Allocated Value"
50 "Value To Blank"
52 "Don`t Know To Blank"
53 "Refused To Blank"
;
label define labeltxlayavl
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Value - No Change"
1 "Blank - No Change"
2 "Don`t Know - No Change"
3 "Refused - No Change"
10 "Value To Value"
11 "Blank To Value"
12 "Don`t Know To Value"
13 "Refused To Value"
20 "Value To Longitudinal Value"
21 "Blank To Longitudinal Value"
22 "Don`t Know To Longitudinal Value"
23 "Refused To Longitudinal Value"
30 "Value To Allocated Value Long."
31 "Blank To Allocated Value Long."
32 "Don`t Know To Allocated Value Long."
33 "Refused To Allocated Value Long."
40 "Value To Allocated Value"
41 "Blank To Allocated Value"
42 "Don`t Know To Allocated Value"
43 "Refused To Allocated Value"
50 "Value To Blank"
52 "Don`t Know To Blank"
53 "Refused To Blank"
;
label define labeltxlaylk
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Value - No Change"
1 "Blank - No Change"
2 "Don`t Know - No Change"
3 "Refused - No Change"
10 "Value To Value"
11 "Blank To Value"
12 "Don`t Know To Value"
13 "Refused To Value"
20 "Value To Longitudinal Value"
21 "Blank To Longitudinal Value"
22 "Don`t Know To Longitudinal Value"
23 "Refused To Longitudinal Value"
30 "Value To Allocated Value Long."
31 "Blank To Allocated Value Long."
32 "Don`t Know To Allocated Value Long."
33 "Refused To Allocated Value Long."
40 "Value To Allocated Value"
41 "Blank To Allocated Value"
42 "Don`t Know To Allocated Value"
43 "Refused To Allocated Value"
50 "Value To Blank"
52 "Don`t Know To Blank"
53 "Refused To Blank"
;
label define labeltxlfs
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Value - No Change"
1 "Blank - No Change"
2 "Don`t Know - No Change"
3 "Refused - No Change"
10 "Value To Value"
11 "Blank To Value"
12 "Don`t Know To Value"
13 "Refused To Value"
20 "Value To Longitudinal Value"
21 "Blank To Longitudinal Value"
22 "Don`t Know To Longitudinal Value"
23 "Refused To Longitudinal Value"
30 "Value To Allocated Value Long."
31 "Blank To Allocated Value Long."
32 "Don`t Know To Allocated Value Long."
33 "Refused To Allocated Value Long."
40 "Value To Allocated Value"
41 "Blank To Allocated Value"
42 "Don`t Know To Allocated Value"
43 "Refused To Allocated Value"
50 "Value To Blank"
52 "Don`t Know To Blank"
53 "Refused To Blank"
;
label define labeltxlkavl
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Value - No Change"
1 "Blank - No Change"
2 "Don`t Know - No Change"
3 "Refused - No Change"
10 "Value To Value"
11 "Blank To Value"
12 "Don`t Know To Value"
13 "Refused To Value"
20 "Value To Longitudinal Value"
21 "Blank To Longitudinal Value"
22 "Don`t Know To Longitudinal Value"
23 "Refused To Longitudinal Value"
30 "Value To Allocated Value Long."
31 "Blank To Allocated Value Long."
32 "Don`t Know To Allocated Value Long."
33 "Refused To Allocated Value Long."
40 "Value To Allocated Value"
41 "Blank To Allocated Value"
42 "Don`t Know To Allocated Value"
43 "Refused To Allocated Value"
50 "Value To Blank"
52 "Don`t Know To Blank"
53 "Refused To Blank"
;
label define labeltxlkm1
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Value - No Change"
1 "Blank - No Change"
2 "Don`t Know - No Change"
3 "Refused - No Change"
10 "Value To Value"
11 "Blank To Value"
12 "Don`t Know To Value"
13 "Refused To Value"
20 "Value To Longitudinal Value"
21 "Blank To Longitudinal Value"
22 "Don`t Know To Longitudinal Value"
23 "Refused To Longitudinal Value"
30 "Value To Allocated Value Long."
31 "Blank To Allocated Value Long."
32 "Don`t Know To Allocated Value Long."
33 "Refused To Allocated Value Long."
40 "Value To Allocated Value"
41 "Blank To Allocated Value"
42 "Don`t Know To Allocated Value"
43 "Refused To Allocated Value"
50 "Value To Blank"
52 "Don`t Know To Blank"
53 "Refused To Blank"
;
label define labeltxmjot
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Value - No Change"
1 "Blank - No Change"
2 "Don`t Know - No Change"
3 "Refused - No Change"
10 "Value To Value"
11 "Blank To Value"
12 "Don`t Know To Value"
13 "Refused To Value"
20 "Value To Longitudinal Value"
21 "Blank To Longitudinal Value"
22 "Don`t Know To Longitudinal Value"
23 "Refused To Longitudinal Value"
30 "Value To Allocated Value Long."
31 "Blank To Allocated Value Long."
32 "Don`t Know To Allocated Value Long."
33 "Refused To Allocated Value Long."
40 "Value To Allocated Value"
41 "Blank To Allocated Value"
42 "Don`t Know To Allocated Value"
43 "Refused To Allocated Value"
50 "Value To Blank"
52 "Don`t Know To Blank"
53 "Refused To Blank"
;
label define labeltxret1
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Value - No Change"
1 "Blank - No Change"
2 "Don`t Know - No Change"
3 "Refused - No Change"
10 "Value To Value 0"
11 "Blank To Value 0"
12 "Don`t Know To Value"
13 "Refused To Value 0"
20 "Value To Longitudinal Value"
21 "Blank To Longitudinal Value"
22 "Don`t Know To Longitudinal Value"
23 "Refused To Longitudinal Value"
30 "Value To Allocated Value Long"
31 "Blank To Allocated Value Long"
32 "Don`t  Know To Allocated Value Long"
33 "Refused To Allocated Value Long"
40 "Value To Allocated Value"
41 "Blank To Allocated Value"
42 "Don`t Know To Allocated Value"
43 "Refused To Allocated Value"
50 "Value To Blank"
52 "Don`t Know To Blank"
53 "Refused To Blank"
;
label define labeltxschenr
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Value - No Change"
1 "Blank - No Change"
2 "Don`t Know - No Change"
3 "Refused - No Change"
10 "Value To Value"
11 "Blank To Value"
12 "Don`t Know To Value"
13 "Refused To Value"
20 "Value To Longitudinal Value"
21 "Blank To Longitudinal Value"
22 "Don`t Know To Longitudinal Value"
23 "Refused To Longitudinal Value"
30 "Value To Allocated Value Long."
31 "Blank To Allocated Value Long."
32 "Don`t Know To Allocated Value Long."
33 "Refused To Allocated Value Long."
40 "Value To Allocated Value"
41 "Blank To Allocated Value"
42 "Don`t Know To Allocated Value"
43 "Refused To Allocated Value"
50 "Value To Blank"
52 "Don`t Know To Blank"
53 "Refused To Blank"
;
label define labeltxschft
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Value - No Change"
1 "Blank - No Change"
2 "Don`t Know - No Change"
3 "Refused - No Change"
10 "Value To Value"
11 "Blank To Value"
12 "Don`t Know To Value"
13 "Refused To Value"
20 "Value To Longitudinal Value"
21 "Blank To Longitudinal Value"
22 "Don`t Know To Longitudinal Value"
23 "Refused To Longitudinal Value"
30 "Value To Allocated Value Long."
31 "Blank To Allocated Value Long."
32 "Don`t Know To Allocated Value Long."
33 "Refused To Allocated Value Long."
40 "Value To Allocated Value"
41 "Blank To Allocated Value"
42 "Don`t Know To Allocated Value"
43 "Refused To Allocated Value"
50 "Value To Blank"
52 "Don`t Know To Blank"
53 "Refused To Blank"
;
label define labeltxschlvl
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Value - No Change"
1 "Blank - No Change"
2 "Don`t Know - No Change"
3 "Refused - No Change"
10 "Value To Value"
11 "Blank To Value"
12 "Don`t Know To Value"
13 "Refused To Value"
20 "Value To Longitudinal Value"
21 "Blank To Longitudinal Value"
22 "Don`t Know To Longitudinal Value"
23 "Refused To Longitudinal Value"
30 "Value To Allocated Value Long."
31 "Blank To Allocated Value Long."
32 "Don`t Know To Allocated Value Long."
33 "Refused To Allocated Value Long."
40 "Value To Allocated Value"
41 "Blank To Allocated Value"
42 "Don`t Know To Allocated Value"
43 "Refused To Allocated Value"
50 "Value To Blank"
52 "Don`t Know To Blank"
53 "Refused To Blank"
;
label define labeltxspempnot
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Value - No Change"
1 "Blank - No Change"
2 "Don`t Know - No Change"
3 "Refused - No Change"
10 "Value To Value 0"
11 "Blank To Value 0"
12 "Don`t Know To Value"
13 "Refused To Value 0"
20 "Value To Longitudinal Value"
21 "Blank To Longitudinal Value"
22 "Don`t Know To Longitudinal Value"
23 "Refused To Longitudinal Value"
30 "Value To Allocated Value Long"
31 "Blank To Allocated Value Long"
32 "Don`t Know To Allocated Value Long"
33 "Refused To Allocated Value Long"
40 "Value To Allocated Value"
41 "Blank To Allocated Value"
42 "Don`t Know To Allocated Value"
43 "Refused To Allocated Value"
50 "Value To Blank"
52 "Don`t Know To Blank"
53 "Refused To Blank"
;
label define labeltxspuhrs
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Value - No Change"
1 "Blank - No Change"
2 "Don`t Know - No Change"
3 "Refused - No Change"
10 "Value To Value 0"
11 "Blank To Value 0"
12 "Don`t Know To Value"
13 "Refused To Value 0"
20 "Value To Longitudinal Value"
21 "Blank To Longitudinal Value"
22 "Don`t Know To Longitudinal Value"
23 "Refused To Longitudinal Value"
30 "Value To Allocated Value Long"
31 "Blank To Allocated Value Long"
32 "Don`t  Know To Allocated Value Long"
33 "Refused To Allocated Value Long"
40 "Value To Allocated Value"
41 "Blank To Allocated Value"
42 "Don`t Know To Allocated Value"
43 "Refused To Allocated Value"
50 "Value To Blank"
52 "Don`t Know To Blank"
53 "Refused To Blank"
;
label define labeltxtcc
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "TRTCC_LN and TRTCC do not contain allocated data"
1 "TRTCC_LN and TRTCC contain allocated data"
;
label define labeltxtcctot
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "TRTCCTOT_LN and TRTCCTOT do not contain allocated data"
1 "TRTCCTOT_LN and TRTCCTOT contain allocated data"
;
label define labeltxtcoc
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "TRTCOC_LN and TRTCOC do not contain allocated data"
1 "TRTCOC_LN and TRTCOC contain allocated data"
;
label define labeltxthh
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "TRTHH_LN and TRTHH do not contain allocated data"
1 "TRTHH_LN and TRTHH contain allocated data"
;
label define labeltxtnohh
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "TRTNOHH_LN and TRTNOHH do not contain allocated data"
1 "TRTNOHH_LN and TRTNOHH contain allocated data"
;
label define labeltxto
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "TRTO_LN and TRTO do not contain allocated data"
1 "TRTO_LN and TRTO contain allocated data"
;
label define labeltxtohh
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "TRTOHH_LN and TRTOHH do not contain allocated data"
1 "TRTOHH_LN and TRTOHH contain allocated data"
;
label define labeltxtonhh
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "TRTONHH_LN and TRTONHH do not contain allocated data"
1 "TRTONHH_LN and TRTONHH contain allocated data"
;
 
label values teabsrsn   labelteabsrsn;
label values teernhry   labelteernhry;
label values teernper   labelteernper;
label values teernrt   labelteernrt;
label values teernuot   labelteernuot;
label values tehrftpt   labeltehrftpt;
label values teio1cow   labelteio1cow;
label values telayavl   labeltelayavl;
label values telaylk   labeltelaylk;
label values telfs   labeltelfs;
label values telkavl   labeltelkavl;
label values telkm1   labeltelkm1;
label values temjot   labeltemjot;
label values teret1   labelteret1;
label values teschenr   labelteschenr;
label values teschft   labelteschft;
label values teschlvl   labelteschlvl;
label values tespempnot   labeltespempnot;
label values trdpftpt   labeltrdpftpt;
label values trdtocc1   labeltrdtocc1;
label values trernupd   labeltrernupd;
label values trhernal   labeltrhernal;
label values trhhchild   labeltrhhchild;
label values trholiday   labeltrholiday;
label values trimind1   labeltrimind1;
label values trmjind1   labeltrmjind1;
label values trmjocc1   labeltrmjocc1;
label values trmjocgr   labeltrmjocgr;
label values trnhhchild   labeltrnhhchild;
label values trohhchild   labeltrohhchild;
label values trspftpt   labeltrspftpt;
label values trsppres   labeltrsppres;
label values trwernal   labeltrwernal;
label values tthr   labeltthr;
label values ttot   labelttot;
label values ttwk   labelttwk;
label values tuabsot   labeltuabsot;
label values tubus   labeltubus;
label values tubus1   labeltubus1;
label values tubus2ot   labeltubus2ot;
label values tucc5b_ck   labeltucc5b_ck;
label values tucc5_ck   labeltucc5_ck;
label values tucc9   labeltucc9;
label values tudiaryday   labeltudiaryday;
label values tudis   labeltudis;
label values tudis1   labeltudis1;
label values tudis2   labeltudis2;
label values tuecytd labeltuecytd;
label values tuelder labeltuelder;
label values tuelfreq labeltuelfreq;
label values tufwk   labeltufwk;
label values tuio1mfg   labeltuio1mfg;
label values tuiodp1   labeltuiodp1;
label values tuiodp2   labeltuiodp2;
label values tuiodp3   labeltuiodp3;
label values tulay   labeltulay;
label values tulay6m   labeltulay6m;
label values tulayavr   labeltulayavr;
label values tulaydt   labeltulaydt;
label values tulk   labeltulk;
label values tulkavr   labeltulkavr;
label values tulkdk1   labeltulkdk1;
label values tulkdk2   labeltulkdk2;
label values tulkdk3   labeltulkdk3;
label values tulkdk4   labeltulkdk4;
label values tulkdk5   labeltulkdk5;
label values tulkdk6   labeltulkdk6;
label values tulkm2   labeltulkm2;
label values tulkm3   labeltulkm3;
label values tulkm4   labeltulkm4;
label values tulkm5   labeltulkm5;
label values tulkm6   labeltulkm6;
label values tulkps1   labeltulkps1;
label values tulkps2   labeltulkps2;
label values tulkps3   labeltulkps3;
label values tulkps4   labeltulkps4;
label values tulkps5   labeltulkps5;
label values tulkps6   labeltulkps6;
label values turetot   labelturetot;
label values tuspabs   labeltuspabs;
label values tuspusft   labeltuspusft;
label values tuspwk   labeltuspwk;
label values txabsrsn   labeltxabsrsn;
label values txern   labeltxern;
label values txernh1o   labeltxernh1o;
label values txernh2   labeltxernh2;
label values txernhro   labeltxernhro;
label values txernhry   labeltxernhry;
label values txernper   labeltxernper;
label values txernrt   labeltxernrt;
label values txernuot   labeltxernuot;
label values txernwkp   labeltxernwkp;
label values txhrftpt   labeltxhrftpt;
label values txhrusl1   labeltxhrusl1;
label values txhrusl2   labeltxhrusl2;
label values txhruslt   labeltxhruslt;
label values txio1cow   labeltxio1cow;
label values txio1icd   labeltxio1icd;
label values txio1ocd   labeltxio1ocd;
label values txlayavl   labeltxlayavl;
label values txlaylk   labeltxlaylk;
label values txlfs   labeltxlfs;
label values txlkavl   labeltxlkavl;
label values txlkm1   labeltxlkm1;
label values txmjot   labeltxmjot;
label values txret1   labeltxret1;
label values txschenr   labeltxschenr;
label values txschft   labeltxschft;
label values txschlvl   labeltxschlvl;
label values txspempnot   labeltxspempnot;
label values txspuhrs   labeltxspuhrs;
label values txtcc   labeltxtcc;
label values txtcctot   labeltxtcctot;
label values txtcoc   labeltxtcoc;
label values txthh   labeltxthh;
label values txtnohh   labeltxtnohh;
label values txto   labeltxto;
label values txtohh   labeltxtohh;
label values txtonhh   labeltxtonhh;
 
describe, short;

save "$myfiles$data\ATUS2019_respondent", replace

**# Bookmark #1
** Activity (summary/total time) dataset

#delimit ;

import delimited  
tucaseid
tufinlwgt
tryhhchild
teage
tesex
peeduca
ptdtrace
pehspnon
gtmetsta
telfs
temjot
trdpftpt
teschenr
teschlvl
trsppres
tespempnot
trernwa
trchildnum
trspftpt
tehruslt
tudiaryday
trholiday
trtec
trthh
t010101
t010102
t010201
t010299
t010301
t010399
t010401
t010499
t010501
t019999
t020101
t020102
t020103
t020104
t020199
t020201
t020202
t020203
t020299
t020301
t020302
t020303
t020399
t020401
t020402
t020499
t020501
t020502
t020599
t020601
t020602
t020699
t020701
t020799
t020801
t020899
t020901
t020902
t020903
t020904
t020905
t020999
t029999
t030101
t030102
t030103
t030104
t030105
t030106
t030108
t030109
t030110
t030111
t030112
t030199
t030201
t030202
t030203
t030204
t030299
t030301
t030302
t030303
t030399
t030401
t030402
t030403
t030404
t030405
t030499
t030501
t030502
t030503
t030504
t030599
t040101
t040102
t040103
t040104
t040105
t040106
t040108
t040109
t040110
t040111
t040112
t040199
t040201
t040202
t040301
t040302
t040399
t040401
t040402
t040403
t040404
t040405
t040499
t040501
t040502
t040503
t040504
t040505
t040506
t040507
t040508
t040599
t049999
t050101
t050102
t050103
t050104
t050199
t050202
t050205
t050299
t050301
t050302
t050303
t050304
t050399
t050401
t050403
t050404
t059999
t060101
t060102
t060103
t060199
t060201
t060202
t060204
t060301
t060302
t060399
t060401
t060402
t060499
t069999
t070101
t070102
t070103
t070104
t070105
t070199
t070201
t070301
t080101
t080201
t080202
t080203
t080301
t080399
t080401
t080402
t080403
t080501
t080502
t080601
t080701
t080702
t089999
t090101
t090103
t090104
t090199
t090201
t090202
t090299
t090301
t090302
t090399
t090401
t090402
t090501
t090502
t090599
t099999
t100101
t100102
t100103
t100199
t100201
t100299
t100304
t110101
t110201
t120101
t120201
t120202
t120299
t120301
t120302
t120303
t120304
t120305
t120306
t120307
t120308
t120309
t120310
t120311
t120312
t120313
t120399
t120401
t120402
t120403
t120404
t120405
t120499
t120501
t120502
t120503
t120504
t129999
t130101
t130102
t130103
t130104
t130105
t130106
t130107
t130108
t130109
t130110
t130112
t130113
t130114
t130116
t130117
t130118
t130119
t130120
t130122
t130124
t130125
t130126
t130127
t130128
t130129
t130130
t130131
t130132
t130133
t130134
t130136
t130199
t130202
t130203
t130207
t130209
t130210
t130213
t130214
t130216
t130218
t130219
t130222
t130224
t130225
t130226
t130227
t130232
t130299
t130301
t130302
t130399
t130402
t139999
t140101
t140102
t140103
t140105
t149999
t150101
t150102
t150103
t150104
t150105
t150106
t150199
t150201
t150202
t150203
t150204
t150299
t150301
t150302
t150399
t150401
t150402
t150499
t150501
t150602
t150699
t150701
t150799
t150801
t150899
t159999
t160101
t160102
t160103
t160104
t160105
t160106
t160107
t160108
t160199
t160201
t169999
t180101
t180201
t180202
t180203
t180204
t180205
t180206
t180207
t180208
t180209
t180299
t180301
t180302
t180303
t180304
t180305
t180401
t180402
t180403
t180404
t180405
t180499
t180501
t180502
t180503
t180504
t180599
t180601
t180602
t180603
t180604
t180699
t180701
t180702
t180703
t180704
t180799
t180801
t180802
t180803
t180804
t180805
t180806
t180807
t180899
t180901
t180902
t180903
t180905
t181001
t181002
t181101
t181201
t181202
t181203
t181204
t181205
t181299
t181301
t181302
t181399
t181401
t181499
t181501
t181599
t181601
t181801
t181899
t189999
t500101
t500103
t500105
t500106
t500107
 using "$myfiles$data\atussum_2019.dat", stringcols(1) clear ;

label variable tucaseid   "ATUS Case ID (14-digit identifier)";
label variable gtmetsta   "Metropolitan status (2010 definitions)";
label variable peeduca    "Edited: what is the highest level of school you have completed or the highest degree you have received?";
label variable pehspnon   "Edited: are you Spanish, Hispanic, or Latino?";
label variable ptdtrace   "Race (topcoded)";
label variable teage      "Edited: age";
label variable tehruslt   "Edited: total hours usually worked per week (sum of TEHRUSL1 and TEHRUSL2)";
label variable telfs      "Edited: labor force status";
label variable temjot     "Edited: in the last seven days did you have more than one job?";
label variable teschenr   "Edited: are you enrolled in high school, college, or university?";
label variable teschlvl   "Edited: would that be high school, college, or university?";
label variable tesex      "Edited: sex";
label variable tespempnot "Edited: employment status of spouse or unmarried partner";
label variable trchildnum "Number of household children < 18";
label variable trdpftpt   "Full time or part time employment status of respondent";
label variable trernwa    "Weekly earnings (2 implied decimals)";
label variable trspftpt   "Full time or part time employment status of spouse or unmarried partner";
label variable trsppres   "Presence of the respondent's spouse or unmarried partner in the household";
label variable tryhhchild "Age of youngest household child < 18";
label variable tufinlwgt  "ATUS final weight";
label variable tudiaryday "Day of the week of diary day (day of the week about which the respondent was interviewed)";
label variable trholiday  "Flag to indicate if diary day was a holiday";
label variable trtec      "Total time spent providing eldercare (in minutes)";
label variable trthh      "Total time spent during diary day providing secondary childcare for household children < 13 (in minutes)";

label variable t010101 "Sleeping";
label variable t010102 "Sleeplessness";
label variable t010201 "Washing, dressing and grooming oneself";
label variable t010299 "Grooming, n.e.c.*";
label variable t010301 "Health-related self care";
label variable t010399 "Self care, n.e.c.*";
label variable t010401 "Personal/Private activities";
label variable t010499 "Personal activities, n.e.c.*";
label variable t010501 "Personal emergencies";
label variable t019999 "Personal care, n.e.c.*";
label variable t020101 "Interior cleaning";
label variable t020102 "Laundry";
label variable t020103 "Sewing, repairing, and maintaining textiles";
label variable t020104 "Storing interior hh items, inc. food";
label variable t020199 "Housework, n.e.c.*";
label variable t020201 "Food and drink preparation";
label variable t020202 "Food presentation";
label variable t020203 "Kitchen and food clean-up";
label variable t020299 "Food and drink prep, presentation, and clean-up, n.e.c.*";
label variable t020301 "Interior arrangement, decoration, and repairs";
label variable t020302 "Building and repairing furniture";
label variable t020303 "Heating and cooling";
label variable t020399 "Interior maintenance, repair, and decoration, n.e.c.*";
label variable t020401 "Exterior cleaning";
label variable t020402 "Exterior repair, improvements, and decoration";
label variable t020499 "Exterior maintenance, repair and decoration, n.e.c.*";
label variable t020501 "Lawn, garden, and houseplant care";
label variable t020502 "Ponds, pools, and hot tubs";
label variable t020599 "Lawn and garden, n.e.c.*";
label variable t020601 "Care for animals and pets (not veterinary care)";
label variable t020602 "Walking / exercising / playing with animals";
label variable t020699 "Pet and animal care, n.e.c.*";
label variable t020701 "Vehicle repair and maintenance (by self)";
label variable t020799 "Vehicles, n.e.c.*";
label variable t020801 "Appliance, tool, and toy set-up, repair, and maintenance (by self)";
label variable t020899 "Appliances and tools, n.e.c.*";
label variable t020901 "Financial management";
label variable t020902 "Household and personal organization and planning";
label variable t020903 "HH and personal mail and messages (except e-mail)";
label variable t020904 "HH and personal e-mail and messages";
label variable t020905 "Home security";
label variable t020999 "Household management, n.e.c.*";
label variable t029999 "Household activities, n.e.c.*";
label variable t030101 "Physical care for hh children";
label variable t030102 "Reading to/with hh children";
label variable t030103 "Playing with hh children, not sports";
label variable t030104 "Arts and crafts with hh children";
label variable t030105 "Playing sports with hh children";
label variable t030106 "Talking with/listening to hh children";
label variable t030108 "Organization and planning for hh children";
label variable t030109 "Looking after hh children (as a primary activity)";
label variable t030110 "Attending hh children's events";
label variable t030111 "Waiting for/with hh children";
label variable t030112 "Picking up/dropping off hh children";
label variable t030199 "Caring for and helping hh children, n.e.c.*";
label variable t030201 "Homework (hh children)";
label variable t030202 "Meetings and school conferences (hh children)";
label variable t030203 "Home schooling of hh children";
label variable t030204 "Waiting associated with hh children's education";
label variable t030299 "Activities related to hh child's education, n.e.c.*";
label variable t030301 "Providing medical care to hh children";
label variable t030302 "Obtaining medical care for hh children";
label variable t030303 "Waiting associated with hh children's health";
label variable t030399 "Activities related to hh child's health, n.e.c.*";
label variable t030401 "Physical care for hh adults";
label variable t030402 "Looking after hh adult (as a primary activity)";
label variable t030403 "Providing medical care to hh adult";
label variable t030404 "Obtaining medical and care services for hh adult";
label variable t030405 "Waiting associated with caring for household adults";
label variable t030499 "Caring for household adults, n.e.c.*";
label variable t030501 "Helping hh adults";
label variable t030502 "Organization and planning for hh adults";
label variable t030503 "Picking up/dropping off hh adult";
label variable t030504 "Waiting associated with helping hh adults";
label variable t030599 "Helping household adults, n.e.c.*";
label variable t040101 "Physical care for nonhh children";
label variable t040102 "Reading to/with nonhh children";
label variable t040103 "Playing with nonhh children, not sports";
label variable t040104 "Arts and crafts with nonhh children";
label variable t040105 "Playing sports with nonhh children";
label variable t040106 "Talking with/listening to nonhh children";
label variable t040108 "Organization and planning for nonhh children";
label variable t040109 "Looking after nonhh children (as primary activity)";
label variable t040110 "Attending nonhh children's events";
label variable t040111 "Waiting for/with nonhh children";
label variable t040112 "Dropping off/picking up nonhh children";
label variable t040199 "Caring for and helping nonhh children, n.e.c.*";
label variable t040201 "Homework (nonhh children)";
label variable t040202 "Meetings and school conferences (nonhh children)";
label variable t040301 "Providing medical care to nonhh children";
label variable t040302 "Obtaining medical care for nonhh children";
label variable t040399 "Activities related to nonhh child's health, n.e.c.*";
label variable t040401 "Physical care for nonhh adults";
label variable t040402 "Looking after nonhh adult (as a primary activity)";
label variable t040403 "Providing medical care to nonhh adult";
label variable t040404 "Obtaining medical and care services for nonhh adult";
label variable t040405 "Waiting associated with caring for nonhh adults";
label variable t040499 "Caring for nonhh adults, n.e.c.*";
label variable t040501 "Housework, cooking, and shopping assistance for nonhh adults";
label variable t040502 "House and lawn maintenance and repair assistance for nonhh adults";
label variable t040503 "Animal and pet care assistance for nonhh adults";
label variable t040504 "Vehicle and appliance maintenance/repair assistance for nonhh adults";
label variable t040505 "Financial management assistance for nonhh adults";
label variable t040506 "Household management and paperwork assistance for nonhh adults";
label variable t040507 "Picking up/dropping off nonhh adult";
label variable t040508 "Waiting associated with helping nonhh adults";
label variable t040599 "Helping nonhh adults, n.e.c.*";
label variable t049999 "Caring for and helping nonhh members, n.e.c.*";
label variable t050101 "Work, main job";
label variable t050102 "Work, other job(s)";
label variable t050103 "Security procedures related to work";
label variable t050104 "Waiting associated with working";
label variable t050199 "Working, n.e.c.*";
label variable t050202 "Eating and drinking as part of job";
label variable t050205 "Waiting associated with work-related activities";
label variable t050299 "Work-related activities, n.e.c.*";
label variable t050301 "Income-generating hobbies, crafts, and food";
label variable t050302 "Income-generating performances";
label variable t050303 "Income-generating services";
label variable t050304 "Income-generating rental property activities";
label variable t050399 "Other income-generating activities, n.e.c.*";
label variable t050401 "Job search activities";
label variable t050403 "Job interviewing";
label variable t050404 "Waiting associated with job search or interview";
label variable t059999 "Work and work-related activities, n.e.c.*";
label variable t060101 "Taking class for degree, certification, or licensure";
label variable t060102 "Taking class for personal interest";
label variable t060103 "Waiting associated with taking classes";
label variable t060199 "Taking class, n.e.c.*";
label variable t060201 "Extracurricular club activities";
label variable t060202 "Extracurricular music and performance activities";
label variable t060204 "Waiting associated with extracurricular activities";
label variable t060301 "Research/homework for class for degree, certification, or licensure";
label variable t060302 "Research/homework for class for pers. interest";
label variable t060399 "Research/homework n.e.c.*";
label variable t060401 "Administrative activities: class for degree, certification, or licensure";
label variable t060402 "Administrative activities: class for personal interest";
label variable t060499 "Administrative for education, n.e.c.*";
label variable t069999 "Education, n.e.c.*";
label variable t070101 "Grocery shopping";
label variable t070102 "Purchasing gas";
label variable t070103 "Purchasing food (not groceries)";
label variable t070104 "Shopping, except groceries, food and gas";
label variable t070105 "Waiting associated with shopping";
label variable t070199 "Shopping, n.e.c.*";
label variable t070201 "Comparison shopping";
label variable t070301 "Security procedures rel. to consumer purchases";
label variable t080101 "Using paid childcare services";
label variable t080201 "Banking";
label variable t080202 "Using other financial services";
label variable t080203 "Waiting associated w/banking/financial services";
label variable t080301 "Using legal services";
label variable t080399 "Using legal services, n.e.c.*";
label variable t080401 "Using health and care services outside the home";
label variable t080402 "Using in-home health and care services";
label variable t080403 "Waiting associated with medical services";
label variable t080501 "Using personal care services";
label variable t080502 "Waiting associated w/personal care services";
label variable t080601 "Activities rel. to purchasing/selling real estate";
label variable t080701 "Using veterinary services";
label variable t080702 "Waiting associated with veterinary services";
label variable t089999 "Professional and personal services, n.e.c.*";
label variable t090101 "Using interior cleaning services";
label variable t090103 "Using clothing repair and cleaning services";
label variable t090104 "Waiting associated with using household services";
label variable t090199 "Using household services, n.e.c.*";
label variable t090201 "Using home maint/repair/décor/construction svcs";
label variable t090202 "Waiting associated w/ home main/repair/décor/constr";
label variable t090299 "Using home maint/repair/décor/constr services, n.e.c.*";
label variable t090301 "Using pet services";
label variable t090302 "Waiting associated with pet services";
label variable t090399 "Using pet services, n.e.c.*";
label variable t090401 "Using lawn and garden services";
label variable t090402 "Waiting associated with using lawn and garden services";
label variable t090501 "Using vehicle maintenance or repair services";
label variable t090502 "Waiting associated with vehicle main. or repair svcs";
label variable t090599 "Using vehicle maint. and repair svcs, n.e.c.*";
label variable t099999 "Using household services, n.e.c.*";
label variable t100101 "Using police and fire services";
label variable t100102 "Using social services";
label variable t100103 "Obtaining licenses and paying fines, fees, taxes";
label variable t100199 "Using government services, n.e.c.*";
label variable t100201 "Civic obligations and participation";
label variable t100299 "Civic obligations and participation, n.e.c.*";
label variable t100304 "Waiting associated with using government services";
label variable t110101 "Eating and drinking";
label variable t110201 "Waiting associated w/eating and drinking";
label variable t120101 "Socializing and communicating with others";
label variable t120201 "Attending or hosting parties/receptions/ceremonies";
label variable t120202 "Attending meetings for personal interest (not volunteering)";
label variable t120299 "Attending/hosting social events, n.e.c.*";
label variable t120301 "Relaxing, thinking";
label variable t120302 "Tobacco and drug use";
label variable t120303 "Television and movies (not religious)";
label variable t120304 "Television (religious)";
label variable t120305 "Listening to the radio";
label variable t120306 "Listening to/playing music (not radio)";
label variable t120307 "Playing games";
label variable t120308 "Computer use for leisure (exc. Games)";
label variable t120309 "Arts and crafts as a hobby";
label variable t120310 "Collecting as a hobby";
label variable t120311 "Hobbies, except arts and crafts and collecting";
label variable t120312 "Reading for personal interest";
label variable t120313 "Writing for personal interest";
label variable t120399 "Relaxing and leisure, n.e.c.*";
label variable t120401 "Attending performing arts";
label variable t120402 "Attending museums";
label variable t120403 "Attending movies/film";
label variable t120404 "Attending gambling establishments";
label variable t120405 "Security procedures rel. to arts and entertainment";
label variable t120499 "Arts and entertainment, n.e.c.*";
label variable t120501 "Waiting assoc. w/socializing and communicating";
label variable t120502 "Waiting assoc. w/attending/hosting social events";
label variable t120503 "Waiting associated with relaxing/leisure";
label variable t120504 "Waiting associated with arts and entertainment";
label variable t129999 "Socializing, relaxing, and leisure, n.e.c.*";
label variable t130101 "Doing aerobics";
label variable t130102 "Playing baseball";
label variable t130103 "Playing basketball";
label variable t130104 "Biking";
label variable t130105 "Playing billiards";
label variable t130106 "Boating";
label variable t130107 "Bowling";
label variable t130108 "Climbing, spelunking, caving";
label variable t130109 "Dancing";
label variable t130110 "Participating in equestrian sports";
label variable t130112 "Fishing";
label variable t130113 "Playing football";
label variable t130114 "Golfing";
label variable t130116 "Hiking";
label variable t130117 "Playing hockey";
label variable t130118 "Hunting";
label variable t130119 "Participating in martial arts";
label variable t130120 "Playing racquet sports";
label variable t130122 "Rollerblading";
label variable t130124 "Running";
label variable t130125 "Skiing, ice skating, snowboarding";
label variable t130126 "Playing soccer";
label variable t130127 "Softball";
label variable t130128 "Using cardiovascular equipment";
label variable t130129 "Vehicle touring/racing";
label variable t130130 "Playing volleyball";
label variable t130131 "Walking";
label variable t130132 "Participating in water sports";
label variable t130133 "Weightlifting/strength training";
label variable t130134 "Working out, unspecified";
label variable t130136 "Doing yoga";
label variable t130199 "Playing sports n.e.c.*";
label variable t130202 "Watching baseball";
label variable t130203 "Watching basketball";
label variable t130207 "Watching bowling";
label variable t130209 "Watching dancing";
label variable t130210 "Watching equestrian sports";
label variable t130213 "Watching football";
label variable t130214 "Watching golfing";
label variable t130216 "Watching hockey";
label variable t130218 "Watching racquet sports";
label variable t130219 "Watching rodeo competitions";
label variable t130222 "Watching running";
label variable t130224 "Watching soccer";
label variable t130225 "Watching softball";
label variable t130226 "Watching vehicle touring/racing";
label variable t130227 "Watching volleyball";
label variable t130232 "Watching wrestling";
label variable t130299 "Attending sporting events, n.e.c.*";
label variable t130301 "Waiting related to playing sports or exercising";
label variable t130302 "Waiting related to attending sporting events";
label variable t130399 "Waiting associated with sports, exercise, and recreation, n.e.c.*";
label variable t130402 "Security related to attending sporting events";
label variable t139999 "Sports, exercise, and recreation, n.e.c.*";
label variable t140101 "Attending religious services";
label variable t140102 "Participation in religious practices";
label variable t140103 "Waiting associated w/religious and spiritual activities";
label variable t140105 "Religious education activities";
label variable t149999 "Religious and spiritual activities, n.e.c.*";
label variable t150101 "Computer use";
label variable t150102 "Organizing and preparing";
label variable t150103 "Reading";
label variable t150104 "Telephone calls (except hotline counseling)";
label variable t150105 "Writing";
label variable t150106 "Fundraising";
label variable t150199 "Administrative and support activities, n.e.c.*";
label variable t150201 "Food preparation, presentation, clean-up";
label variable t150202 "Collecting and delivering clothing and other goods";
label variable t150203 "Providing care";
label variable t150204 "Teaching, leading, counseling, mentoring";
label variable t150299 "Social service and care activities, n.e.c.*";
label variable t150301 "Building houses, wildlife sites, and other structures";
label variable t150302 "Indoor and outdoor maintenance, repair, and clean-up";
label variable t150399 "Indoor and outdoor maintenance, building and clean-up activities, n.e.c.*";
label variable t150401 "Performing";
label variable t150402 "Serving at volunteer events and cultural activities";
label variable t150499 "Participating in performance and cultural activities, n.e.c.*";
label variable t150501 "Attending meetings, conferences, and training";
label variable t150602 "Public safety activities";
label variable t150699 "Public health and safety activities, n.e.c.*";
label variable t150701 "Waiting associated with volunteer activities";
label variable t150799 "Waiting associated with volunteer activities, n.e.c.*";
label variable t150801 "Security procedures related to volunteer activities";
label variable t150899 "Security procedures related to volunteer activities, n.e.c.*";
label variable t159999 "Volunteer activities, n.e.c.*";
label variable t160101 "Telephone calls to/from family members";
label variable t160102 "Telephone calls to/from friends, neighbors, or acquaintances";
label variable t160103 "Telephone calls to/from education services providers";
label variable t160104 "Telephone calls to/from salespeople";
label variable t160105 "Telephone calls to/from professional or personal care svcs providers";
label variable t160106 "Telephone calls to/from household services providers";
label variable t160107 "Telephone calls to/from paid child or adult care providers";
label variable t160108 "Telephone calls to/from government officials";
label variable t160199 "Telephone calls (to or from), n.e.c.*";
label variable t160201 "Waiting associated with telephone calls";
label variable t169999 "Telephone calls, n.e.c.*";
label variable t180101 "Travel related to personal care";
label variable t180201 "Travel related to housework";
label variable t180202 "Travel related to food and drink prep., clean-up, and presentation";
label variable t180203 "Travel related to interior maintenance, repair, and decoration";
label variable t180204 "Travel related to exterior maintenance, repair, and decoration";
label variable t180205 "Travel related to lawn, garden, and houseplant care";
label variable t180206 "Travel related to care for animals and pets (not vet care)";
label variable t180207 "Travel related to vehicle care and maintenance (by self)";
label variable t180208 "Travel related to appliance, tool, and toy set-up, repair, and maintenance (by self)";
label variable t180209 "Travel related to household management";
label variable t180299 "Travel related to household activities, n.e.c.*";
label variable t180301 "Travel related to caring for and helping hh children";
label variable t180302 "Travel related to hh children's education";
label variable t180303 "Travel related to hh children's health";
label variable t180304 "Travel related to caring for hh adults";
label variable t180305 "Travel related to helping hh adults";
label variable t180401 "Travel related to caring for and helping nonhh children";
label variable t180402 "Travel related to nonhh children's education";
label variable t180403 "Travel related to nonhh children's health";
label variable t180404 "Travel related to caring for nonhh adults";
label variable t180405 "Travel related to helping nonhh adults";
label variable t180499 "Travel rel. to caring for and helping nonhh members, n.e.c.*";
label variable t180501 "Travel related to working";
label variable t180502 "Travel related to work-related activities";
label variable t180503 "Travel related to income-generating activities";
label variable t180504 "Travel related to job search and interviewing";
label variable t180599 "Travel related to work, n.e.c.*";
label variable t180601 "Travel related to taking class";
label variable t180602 "Travel related to extracurricular activities (ex. Sports)";
label variable t180603 "Travel related to research/homework";
label variable t180604 "Travel related to registration/administrative activities";
label variable t180699 "Travel related to education, n.e.c.*";
label variable t180701 "Travel related to grocery shopping";
label variable t180702 "Travel related to purchasing gas";
label variable t180703 "Travel related to purchasing food (not groceries)";
label variable t180704 "Travel related to shopping, ex groceries, food, and gas";
label variable t180799 "Travel related to consumer purchases, n.e.c.*";
label variable t180801 "Travel related to using childcare services";
label variable t180802 "Travel related to using financial services and banking";
label variable t180803 "Travel related to using legal services";
label variable t180804 "Travel related to using medical services";
label variable t180805 "Travel related to using personal care services";
label variable t180806 "Travel related to using real estate services";
label variable t180807 "Travel related to using veterinary services";
label variable t180899 "Travel rel. to using prof. and personal care services, n.e.c.*";
label variable t180901 "Travel related to using household services";
label variable t180902 "Travel related to using home main./repair/décor./construction svcs";
label variable t180903 "Travel related to using pet services (not vet)";
label variable t180905 "Travel related to using vehicle maintenance and repair services";
label variable t181001 "Travel related to using government services";
label variable t181002 "Travel related to civic obligations and participation";
label variable t181101 "Travel related to eating and drinking";
label variable t181201 "Travel related to socializing and communicating";
label variable t181202 "Travel related to attending or hosting social events";
label variable t181203 "Travel related to relaxing and leisure";
label variable t181204 "Travel related to arts and entertainment";
label variable t181205 "Travel as a form of entertainment";
label variable t181299 "Travel rel. to socializing, relaxing, and leisure, n.e.c.*";
label variable t181301 "Travel related to participating in sports/exercise/recreation";
label variable t181302 "Travel related to attending sporting/recreational events";
label variable t181399 "Travel related to sports, exercise, and recreation, n.e.c.*";
label variable t181401 "Travel related to religious/spiritual practices";
label variable t181499 "Travel rel. to religious/spiritual activities, n.e.c.*";
label variable t181501 "Travel related to volunteering";
label variable t181599 "Travel related to volunteer activities, n.e.c.*";
label variable t181601 "Travel related to phone calls";
label variable t181801 "Security procedures related to traveling";
label variable t181899 "Security procedures related to traveling, n.e.c.*";
label variable t189999 "Traveling, n.e.c.*";
label variable t500101 "Insufficient detail in verbatim";
label variable t500103 "Missing travel or destination";
label variable t500105 "Respondent refused to provide information/'none of your business'";
label variable t500106 "Gap/can't remember";
label variable t500107 "Unable to code activity at 1st tier";

capture label define labelgtmetsta
-1  "Blank"
-2  "Don't Know"
-3  "Refused"
1  "Metropolitan"
2  "Non-metropolitan"
3  "Not identified"
;
capture label define labelpeeduca
-1  "Blank"
-2  "Don't Know"
-3  "Refused"
31  "Less than 1st grade"
32  "1st, 2nd, 3rd, or 4th grade"
33  "5th or 6th grade"
34  "7th or 8th grade"
35  "9th grade"
36  "10th grade"
37  "11th grade"
38  "12th grade - no diploma"
39  "High school graduate - diploma or equivalent (GED)"
40  "Some college but no degree"
41  "Associate degree - occupational/vocational"
42  "Associate degree - academic program"
43  "Bachelor's degree (BA, AB, BS, etc.)"
44  "Master's degree (MA, MS, MEng, MEd, MSW, etc.)"
45  "Professional school degree (MD, DDS, DVM, etc.)"
46  "Doctoral degree (PhD, EdD, etc.)"
;
capture label define labelpehspnon
-1  "Blank"
-2  "Don't Know"
-3  "Refused"
1  "Hispanic"
2  "Non-Hispanic"
;
capture label define labelptdtrace
-1  "Blank"
-2  "Don't Know"
-3  "Refused"
1  "White only"
2  "Black only"
3  "American Indian, Alaskan Native only"
4  "Asian only"
5  "Hawaiian/Pacific Islander only"
6  "White-Black"
7  "White-American Indian"
8  "White-Asian"
9  "White-Hawaiian"
10  "Black-American Indian"
11  "Black-Asian"
12  "Black-Hawaiian"
13  "American Indian-Asian"
14 = "American Indian-Hawaiian"
15 = "Asian-Hawaiian"
16 = "White-Black-American Indian"
17 = "White-Black-Asian"
18 = "White-Black-Hawaiian"
19 = "White-American Indian-Asian"
20 = "White-American Indian-Hawaiian"
21 = "White-Asian-Hawaiian"
22 = "Black-American Indian-Asian"
23 = "White-Black-American Indian-Asian"
24 = "White-American Indian-Asian-Hawaiian"
25 = "Other 3 race combinations"
26 = "Other 4 and 5 race combinations"
;
capture label define labeltelfs
-1  "Blank"
-2  "Don't Know"
-3  "Refused"
1  "Employed - at work"
2  "Employed - absent"
3  "Unemployed - on layoff"
4  "Unemployed - looking"
5  "Not in labor force"
;
capture label define labeltemjot
-1  "Blank"
-2  "Don't Know"
-3  "Refused"
1  "Yes"
2  "No"
;
capture label define labelteschenr
-1  "Blank"
-2  "Don't Know"
-3  "Refused"
1  "Yes"
2  "No"
;
capture label define labelteschlvl
-1  "Blank"
-2  "Don't Know"
-3  "Refused"
1  "High school"
2  "College or university"
;
capture label define labeltesex
-1  "Blank"
-2  "Don't Know"
-3  "Refused"
1  "Male"
2  "Female"
;
capture label define labeltespempnot
-1  "Blank"
-2  "Don't Know"
-3  "Refused"
1  "Employed"
2  "Not employed"
;
capture label define labeltrdpftpt
-1  "Blank"
-2  "Don't Know"
-3  "Refused"
1  "Full time"
2  "Part time"
;
capture label define labeltrspftpt
-1  "Blank"
-2  "Don't Know"
-3  "Refused"
1  "Full time"
2  "Part time"
3  "Hours vary"
;
capture label define labeltrsppres
-1  "Blank"
-2  "Don't Know"
-3  "Refused"
1  "Spouse present"
2  "Unmarried partner present"
3  "No spouse or unmarried partner present"
;
capture label define labeltudiaryday
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
1 "Sunday"
2 "Monday"
3 "Tuesday"
4 "Wednesday"
5 "Thursday"
6 "Friday"
7 "Saturday"
;
capture label define labeltrholiday
-1 "Blank"
-2 "Don't Know"
-3 "Refused"
0 "Diary day was not a holiday"
1 "Diary day was a holiday"
;

label values gtmetsta   labelgtmetsta;
label values peeduca    labelpeeduca;
label values pehspnon   labelpehspnon;
label values ptdtrace   labelptdtrace;
label values telfs      labeltelfs;
label values temjot     labeltemjot;
label values teschenr   labelteschenr;
label values teschlvl   labelteschlvl;
label values tesex      labeltesex;
label values tespempnot labeltespempnot;
label values trdpftpt   labeltrdpftpt;
label values trspftpt   labeltrspftpt;
label values trsppres   labeltrsppres;
label values tudiaryday labeltudiaryday;
label values trholiday  labeltrholiday;

describe, short;

save "$myfiles$data\ATUS2019_activities", replace

use "$myfiles$data\ATUS2019_respondent", clear
merge 1:1 tucaseid using "$myfiles$data\ATUS2019_activities"
drop _merge
destring, replace
save "$myfiles$data\ATUS2019", replace

**# Bookmark #2
// PART 3 // Figure 3
use "$myfiles$data\ATUS2019", clear
describe 
* Survey weight var: tufinlwgt

global socgroup teage tesex ptdtrace pehspnon
foreach v of varlist $socgroup {
		tab `v'
}
tab ptdtrace
table ptdtrace tesex
recode ptdtrace (9/26=99)
tab ptdtrace

cap lab drop race
lab def race 1 "White only" 2 "Black only" 3 "American Indian, Alaskan Native only" 4 "Asian only" 5 "Hawaiian/Pacific Islander only" 6 "White-Black" 7 "White-American Indian" 8 "White-Asian" 99 "Other 2 or more race combinations"

lab val ptdtrace race
tab ptdtrace
table ptdtrace tesex
lab var ptdtrace "Racial Group Identity"
ren ptdtrace race
ren tesex sex

egen food=rowtotal(t180701 t180703 t180202 t150201 t110201 t110101 t070103 t070101 t020202 t020203 t020201 t020299)
egen work=rowtotal(t050101 t050102 t050103 t050104 t050199 t050205 t050299 t059999 t180501 t180502 t180599)
egen carehouse=rowtotal(t020101 t020102 t020103 t020104 t020199 t020301 t020302 t020303 t020399 t020401 t020402 t020499 t020501 t020502 t020599 t020601 t020602 t020699 t020701 t020799 t020801 t020899 t020905 t020999 t029999 t030101 t030102 t030103 t030104 t030105 t030106 t030108 t030109 t030110 t030111 t030112 t030199 t030201 t030202 t030203 t030204 t030299 t030301 t030302 t030303 t030399 t030401 t030402 t030403 t030404 t030405 t030499 t030501 t030502 t030503 t030504 t030599 t040101 t040102 t040103 t040104 t040105 t040106 t040108 t040109 t040110 t040111 t040112 t040199 t040201 t040202 t040301 t040302 t040399 t040401 t040402 t040403 t040404 t040405 t040499 t040501 t040502 t040503 t040504 t040505 t040506 t040507 t040508 t040599 t049999 t150203 t180201 t180203 t180204 t180205 t180206 t180207 t180208 t180209 t180299 t180301 t180301 t180302 t180303 t180305 t180402 t180404 t180499)

ren t010101 sleep

lab var sleep "Sleep"
lab var work "Work"
lab var food "Food-related"
lab var carehouse "Caregiving and household work"
lab var telfs "Labor force status"
lab var trdpftpt "Full-/Part-time status"
sum teage if telfs==1
recode sex (1=0) (2=1)
lab def sex 0 "Male" 1 "Female"
lab val sex sex

graph bar food work sleep carehouse if telfs==1 & trdpftpt==1 [pw=tufinlwgt],  over(race, label(labsize(vsmall) angle(45))) over(sex, label(labsize(medsmall))) stack ylabel(, labsize(vsmall)) ytitle("Minutes", size(medsmall)) legend(label(1 "All food-related activities") label(2 "Working") label(3 "Sleeping") label(4 "Caregiving & household work") size(small) symysize(1) symxsize(3) placement(12) span margin(tiny) rowgap(*.5) row(1)) graphregion(margin(tiny))
graph export "$myfiles$analysis\Fig 3_ATUS2019.png", replace
sum food work sleep carehouse if telfs==1 & trdpftpt==1

misstable sum race sex telfs teage trdpftpt food work sleep
table telfs race sex if teage>=18 & teage<=64 & trdpftpt==1
table telfs race sex if trdpftpt==1 & telfs==1
tab2 telfs sex if trdpftpt==1 & telfs==1, row
tab2 telfs race if trdpftpt==1 & telfs==1, row

sum teage if telfs==1
tab telfs if race!=. &  teage>=18 & teage<=64 & trdpftpt==1
sum teage if telfs==1

* sex differences
mean food work sleep carehouse if telfs==1 & trdpftpt==1 [pw=tufinlwgt], over(race sex)
keep if telfs==1 & trdpftpt==1

svyset tucaseid [pw=tufinlwgt]
eststo mfood: svy: mean food if telfs==1 & trdpftpt==1, over(sex)
eststo mwork: svy: mean work if telfs==1 & trdpftpt==1, over(sex)
eststo msleep: svy: mean sleep if telfs==1 & trdpftpt==1, over(sex)
eststo mcarehouse: svy: mean carehouse if telfs==1 & trdpftpt==1, over(sex)

esttab mfood mwork msleep mcarehouse using "$myfiles$analysis\Supp Mat Table 4", label ci(%9.1f) rtf replace note("Population statistics calculated with sampling weights.")

eststo food: svy, subpop(if telfs==1 & trdpftpt==1): reg food sex##race 
eststo work: svy, subpop(if telfs==1 & trdpftpt==1): reg work sex##race 
eststo sleep: svy, subpop(if telfs==1 & trdpftpt==1): reg sleep sex##race 
eststo carehouse: svy, subpop(if telfs==1 & trdpftpt==1): reg carehouse sex##race 

esttab food work sleep carehouse using "$myfiles$analysis\Supp Mat Table 5", label p(%9.3f) rtf replace note("White-only males are the reference category. Population statistics calculated with sampling weights.")
