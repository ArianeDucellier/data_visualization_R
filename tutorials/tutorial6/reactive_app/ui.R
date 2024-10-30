# UI

# R package for interactive maps
library(leaflet)

# R package for more complex tables
library(DT)

fluidPage(

  # Application title  
  titlePanel("Gapminder"),

  # We use a side bar layout with a bar on the left and a main panel on the right  
  sidebarLayout(

    # Left bar
    sidebarPanel(
      # Slider widget
      sliderInput(inputId = "year",
                  label = "Years included",
                  min = 1952,
                  max = 2007,
                  value = c(1952, 2007),
                  sep = "",
                  step = 5
      ),

      # We want to see this widget only if one tab is selected on the main panel
      conditionalPanel(
        # Condition to see the widget
        condition = "input.theTabs == 'trend'",
        # Check box widget
        checkboxInput("linear", label = "Add trend line?", value = FALSE)
      ),

      # A reactive widget (defined in the server part)
      uiOutput("yearSelectorUI")

    ),

    # Main panel    
    mainPanel(
      # Start the tabs
      tabsetPanel(id = "theTabs",
        # First tab
        tabPanel("Summary",
                 # To print a text
                 textOutput("summary"),
                 value="summary"
        ),
        # Second tab
        tabPanel("Trend",
                 # To print a plot
                 plotOutput("trend"),
                 value="trend"
        ),
        # Third tab
        tabPanel("Map",
                 # To print a leaflet map
                 leafletOutput("map"), 
                 value="map"
        ),
        # Fourth tab
        tabPanel("Table",
                 # To print a simple table
                 tableOutput("table"),
                 value="table"
        ),
        # Fifth tab
        tabPanel("DT Table",
                 # To print a DT table
                 dataTableOutput("DTtable"),
                 value="DTtable"
        )
      )
    )
  )
)
