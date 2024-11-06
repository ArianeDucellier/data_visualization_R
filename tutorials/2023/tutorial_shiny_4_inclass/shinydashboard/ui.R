library(shinydashboard)
library(leaflet)

header <- dashboardHeader(title="Gapminder")

sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("Dashboard", tabName="dashboard"),
    menuItem("Map", tabName="map"),

  sliderInput(inputId="year",
              label="Years included",
              min=1952,
              max=2007,
              value=c(1952, 2007),
              sep="",
              step=5
  )
  )
)

body <- dashboardBody(
  tabItems(
    tabItem(tabName="dashboard",
      box(width=12, plotOutput("trend"))
    ),
    tabItem(tabName="map",
      box(width=12, leafletOutput("map"))
    )
  )
)

dashboardPage(header, sidebar, body)
