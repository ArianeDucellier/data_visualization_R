library(dash)

app <- dash_app()

app %>% set_layout(
  html$h6("Change the value in the text box to see callbacks in action!"),
  div(
    "Input: ",
    dccInput(id = 'my-input', value = 'initial value', type = 'text')
  ),
  br(),
  div(id = 'my-output')
)

app %>% add_callback(
  output(id = 'my-output', property = 'children'),
  input(id = 'my-input', property = 'value'),
  function(input_value) {
    sprintf("Output: \"%s\"", input_value)
  }
)

app %>% run_app()