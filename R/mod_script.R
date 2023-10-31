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
    dna <- reactiveVal()

    output$DNA <- renderUI({
      textAreaInput(
        inputId = ns("DNA"),
        label = "DNA sequence",
        placeholder = "Insert DNA sequence",
        value = dna(),
        height = 100,
        width = 600
      )


      observeEvent(input$generate_dna, {
        dna(
          enigma::generate_DNA_seq(input$seq_len)
        )
      })

      output$aminoacid_seq <- renderText({
        # Ensure input is not NULL and is longer than 2 characters
        if(is.null(input$DNA_seq)){
          NULL
        } else if(nchar(input$DNA_seq) < 3){
          NULL
        } else{
          input$DNA_seq |>
            toupper() |>
            enigma::transcribe() |>
            enigma::extracted_codons() |>
            enigma::codon_to_aa()
        }
      })

    })


  })
}

## To be copied in the UI
# mod_script_ui("script_1")

## To be copied in the server
# mod_script_server("script_1")
