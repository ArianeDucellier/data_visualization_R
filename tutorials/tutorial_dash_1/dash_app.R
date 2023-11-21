library(dash)

app <- dash_app()

app %>% set_layout(
  html$h1("Minimal example"),
  div("What would you like to say?"),
  div(dccInput(id="comment", value="", type="text")),
  br(),
  div("This is you saying it"),
  div(id="textdisplay")
)

app %>% add_callback(
  output(id="textdisplay", property="children"),
  input(id="comment", property="value"),
  function(input_value) {
    sprintf("%s", input_value)
  }
)

app %>% run_app()
