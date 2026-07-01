* Figure 1 panel (a) — Migration, Families, and Counterfactual Families
version 17
clear all
set more off, permanently

local root "`c(pwd)'"
local root : subinstr local root "\" "/", all
global maindir "`root'"
global result "${maindir}/artifacts/staging"
cap mkdir "${maindir}/artifacts"
cap mkdir "${result}"
global ado_fldr "${maindir}/ado"
global datadir "${maindir}/data"

cap adopath ++ "${maindir}/ado"

do "${maindir}/stata/Fig1_panelA.do"
