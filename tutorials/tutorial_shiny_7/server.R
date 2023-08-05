
library(tidyverse)
library(leaflet)

function(input, output, session) {

load("geocodedData.Rdata")
  
  # produce data
  
  theData = reactive({
    
    mapData %>%
      filter(year >= input$year[1], year <= input$year[2])
  })
  
  # Summary 
  
  output$summary = renderText({
    
    paste0(input$year[2] - input$year[1], " years are selected. There are ", 
           length(unique(theData()$country)), " countries in the dataset measured at ",
           length(unique(theData()$year)), " occasions.")
  })
  
  # trend
  
  output$trend = renderPlot({ 
    
    thePlot = theData() %>%
      group_by(continent, year) %>%
      summarise(meanLife = mean(lifeExp)) %>%
      ggplot(aes(x = year, y = meanLife, group = continent, colour = continent)) +
      geom_line()
    
    if(input$linear){ 
      thePlot = thePlot + geom_smooth(method = "lm") 
    } 
    
    print(thePlot)
  })
  
  # map
  
  output$map = renderLeaflet({
    
    mapData %>%
      filter(year == input$year[2]) %>%
      leaflet() %>%
      addTiles() %>%
      setView(lng = 0, lat = 0, zoom = 2) %>%
      addCircles(lng = ~ lon, lat = ~ lat, weight = 1,
                 radius = ~ lifeExp * 5000, 
                 popup = ~ paste(country, lifeExp))
  })
  
  # icons
  
  output$infoYears = renderInfoBox({
    infoBox(
      "Years", input$year[2] - input$year[1], 
      icon = icon("calendar", lib = "font-awesome"),
      color = "blue", 
      fill = ifelse(input$year[2] < 2007, 
                    TRUE, FALSE)
    )
  })
  
  output$infoLifeExp = renderInfoBox({
    
    infoLifeExp = theData() %>%
      filter(year == 2007) %>%
      group_by(continent) %>%
      filter(continent == input$continent) %>%
      pull(lifeExp) %>%
      mean() %>%
      round(0)

    infoBox(
      "Life Exp. (2007)", infoLifeExp,
        icon = icon("user"),
      color = "purple", 
      fill = ifelse(infoLifeExp > 60, 
                    TRUE, FALSE)
    )
  })
  
  output$infoGdpPercap = renderInfoBox({
    
    infoGDP = theData() %>%
      filter(year == 2007) %>%
      group_by(continent) %>%
      filter(continent == input$continent) %>%
      pull(gdpPercap) %>%
      mean() %>%
      round(0)
    
    infoBox("GDP per capita", 
      infoGDP, 
      icon = icon("usd"),
      color = "green", 
      fill = ifelse(infoGDP > 5000, 
                    TRUE, FALSE)
    )
  })

}
