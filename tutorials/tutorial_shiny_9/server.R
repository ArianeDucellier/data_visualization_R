library(tidyverse)

server <- function(input, output) {
  
  mpgData <- read_csv("magnitudes.csv")

  formulaText <- reactive({
    paste(input$variable2, " ~ ", input$variable1)
  })
  
  output$caption <- renderText({
    formulaText()
  })
  
  output$mpgPlot <- renderPlot({
    plot(as.formula(formulaText()),
            data = mpgData,
            col = "#75AADB", pch = 19)
  })
  
}

