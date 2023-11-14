library(shinydashboard)
library(leaflet)

header <- dashboardHeader(title="Gapminder")

sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("Dashboard", tabName="dashboard",
             icon=icon("dashboard")),
    menuItem("Map", tabName="map",
             icon=icon("globe"),
             badgeLabel="beta", badgeColor="red"),

  sliderInput(inputId="year",
              label="Years included",
              min=1952,
              max=2007,
              value=c(1952, 2007),
              sep="",
              step=5
  ),
  selectInput("continent", "Select continent",
              choices=c("Africa", "Americas", "Asia", "Europe", "Oceania"))
  )
)

body <- dashboardBody(
  tabItems(
    tabItem(tabName="dashboard",
      fluidRow(infoBoxOutput(width=3, "infoYears"),
               infoBoxOutput(width=3, "infoLifeExp"),
               infoBoxOutput(width=3, "infoGdpPercap"),
               infoBox(width=3, "Shiny version", "1.1.0", icon=icon("desktop"))),
      fluidRow(
        box(width=12, plotOutput("trend"))
      )
    ),
    tabItem(tabName="map",
      box(width=12, leafletOutput("map"))
    )
  )
)

dashboardPage(header, sidebar, body)
