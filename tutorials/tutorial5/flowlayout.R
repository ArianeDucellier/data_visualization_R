# Flow layout

# Server part
server = function(input, output) {

  # To print a simple table  
  output$table = renderTable({
    # Just print the beginning of the data set
    head(iris)
  })
  
}

# UI part
ui = flowLayout(
  # Slider widget
  sliderInput("slider", "Slider", min = 1, max = 100, value = 50),
  # Text input widget
  textInput("text", "Text"),
  # To print a simple table
  tableOutput("table")
)

# Run the application
shinyApp(ui, server)
