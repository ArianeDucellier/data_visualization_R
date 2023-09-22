library(dash)

app <- dash_app()

app %>% set_layout(
  dccInput(id = 'input-1-state', type = 'text', value = 'Montreal'),
  dccInput(id = 'input-2-state', type = 'text', value = 'Canada'),
  button(id = 'submit-button', n_clicks = 0, 'Submit'),
  div(id = 'output-state')
)

app %>% add_callback(
  output('output-state', 'children'),
  list(
    input('submit-button', 'n_clicks'),
    state('input-1-state', 'value'),
    state('input-2-state', 'value')
  ),
  function(n_clicks, input1, input2) {
    sprintf("The Button has been pressed \"%s\" times, Input 1 is \"%s\", and Input 2 is \"%s\"", n_clicks, input1, input2)
  }
)

app %>% run_app()