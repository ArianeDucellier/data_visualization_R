# Combination of layouts

# Server part
server = function(input, output) {

  # To print a simple table 
  output$table = renderTable({
    # Just print the beginning of the data set
    head(iris)
  })

  # To print the first plot  
  output$graph1 = renderPlot({
    # Random values for the plot
    plot(runif(10), runif(10))
  })

  # To print the second plot  
  output$graph2 = renderPlot({
    # Random values for the plot
    plot(runif(10), runif(10))
  })
  
}

# UI part
ui = fluidPage(
  # Let us start with a fluid row
  fluidRow(
    # First column
    column(width = 4,
           # Slider widget
           sliderInput("slider", "Slider", min = 1, max = 100, value = 50)
    ),
    # Second column
    column(width = 8,
           # To print a simple table
           tableOutput("table")
    )
  ),
  # Under the fluid row, we use a split layout
  splitLayout(
    # To make the first plot
    plotOutput("graph1"),
    # To make the second plot
    plotOutput("graph2")
  ),
  # Under the spli layout, we add a vertical layout
  verticalLayout(
    # Text input widget
    textInput("text", "Text"),
    # A paragraph of text
    p("More details here"),
    # A link to some web page
    a(href = "https://shiny.rstudio.com/tutorial/", "Shiny documentation")
  )
)

# Run the application
shinyApp(ui, server)
