# Migration, Families, and Counterfactual Families

Folder-backed replication study for [replicateEverything](https://github.com/replicate-anything/replicateEverything).

- **DOI:** [10.1596/1813-9450-10626](https://doi.org/10.1596/1813-9450-10626)
- **Analysis language:** Stata (tables and figures); R helpers format output for the registry and Shiny app.

## Layout

| Path | Role |
|------|------|
| `code/*.do` | Stata wrappers invoked by replicateEverything |
| `code/format_*.R` | R formatters (SMCL → HTML) |
| `stata/` | Author do-files adapted for portable paths |
| `ado/` | Bundled Stata ado files (estout, esttab, …) |
| `data/` | Intermediate `.dta` files (not in git; see below) |
| `artifacts/` | Precomputed display files |

## Data

Place `ACS2017-2021_finalready.dta` in `data/` from the World Bank reproducibility package
[RR_USA_2023_43-v01](https://reproducibility.worldbank.org/catalog/84).

For local development in the monorepo, symlink or copy from
`RR_USA_2023_43-v01/Reproducibility Package/`.

## Run Table 1

```r
options(
  replicateEverything.registry_root = "path/to/registry",
  replicateEverything.use_sibling_packages = TRUE,
  replicateEverything.study_folders_root = "path/to/monorepo"
)
replicateEverything::run_replication("10.1596/1813-9450-10626", "tab_1", format = TRUE)
```

Requires Stata 16+ on the machine running R.
