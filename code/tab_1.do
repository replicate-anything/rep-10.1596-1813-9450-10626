* Table 1 — Migration, Families, and Counterfactual Families (Stata)
* Study repo: rep-10.1596-1813-9450-10626
*
* This file is the RUNNER. Shiny merges it with code/Table1.do for a single
* copy-paste script. To run manually from the study repo root:
*   do "code/tab_1.do"
*
* ============================================================
* SETUP — paths and ado (edit maindir if you run from elsewhere)
* ============================================================
version 17
clear all
set more off, permanently
estimates clear

local root "`c(pwd)'"
local root : subinstr local root "\" "/", all
global maindir "`root'"
if "${REPLICATE_STATA_RESULT}" != "" {
    global result "${REPLICATE_STATA_RESULT}"
    cap mkdir "${result}"
}
else {
    global result "${maindir}/artifacts/staging"
    cap mkdir "${maindir}/artifacts"
    cap mkdir "${result}"
}
global ado_fldr "${maindir}/ado"
global datadir "${maindir}/data"

cap adopath ++ "${maindir}/ado"

* Analysis is in code/Table1.do (shown in full in the Code tab).
do "${maindir}/code/Table1.do"
