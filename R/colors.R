
#' @importFrom grDevices colors

initialize_colors <- function(debug_pkgs) {

  cols <- c("green", "blue", "magenta", "cyan", "white", "yellow", "red",
            "silver")

  palette <- structure(
    c(
      cols,
      sample(colors(), max(length(debug_pkgs) - length(cols), 0))
    )[seq_along(debug_pkgs)],
    names = debug_pkgs
  )

  assign("palette", palette, envir = debug_data)
}

#' @importFrom crayon make_style

get_package_style <- function(pkg) {
  if (pkg %in% names(debug_data$palette)) {
    make_style(debug_data$palette[pkg])
  } else {
    identity
  }
}
