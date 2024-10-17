fluidPage(
  titlePanel("Tutorial 5 - Shiny 1 - Minimal example"),
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
