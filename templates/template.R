library(gapminder)

ui <- page_navbar(
  title = "My Shiny application",
  nav_panel("Panel 1",
    sidebarLayout(
      sidebarPanel(
        checkboxInput("linear1", label = "Add trend line?", value = FALSE)
      ),
      mainPanel(
        plotOutput(outputId = "plot1")
      )
    )
  ),
  nav_panel("Panel 2",
    sidebarLayout(
      sidebarPanel(
        checkboxInput("linear2", label = "Add trend line?", value = FALSE)
      ),
      mainPanel(
        plotOutput(outputId = "plot2")
      )
    )
  )
)

server <- function(input, output) {
  output$plot1 <- renderPlot({ 
    
    thePlot = gapminder %>%
      filter(year > 1960) %>%
      group_by(continent, year) %>%
      summarise(meanLife = mean(lifeExp)) %>%
      ggplot(aes(x = year, y = meanLife, group = continent, colour = continent)) +
      geom_line()
    
    if(input$linear1){ 
      thePlot = thePlot + geom_smooth(method = "lm") 
    }

    print(thePlot)
  })

  output$plot2 <- renderPlot({ 
    
    thePlot = gapminder %>%
      filter(year > 1960) %>%
      group_by(continent, year) %>%
      summarise(meanLife = mean(lifeExp)) %>%
      ggplot(aes(x = year, y = meanLife, group = continent, colour = continent)) +
      geom_line()
    
    if(input$linear2){ 
      thePlot = thePlot + geom_smooth(method = "lm") 
    }
    
    print(thePlot)
  })
}

shinyApp(ui=ui, server=server)
