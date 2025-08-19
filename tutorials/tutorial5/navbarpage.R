# Top level navigation bar

# Server part
server = function(input, output) {

  # To print a simple table  
  output$table = renderTable({
    # Just print the beginning of the data frame
    head(iris)
  })
  
}

# UI part
ui = navbarPage("Navbar demo",
                # You do not need to start the tabs with tabsetPanel here
                # First tab
                tabPanel("Inputs",
                         # Slider widget
                         sliderInput("slider", "Slider", min = 1, max = 100, value = 50),
                         # Text input widget
                         textInput("text", "Text")
                ),
                # Second tab
                tabPanel("Table",
                         # To print a simple table
                         tableOutput("table")
                )
)

# Run the application
shinyApp(ui, server)
