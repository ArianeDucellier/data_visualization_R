# Server

library(tidyverse)

# R package for interactive maps
library(leaflet)

# R package for more complex tables
library(DT)

# Load the data
load("geocodedData.Rdata")

function(input, output) {
  
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

  # Produce the simple table
  output$table = renderTable({

    # We use the initial data
    head(mapData)

  })

  # Produce the DT table
  output$DTtable = renderDataTable({

    # Print a DT table    
    datatable(
      # We use the initial data
      mapData %>%
        # Remove latitude and longitude from the DT table
        select(-c(lon, lat)),
      # Define the columns in the DT table
      colnames = c("Country",
                   "Continent",
                   "Year",
                   "Life expectancy",
                   "Population",
                   "GPD per capita"),
      # Add a caption
      caption = "Country details",
      # Show the filters on top
      filter = "top",
      # Options of the DT table
      options = list(
        pageLength = 15,
        lengthMenu = c(10, 20, 50))
    )
    
  })

  # Produce the reactive widget
  output$yearSelectorUI = renderUI({
 
    # We use the filtered data
    # The years present in the data set will be modified every time the slider is modified
    selectedYears = unique(theData()$year)

    # Selector widget    
    selectInput("yearSelector",
                "Select year", 
                selectedYears
    )

  })

}
