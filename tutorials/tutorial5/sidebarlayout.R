# Fluid page and side bar layout

# Server part
server = function(input, output) {

  # To print a simple table
  output$table = renderTable({
    # Just print the beginning of the data set
    head(iris)
  })
  
}

# UI part
ui = fluidPage( # You need a fluid page to use a side bar layout
  sidebarLayout(
    # For the bar on the left
    sidebarPanel(
      # Slider widget
      sliderInput("slider", "Slider", min = 1, max = 100, value = 50),
      # Text input widget
      textInput("text", "Text")
    ),
    # For the main panel on the right
    mainPanel(
      # To print a simple table
      tableOutput("table")
    )
  )
)

# Run the application
shinyApp(ui, server)
