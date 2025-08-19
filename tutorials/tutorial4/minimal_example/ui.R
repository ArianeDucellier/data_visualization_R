fluidPage(
  titlePanel("STAT 451 - Visualizing Data - Autumn 2025 - Minimal example"),
  sidebarLayout(
    sidebarPanel(
      textInput(inputId = "comment",
                label = "What would you like to say?",
                value = ""
      )
    ),
    mainPanel(
      h3("This is you saying it"),
      textOutput("textDisplay")
    )
  )
)
