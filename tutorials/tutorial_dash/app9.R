library(dash)
library(dplyr)

app <- dash_app()

df <- read.csv(
  file = 'https://gist.githubusercontent.com/chriddyp/cb5392c35661370d95f300086accea51/raw/8e0768211f6b747c0db42a9ce9a0937dafcbd8b2/indicators.csv',
  stringsAsFactor = FALSE
)

available_indicators <- unique(df$Indicator.Name)
years <- unique(df$Year)
num_years <- length(years)

option_indicator <- lapply(
  available_indicators,
  function(available_indicator) {
    list(label = available_indicator,
         value = available_indicator)
  }
)

app %>% set_layout(
  div(
    dccDropdown(
      id = 'xaxis-column',
      options = option_indicator,
      value = 'Fertility rate, total (births per woman)'
    ),
    dccRadioItems(
      id = 'xaxis-type',
      options = list(list(label = 'Linear', value = 'linear'),
                     list(label = 'Log', value = 'log')),
      value = 'linear',
      labelStyle = list(display = 'inline-block')
    ),
    style = list(width = '48%', display = 'inline-block')
  ),
  div(
    dccDropdown(
      id = 'yaxis-column',
      options = option_indicator,
      value = 'Life expectancy at birth, total (years)'
    ),
    dccRadioItems(
      id = 'yaxis-type',
      options = list(list(label = 'Linear', value = 'linear'),
                     list(label = 'Log', value = 'log')),
      value = 'linear',
      labelStyle = list(display = 'inline-block')
    ),
    style = list(width = '48%', float = 'right', display = 'inline-block')
  ),
  dccGraph(id = 'indicator-graphic'),
  dccSlider(
    id = 'year--slider',
    min = 0,
    max = num_years - 1,
    marks = years,
    value = num_years - 1
  )
)

app %>% add_callback(
  output('indicator-graphic', 'figure'),
  list(
    input('xaxis-column', 'value'),
    input('yaxis-column', 'value'),
    input('xaxis-type', 'value'),
    input('yaxis-type', 'value'),
    input('year--slider', 'value')
  ),
  function(xaxis_column_name, yaxis_column_name, xaxis_type, yaxis_type, year_value) {
    data_by_indicator <- df %>%
      dplyr::filter(Year == years[year_value + 1],
                    Indicator.Name %in% c(xaxis_column_name,
                                          yaxis_column_name))  %>%
      droplevels() %>%
      split(., .$Indicator.Name)
    
    filtered_df <- merge(data_by_indicator[[1]], data_by_indicator[[2]], by = "Country.Name") %>%
      dplyr::transmute(x = Value.x, y = Value.y, text = Country.Name) %>%
      na.omit() %>%
      as.list()
    
    inputData <- list(
      c(
        filtered_df,
        list(
          opacity = 0.7,
          mode = 'markers',
          marker = list(
            size = 15,
            line = list(width = 0.5, color = 'white')
          )
        )
      )
    )
    
    list(
      data = inputData,
      layout = list(
        xaxis = list('title' = xaxis_column_name, 'type' = xaxis_type),
        yaxis = list('title' = yaxis_column_name, 'type' = yaxis_type),
        margin = list('l' = 40, 'b' = 40, 't' = 10, 'r' = 10),
        legend = list('x' = 0, 'y' = 1),
        hovermode = 'closest'
      )
    )
  }
)

app %>% run_app()