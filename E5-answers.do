
// ECON 523:  PROGRAM EVALUATION FOR INTERNATIONAL DEVELOPMENT
// EMPIRICAL EXERCISE 5:  FIXED EFFECTS


clear all 
set scheme s1mono 
set more off
set seed 12345
webuse set https://pjakiela.github.io/TWFE/
webuse WDI-FPE-data.dta

exit


// GETTING STARTED

drop if primary==.


// ONE-WAY FIXED EFFECTS

** year fixed effects
reg primary i.year treatment


** normalizing by year
bys year:  egen mean_primary = mean(primary)
bys year:  egen mean_treatment = mean(treatment)
gen norm_primary = primary - mean_primary
gen norm_treatment = treatment - mean_treatment

reg norm_primary norm_treatment


** residualized values of x and y
reg primary i.year
predict primary_resid, resid

reg treatment i.year
predict treatment_resid, resid

reg primary_resid treatment_resid

** graphing weights in OLS

twoway ///
	(scatter treatment_resid year if treatment==1, mcolor(vermillion*0.8)) ///
	(scatter treatment_resid year if treatment==0, mcolor(sea*0.6)) ///
	(lpoly treatment_resid year if treatment==1, lcolor(vermillion)) ///
	(lpoly treatment_resid year if treatment==0, lcolor(sea)), ///
	legend(order(3 4) label(3 "Treatment") cols(1) label(4 "Comparison") ring(0) pos(2)) ///
	ytitle("Residualized Treatment" " ") xtitle(" " "Year")

exit


// TWO-WAY FIXED EFFECTS

drop  mean_primary mean_treatment norm_primary norm_treatment primary_resid ///
	treatment_resid

** TWFE regression

reg primary i.year i.id treatment

** residualized treatment

reg treatment i.year i.id
predict treatment_resid, resid

reg primary treatment_resid

reg primary i.year i.id
predict primary_resid, resid

reg primary_resid treatment_resid


** is TWFE biased?

/*
tw ///
 (histogram treatment_resid if treatment==0, frac bcolor(vermillion%40)) ///
 (histogram treatment_resid if treatment==1, frac bcolor(sea%60)), ///
 xtitle(" " "Residualized Treatment") ///
 legend(label(1 "Comparison") label(2 "Treatment") col(1) ring(0) pos(11)) ///
 plotregion(margin(vsmall))
 
tw ///
	(scatter primary_resid treatment_resid if treatment==0, msymbol(o) color(vermillion%20)) ///
	(scatter primary_resid treatment_resid if treatment==1, msymbol(o) color(sea%20)) ///	
	(lpoly primary_resid treatment_resid if treatment==0, lcolor(vermillion) lpattern(longdash) deg(1) bwidth(0.2)) ///
	(lfit primary_resid treatment_resid if treatment==0, lcolor(vermillion) lpattern(solid)) ///	
	(lpoly primary_resid treatment_resid if treatment==1, lcolor(sea) lpattern(longdash) deg(1) bwidth(0.2)) ///
	(lfit primary_resid treatment_resid if treatment==1, lcolor(sea) lpattern(solid)), ///	
	legend(off)
*/

gen negweight = (treatment==1 & treatment_resid<0)
tab country if negweight==1
tab country if negweight==1 & treatment==1
tab year if negweight==1 & treatment==1

** dropping later years

drop *resid* negweight

drop if year>2005
reg primary i.year i.id treatment

reg treatment i.year i.id
predict treatment_resid, resid

reg primary treatment_resid

gen negweight = (treatment==1 & treatment_resid<0)
tab country if negweight==1
tab country if negweight==1 & treatment==1
tab year if negweight==1 & treatment==1

exit
	
	
// MORE FUN

gen yxtresid = primary*treatment_resid
egen sumyxtresid = sum(yxtresid)
gen tresid2 = treatment_resid^2
egen sumtresid2 = sum(tresid2)
gen twfecoef = sumyxtresid/sumtresid2
sum twfecoef
display r(mean)

