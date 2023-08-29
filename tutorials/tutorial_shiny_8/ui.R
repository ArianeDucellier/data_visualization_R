fluidPage(
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
                    downloadButton("downloadPlot",
                                   label = "Download plot"),
                    downloadButton("downloadData",
                                   label = "Download data")
           ),
           h4("Clicked points"),
           tableOutput("plot_clickedpoints")
    ),
    column(width = 4,
           verbatimTextOutput("plot_hoverinfo")
    )
  )
)
