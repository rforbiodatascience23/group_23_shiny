#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @import ggplot2
#' @import enigma
#' @noRd
app_server <- function(input, output, session) {
  mod_plotting_server("plotting_1")
  mod_script_server("script_1")
}

