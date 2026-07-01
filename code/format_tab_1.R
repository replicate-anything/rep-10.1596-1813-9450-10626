# Format Table 1 Stata output for display (HTML)
# Study repo: rep-10.1596-1813-9450-10626

format_tab_1 <- function(object) {
  path <- if (is.list(object) && !is.data.frame(object)) {
    if (!is.null(object$output_path)) {
      as.character(object$output_path[[1]] %||% object$output_path)
    } else if (!is.null(object$smcl_path)) {
      as.character(object$smcl_path[[1]] %||% object$smcl_path)
    } else {
      NULL
    }
  } else if (is.character(object) && length(object) == 1L) {
    object
  } else {
    NULL
  }
  if (is.null(path) || !nzchar(path) || !file.exists(path)) {
    stop("Stata SMCL output not found.")
  }
  if (!requireNamespace("replicateEverything", quietly = TRUE)) {
    stop("Package replicateEverything is required to format Stata output.")
  }
  replicateEverything::smcl_to_html(path)
}

`%||%` <- function(a, b) if (is.null(a)) b else a
