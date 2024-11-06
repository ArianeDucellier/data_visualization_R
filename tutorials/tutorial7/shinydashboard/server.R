# Server

library(tidyverse)

# R package for interactive maps

library(leaflet)

function(input, output, session) {

# Load the data
load("geocodedData.Rdata")
  
  # Produce the data with a reactive element
  theData = reactive({

    # mapData is read from the input file geocodedData.Rdata
    mapData %>%
      # We use the output of the slider to filter the years
      # This will be done each time the slider is modified
      filter(year >= input$year[1], year <= input$year[2])
  })
  
  # Produce the text of the summary 
  output$summary = renderText({
 
    # We count the countries and the years in the filtered data
    # This will be updated every time the slider is modified
    paste0(input$year[2] - input$year[1], " years are selected. There are ", 
           length(unique(theData()$country)), " countries in the dataset measured at ",
           length(unique(theData()$year)), " occasions.")
  })
  
  # Produce the plot of the trend
  output$trend = renderPlot({ 
    
    # We use the filtered data
    # The plot will be updated every time the slider is modified
    thePlot = theData() %>%
      # Group by continent and year
      group_by(continent, year) %>%
      # Compute the mean life expectancy of each continent
      summarise(meanLife = mean(lifeExp)) %>%
      # Start a plot with year and mean life expectancy
      ggplot(aes(x = year, y = meanLife, group = continent, colour = continent)) +
      # Make a line plot
      geom_line() +
      # Add a title
      ggtitle("Graph to show life expectancy by continent over time")
    
    # Add a trend if the box is checked    
    if(input$linear){ 
      thePlot = thePlot + geom_smooth(method = "lm") 
    } 
    
    # Print the final plot
    print(thePlot)
  })
  
  # Produce the leaflet map
  output$map = renderLeaflet({
    
    # We use the original (non-filtered) data    
    mapData %>%
      # kep only the year selected with the reactive widget
      filter(year == input$yearSelector) %>%
      # Start the leaflet plot
      leaflet() %>%
      # Add a tile layer to the map
      addTiles() %>%
      # Define the center and the default zoom level
      setView(lng = 0,
              lat = 0,
              zoom = 2) %>%
      # The data are represented with circles
      addCircles(lng = ~ lon,
                 lat = ~ lat,
                 weight = 1,
                 radius = ~ lifeExp * 5000, 
                 popup = ~ paste(country, lifeExp))
  })
  
  # Produce the first info box
  output$infoYears = renderInfoBox({

    # Create info box
    infoBox(
      "Years", # Title
      input$year[2] - input$year[1], # Value
      icon = icon("calendar", lib = "font-awesome"), # Icon
      color = "blue", # Color
      # Condition for filling
      fill = ifelse(input$year[2] < 2007, 
                    TRUE, FALSE)
    )
  })

  # Produce the second info box  
  output$infoLifeExp = renderInfoBox({

    # Data manipulation to compute mean life expectancy
    # We use the filtered data
    # The box will be updated every time the slider is modified
    infoLifeExp = theData() %>%
      filter(year == 2007) %>%
      group_by(continent) %>%
      filter(continent == input$continent) %>%
      pull(lifeExp) %>%
      mean() %>%
      round(0)

    # Create info box
    infoBox(
      "Life Exp. (2007)", # Title
      infoLifeExp, # Value
      icon = icon("user"), # Icon
      color = "purple", # Color
      # Condition for filling
      fill = ifelse(infoLifeExp > 60, 
                    TRUE, FALSE)
    )
  })

  # Produce the third info box  
  output$infoGdpPercap = renderInfoBox({

    # Data manipulation to compute mean GDP
    # We use the filtered data
    # The box will be updated every time the slider is modified
    infoGDP = theData() %>%
      filter(year == 2007) %>%
      group_by(continent) %>%
      filter(continent == input$continent) %>%
      pull(gdpPercap) %>%
      mean() %>%
      round(0)

    # Create info box    
    infoBox(
      "GDP per capita", # Title
      infoGDP, # Value
      icon = icon("usd"), # Icon
      color = "green", # Color
      # Condition for filling
      fill = ifelse(infoGDP > 5000, 
                    TRUE, FALSE)
    )
  })

}
