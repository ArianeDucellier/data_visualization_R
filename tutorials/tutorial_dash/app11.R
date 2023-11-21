library(dash)

app <- dash_app()

all_options <- list(
  'America' = list('New York City', 'San Francisco', 'Cincinnati'),
  'Canada' = list('Montr\U{00E9}al', 'Toronto', 'Ottawa')
)

app %>% set_layout(
  dccRadioItems(
    id = 'countries-radio',
    options = list(list(label = 'America', value = 'America'),
                   list(label = 'Canada', value = 'Canada')),
    value = 'America'
  ),
  html$hr(),
  dccRadioItems(id = 'cities-radio'),
  html$hr(),
  div(id = 'display-selected-values')
)

app %>% add_callback(
  output('cities-radio', 'options'),
  input('countries-radio', 'value'),
  function(selected_country) {
    data_selected <- all_options[[selected_country]]
    lapply(data_selected,
           function(dat) {
             list('label' = dat,
                  'value' = dat)
           })
  })

app %>% add_callback(
  output('cities-radio', 'value'),
  input('cities-radio', 'options'),
  function(option) NULL
)

app %>% add_callback(
  output('display-selected-values', 'children'),
  list(
    input('countries-radio', 'value'),
    input('cities-radio', 'value')
  ),
  function(selected_country, selected_city) {
    sprintf("\"%s\ is a city in \"%s\"", selected_city, selected_country)
  })

app %>% run_app()