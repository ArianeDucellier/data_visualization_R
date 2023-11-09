library(shinythemes)

fluidPage(
  theme=shinytheme("darkly"),
  themeSelector(),
  titlePanel("Iris dataset"),
  fluidRow(
    column(width = 8,
           tabPanel("Iris",
                    plotOutput("plot",
                               height=300,
                               click = "plot_click",  
                               hover = hoverOpts(id = "plot_hover",
                                                 delayType = "throttle")
                    ),
                    wellPanel(
                      downloadButton("downloadPlot",
                                     label = "Download plot"),
                      downloadButton("downloadData",
                                     label = "Download data")
                    )
           )
    ),
    column(width = 4,
           verbatimTextOutput("plot_hoverinfo")
    )
  ),
  hr(),
  h4("Clicked points"),
  tableOutput("plot_clickedpoints")
)
