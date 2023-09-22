library(dash)

app <- dash_app()

df <- read.csv(
  file = "https://raw.githubusercontent.com/plotly/datasets/master/gapminderDataFiveYear.csv",
  stringsAsFactor = FALSE,
  check.names = FALSE
)

continents <- unique(df$continent)
years <- unique(df$year)

app %>% set_layout(
  dccGraph(id = 'graph-with-slider'),
  dccSlider(
    id = 'year-slider',
    min = 0,
    max = length(years) - 1,
    marks = years,
    value = 0
  )
)

app %>% add_callback(
  output(id = 'graph-with-slider', property = 'figure'),
  input(id = 'year-slider', property = 'value'),
  function(selected_year_index) {
    
    which_year_is_selected <- which(df$year == years[selected_year_index + 1])
    
    traces <- lapply(
      continents, function(cont) {
        which_continent_is_selected <- which(df$continent == cont)
        
        df_sub <- df[intersect(which_year_is_selected, which_continent_is_selected), ]
        
        list(
          x = df_sub$gdpPercap,
          y = df_sub$lifeExp,
          opacity = 0.5,
          text = df_sub$country,
          mode = 'markers',
          marker = list(
            size = 15,
            line = list(width = 0.5, color = 'white')
          ),
          name = cont
        )
      }
    )
    
    figure <- list(
      data = traces,
      layout = list(
        xaxis = list(type = 'log', title = 'GDP Per Capita'),
        yaxis = list(title = 'Life Expectancy', range = c(20,90)),
        margin = list(l = 40, b = 40, t = 10, r = 10),
        legend = list(x = 0, y = 1),
        hovermode = 'closest'
      )
    )
    
    figure
  }
)

app %>% run_app()