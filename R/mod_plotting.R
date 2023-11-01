#' plotting UI Function
#'
#' @description A shiny Module.
#'
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom ggplot2 theme
#' @import enigma
#' @importFrom shiny NS tagList
mod_plotting_ui <- function(id){
  ns <- NS(id)
  tagList(
    shiny::sidebarLayout(
      shiny::sidebarPanel(
        shiny::textAreaInput(
          inputId = ns("peptide"),
          label = "Peptide sequence",
          width = 300,
          height = 100,
          placeholder = "Insert peptide sequence"
        )
      ),
      shiny::mainPanel(
        shiny:: plotOutput(
          outputId = ns("abundance")
            )
        )
      )
    )
}

#' plotting Server Functions
#'
#' @noRd
mod_plotting_server <- function(id){
  moduleServer( id, function(input, output, session){

    output$abundance <- renderPlot({
      if(input$peptide == ""){
        NULL
      } else{
        input$peptide |>
          enigma::plot_aa_counts() +
          ggplot2::theme(legend.position = "none")
      }
    })
    ns <- session$ns

  })
}

## To be copied in the UI
# mod_plotting_ui("plotting_1")

## To be copied in the server
# mod_plotting_server("plotting_1")
