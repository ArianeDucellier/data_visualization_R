# Split layout

# Server part
server = function(input, output) {

  # To print a simple table
  output$table = renderTable({
    # Just print the beginning of the data set
    head(iris)
  })
  
}

# UI part
ui = splitLayout(
  # Define the widths of the cells (add to 100)
  cellWidths = c("20%", "20%", "60%"),
  # Slider widget
  sliderInput("slider", "Slider", min = 1, max = 100, value = 50),
  # Text input widget
  textInput("text", "Text"),
  # To print a simple table
  tableOutput("table")
)

# Run the application
shinyApp(ui, server)
