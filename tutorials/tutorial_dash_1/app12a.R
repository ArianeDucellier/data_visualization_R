library(dash)

app <- dash_app()

app %>% set_layout(
  dccInput(id = 'input-1', type = 'text', value = 'Montreal'),
  dccInput(id = 'input-2', type = 'text', value = 'Canada'),
  div(id = 'output_keywords')
)

app %>% add_callback(
  output('output_keywords', 'children'),
  list(
    input('input-1', 'value'),
    input('input-2', 'value')
  ),
  function(input1, input2) {
    sprintf("Input 1 is \"%s\" and Input 2 is \"%s\"", input1, input2)
  }
)

app %>% run_app()
