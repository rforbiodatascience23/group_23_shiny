#' script UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_script_ui <- function(id){
  ns <- NS(id)
  tagList(

    fluidRow(
      column(8, "DNA_sequence"),
      column(4, "random_dna_length", "generate_dna_button")
    ),
    "peptide_sequence"

  )
}

#' script Server Functions
#'
#' @noRd
mod_script_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

  })
}

## To be copied in the UI
# mod_script_ui("script_1")

## To be copied in the server
# mod_script_server("script_1")
