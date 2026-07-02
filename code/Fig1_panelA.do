use "${datadir}/ACS2017-2021_finalready.dta", clear

* Keep married migrants before migration (Figure 1 sample)
keep if status_evermarried == 1

foreach v in evermarr_det1 evermarr_det2 evermarr_det3 {
    gen STD_`v' = `v'
}

* Figure 1, panel (a) — men
preserve
    keep if male == 1
    keep if yrsusa1 < 21
    collapse (mean) evermarr_det1 evermarr_det2 evermarr_det3 (semean) STD_*, by(yrsusa1)

    foreach v in evermarr_det1 evermarr_det2 evermarr_det3 {
        gen upper_`v' = `v' + 1.96 * STD_`v'
        gen lower_`v' = `v' - 1.96 * STD_`v'
    }

    twoway ///
        (rarea upper_evermarr_det2 lower_evermarr_det2 yrsusa1, color(ltblue)) ///
        (rarea upper_evermarr_det3 lower_evermarr_det3 yrsusa1, color("189 30 36*.1")) ///
        (line evermarr_det2 yrsusa1, lcolor(blue)) ///
        (line evermarr_det3 yrsusa1, lcolor(red)) ///
        , legend(order(3 "Spouse absent" 4 "Separated or divorced") region(lwidth(none))) ///
        xtitle("Years in the US") ytitle("") ylab(, angle(horizontal)) ///
        graphregion(color(white)) ///
        title("Figure 1 panel (a), men") name(fig1_A, replace)

    graph export "${result}/Fig1_panelA.png", width(1000) replace
restore
