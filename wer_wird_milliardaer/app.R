# Lade die erforderlichen Bibliotheken
library(shiny)

# UI (Benutzeroberfläche) definieren
ui <- fluidPage(
  # Titel zentriert mit Abstand
  titlePanel(h1("Wer wird Milliardär*in?", align = "center")),
  
  # Abstand
  br(), br(),
  
  # Input-Feld zentriert
  fluidRow(
    column(width = 12, align = "center",
           numericInput("income", 
                        "Wie hoch ist dein monatliches Nettoeinkommen?", 
                        value = 5000)
    )
  ),
  
  # Abstand
  br(), br(),
  
  # Output-Feld zentriert und größerer Text
  fluidRow(
    column(width = 12, align = "center",
           htmlOutput("outputText")
    )
  )
)

# Server-Logik definieren
server <- function(input, output) {
  output$outputText <- renderUI({
    income <- input$income
    # Berechnung der Jahre, um Milliardär zu werden
    years <- 1000000000 / (income * 14)
    HTML(paste("<span style='font-size:20px;'>Gratulation, du musst nur <b>", round(years, 2), "</b> Jahre arbeiten, um Milliardär*in zu werden!</span>", sep = ""))  })
}

# Shiny-App erstellen
shinyApp(ui = ui, server = server)
