# Fluid rows

# Server part
server = function(input, output) {

  # To print a simple table  
  output$table = renderTable({
    # Just print the beginning of the data set    
    head(iris)
  })
  
}

# UI part
ui = fluidPage( # You need a fluid page to use a fluid row
  # First row
  fluidRow(
    # First column
    column(width = 4,
           # Slider widget
           sliderInput("slider", "Slider", min = 1, max = 100, value = 50),
           # Text input widget
           textInput("text", "Text")
    ),
    # Second column
    column(width = 8,
           # To print a simple table
           tableOutput("table")
    )
  )
)

# Run the application
shinyApp(ui, server)
