* Figure 1 panel (a) — Migration, Families, and Counterfactual Families (Stata)
* Study repo: rep-10.1596-1813-9450-10626
*
* RUNNER — Shiny merges with code/Fig1_panelA.do for copy-paste. From repo root:
*   do "code/fig_1.do"
*
* ============================================================
* SETUP — paths and ado
* ============================================================
version 17
clear all
set more off, permanently

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

do "${maindir}/code/Fig1_panelA.do"
