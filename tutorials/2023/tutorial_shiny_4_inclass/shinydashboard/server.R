library(tidyverse)
library(leaflet)

function(input, output, session){

  load("geocodedData.RData")
  
  # produce data
  theData = reactive({
    
    mapData %>%
      filter(year >= input$year[1], year <= input$year[2])
    
  })
  
  output$trend = renderPlot({
    
    thePlot = theData() %>%
      group_by(continent, year) %>%
      summarise(meanLife = mean(lifeExp)) %>%
      ggplot(aes(x=year, y=meanLife, group=continent, color=continent)) +
      geom_line() +
      ggtitle("Life expectancy over time")
    
    
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