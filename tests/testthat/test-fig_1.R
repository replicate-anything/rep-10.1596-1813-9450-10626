DOI <- "10.1596/1813-9450-10626"
WHAT <- "fig_1"
FOLDER <- "10.1596_1813-9450-10626"

monorepo_root <- normalizePath(
  file.path(testthat::test_path(".."), ".."),
  winslash = "/",
  mustWork = FALSE
)

study_dir <- file.path(monorepo_root, "rep-10.1596-1813-9450-10626")
data_file <- file.path(study_dir, "data", "ACS2017-2021_finalready.dta")

testthat::skip_if_not(dir.exists(study_dir), "Stata study repo missing")
testthat::skip_if_not(file.exists(data_file), "ACS data file missing in study repo")
testthat::skip_if(is.null(replicateEverything::find_stata_executable()), "Stata not installed")

local_index <- replicateEverything::load_index(
  file.path(monorepo_root, "registry", "index.csv")
)
local_index <- local_index[local_index$folder == FOLDER, , drop = FALSE]

opts <- list(
  replicateEverything.registry_root = file.path(monorepo_root, "registry"),
  replicateEverything.index = local_index,
  replicateEverything.use_sibling_packages = TRUE,
  replicateEverything.study_folders_root = monorepo_root
)
do.call(options, opts)
on.exit(options(
  replicateEverything.registry_root = NULL,
  replicateEverything.index = NULL,
  replicateEverything.use_sibling_packages = NULL,
  replicateEverything.study_folders_root = NULL
), add = TRUE)

test_that("fig_1 runs in Stata and returns PNG path", {
  result <- replicateEverything::render_replication(DOI, WHAT, folder = FOLDER)
  testthat::expect_s3_class(result, "replication_result")
  testthat::expect_s3_class(result$object, "stata_replication_result")
  testthat::expect_true(file.exists(result$object$output_path))
  testthat::expect_equal(tools::file_ext(result$object$output_path), "png")

  path <- replicateEverything::replication_object(result)
  testthat::expect_true(file.exists(path))
})

test_that("fig_1 artifact loads when present", {
  path <- replicateEverything::get_artifact_path(DOI, WHAT, folder = FOLDER)
  testthat::skip_if(is.null(path), "fig_1 artifact not built yet")
  art <- replicateEverything::load_artifact(DOI, WHAT, folder = FOLDER)
  testthat::expect_true(file.exists(art))
})
