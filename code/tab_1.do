* Table 1 — Migration, Families, and Counterfactual Families
* Wrapper sets paths; analysis logic is in stata/Table1.do (shown in Code tab).
version 17
clear all
set more off, permanently
estimates clear

local root "`c(pwd)'"
local root : subinstr local root "\" "/", all
global maindir "`root'"
global result "${maindir}/artifacts/staging"
cap mkdir "${maindir}/artifacts"
cap mkdir "${result}"
global ado_fldr "${maindir}/ado"
global datadir "${maindir}/data"

cap adopath ++ "${maindir}/ado"

do "${maindir}/stata/Table1.do"
