# Tabs

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
      # Just a title
      h3("Side bar")
    ),
    # For the main panel on the right
    mainPanel(
      # Start the tabs
      tabsetPanel(
        # First tab
        tabPanel("Slider",
                 # Slider widget
                 sliderInput("slider", "Slider", min = 1, max = 100, value = 50)
        ),
        # Second tab
        tabPanel("Text input",
                 # Text input widget
                 textInput("text", "Text")
        ),
        # Third tab
        tabPanel("Table",
                 # To print a simple table
                 tableOutput("table")
        )
      )
    )
  )
)

# Run the application
shinyApp(ui, server)
