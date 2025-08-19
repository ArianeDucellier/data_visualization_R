# User interface

# Load the package to make Shiny dashboards

library(shinydashboard)

# Leaflet package to make interactive maps

library(leaflet)

# We start by defining a header (with a title) for the dashboard

header <- dashboardHeader(title = "Gapminder")

# We then define a sidebar

sidebar <- dashboardSidebar(

  # We fill the side bar with elements
  sidebarMenu(

    # This is to add a tab
    menuItem("Dashboard", # Title displayed on the tab
             tabName = "dashboard", # Id to be referred to in the server.R part
             icon = icon("dashboard") # Icon displayed next to the title
    ),

    # This is to add another tab    
    menuItem("Map", # Title displayed on the tab
             tabName = "map", # Id to be referred to in the server.R part
             icon = icon("globe"), # Icon displayed next to the title
             badgeLabel = "beta", # Badge displayed on the right of the tab
             badgeColor = "red" # Color of the badge
    ),

    # The slider will be shown regardless of which tab is selected
    sliderInput("year",
                "Years included",
                min = 1952,
                max = 2007,
                value = c(1952, 2007),
                sep = "",
                step = 5
    ),
 
    # The selector will be shown regardless of which tab is selected
    selectInput("continent",
                "Select continent", 
                choices = c("Africa", "Americas", "Asia", "Europe", "Oceania")
    )
  )
)

# We define the body of the dashboard

body <- dashboardBody(

  # We define the items corresponding to the tabs in the side bar

  tabItems(

    # Item corresponding to the first tab
    tabItem(tabName = "dashboard", # We use here the first tab id

      # We can use Shiny layouts
      # First row
      fluidRow(

        # Create an info box with interactive output
        infoBoxOutput(width = 3,
                      "infoYears" # Box id to be referred to in server.R
        ),

        # Create an info box with interactive output
        infoBoxOutput(width = 3,
                      "infoLifeExp" # Box id to be referred to in server.R
        ),

        # Create an info box with interactive output
        infoBoxOutput(width = 3,
                      "infoGdpPercap"  # Box id to be referred to in server.R
        ),

        # Create a simple info box
        infoBox(width = 3,
                "Shiny version", # Title
                "1.1.0", # Value
                icon = icon("desktop") # Icon
        )
      ),

      # Second row
      fluidRow(

        # Box with content: The sum of the widths must be equal to 12
        box(width = 12,

          # Include a plot defined in the server.R
          plotOutput("trend"),

          # Include a check box
          checkboxInput("linear", 
                        label = "Add trend line?", 
                        value = FALSE
          )
        )
      )
    ),

    # Item corresponding to the second tab    
    tabItem(tabName = "map", # We use here the second tab id

      # Box with content
      box(width = 12,

          # Include a map defined in server.R
          leafletOutput("map"),

          # Include a paragraph of text
          p("Map data is from the most recent year in the selected range")
      )
    )
  )
)

# Finally the dashboard is the combination of header, sidebar and body
dashboardPage(header, sidebar, body)
