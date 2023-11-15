
fluidPage(
  
  titlePanel("Miles Per Gallon"),
  
  sidebarLayout(
    
    sidebarPanel(
      
      selectInput("variable1", "Variable 1:",
                  c("Duration (Laboratory 1)" = "md_L1",
                    "Duration (Laboratory 2)" = "md_L2",
                    "Duration (Laboratory 3)" = "md_L3",
                    "Moment" = "mw",
                    "Body wave" = "mb",
                    "Surface wave" = "ms",
                    "Local" = "ml")),

      selectInput("variable2", "Variable 2:",
                  c("Duration (Laboratory 1)" = "md_L1",
                    "Duration (Laboratory 2)" = "md_L2",
                    "Duration (Laboratory 3)" = "md_L3",
                    "Moment" = "mw",
                    "Body wave" = "mb",
                    "Surface wave" = "ms",
                    "Local" = "ml"))
    ),
    
    mainPanel(
      
      h3(textOutput("caption")),
      
      plotOutput("mpgPlot")
      
    )
  )
)