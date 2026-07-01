# Format Table 1 Stata output for display (HTML)
# Study repo: rep-10.1596-1813-9450-10626

format_tab_1 <- function(object) {
  path <- if (requireNamespace("replicateEverything", quietly = TRUE)) {
    replicateEverything::stata_result_path(object)
  } else if (is.character(object) && length(object) == 1L) {
    object
  } else if (is.list(object)) {
    object$output_path %||% object$smcl_path %||% NULL
  } else {
    NULL
  }
  if (is.null(path) || !file.exists(path)) {
    stop("Stata SMCL output not found.")
  }
  if (!requireNamespace("replicateEverything", quietly = TRUE)) {
    stop("Package replicateEverything is required to format Stata output.")
  }
  replicateEverything::smcl_to_html(path)
}

`%||%` <- function(a, b) if (is.null(a)) b else a
