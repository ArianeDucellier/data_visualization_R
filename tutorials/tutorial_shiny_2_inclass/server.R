library(tidyverse)
library(leaflet)

load("geocodedData.RData")

function(input, output){

  # produce data
  theData = reactive({

    mapData %>%
      filter(year >= input$year[1], year <= input$year[2])

  })

  output$summary = renderText({
    
    paste0(input$year[2] - input$year[1], "years are selected. There are ",
           length(unique(theData()$country)), " countries in the dataset measured at ",
           length(unique(theData()$year)), " occasions.")
    
  })

  output$trend = renderPlot({

    thePlot = theData() %>%
      group_by(continent, year) %>%
      summarise(meanLife = mean(lifeExp)) %>%
      ggplot(aes(x=year, y=meanLife, group=continent, color=continent)) +
      geom_line() +
      ggtitle("Life expectancy over time")

    if(input$linear){
      thePlot = thePlot +
        geom_smooth(method="lm")
    }

    print(thePlot)
    
  })

  output$map = renderLeaflet({

    mapData %>%
      filter(year == input$year[2]) %>%
      leaflet() %>%
      addTiles() %>%
      setView(lng=0, lat=0, zoom=2) %>%
      addCircles(lng = ~ lon, 
                 lat = ~ lat,
                 weight=1,
                 radius = ~ lifeExp * 5000,
                 popup = ~ paste(country, lifeExp))
    
  })

}