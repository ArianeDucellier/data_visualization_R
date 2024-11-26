library(dash)

app <- dash_app()

app %>% set_layout(
  html$h1("Dash widgets"),
  html$h2("Enter inputs into the widgets"),
  div(
    "dccCheckList: ",
    dccChecklist(
      id="checkGroup",
      options=list(
        list("label"="Ice cream", "value"="IC"),
        list("label"="Trifle", "value"="Trifle"),
        list("label"="Pistachios", "value"="Pist")
      ),
      value=list("IC", "Trifle")
    )
  ),
  div(
    "dbcCheckbox: ",
    dbcCheckbox(
      id="boxInput"
    )
  ),
#  div(
#    "dccDatePickerSingle: ",
#    dccDatePickerSingle(
#      id="theDate"
#    )
#  ),
#  div(
#    "dccDatePickerRange: ",
#    dccDatePickerRange(
#      id="dateRange"
#    )
#  ),
#  div(
#    "dccInput: ",
#    dccInput(
#      id="pickNumber",
#      type="number",
#      min=1,
#      max=10,
#      value=1
#    )
#  ),
  div(
    "dccRadioItems: ",
    dccRadioItems(
      id="pickRadio",
      options=list("Taxi"="Taxi",
                   "Take a walk"="Walk")
    )
  ),
  div(
    "dccDropdown: ",
    dccDropdown(
      id="comboBox",
      options=list("News"="News",
                   "Situation comedy"="Sitcom",
                   "Film"="Film")
    )
  ),
  div(
    "dccSlider: ",
    dccSlider(
      id="slider",
      min=1,
      max=10,
      step=1,
      value=7
    )
  ),
  div(
    "dccInput: ",
    dccInput(
      id="comment",
      value="",
      type = "text"
    )
  ),
  html$h2("And look at the output values you get"),
  div(id = "output1"),
  div(id = "output2"),
#  div(id = "output3"),
#  div(id = "output4"),
#  div(id = "output5")
  div(id = "output6"),
  div(id = "output7"),
  div(id = "output8"),
  div(id = "output9")
)

app %>% add_callback(
  list(
    output(id = "output1", property = "children"),
    output(id = "output2", property = "children"),
#    output(id = "output3", property = "children"),
#    output(id = "output4", property = "children"),
#    output(id = "output5", property = "children")
    output(id = "output6", property = "children"),
    output(id = "output7", property = "children"),
    output(id = "output8", property = "children"),
    output(id = "output9", property = "children")
  ),
  list(
    input(id = "checkGroup", property = "value"),
    input(id = "boxInput", property = "value"),
#    input(id = "theDate", property = "value"),
#    input(id = "dateRange", property = "value"),
#    input(id = "number", property = "value")
    input(id = "pickRadio", property = "value"),
    input(id = "comboBox", property = "value"),
    input(id = "slider", property = "value"),
    input(id = "comment", property = "value")
  ),
  function(input1,
           input2,
#           input3
#           input4,
#           input5
           input6,
           input7,
           input8,
           input9
  ) {
    list(
      sprintf("Output of dccCheckList: \"%s\"", input1),
      sprintf("Output of dbcCheckbox: \"%s\"", input2),
#      sprintf("Output of dccDatePickerSingle: \"%s\"", input3),
#      sprintf("Output of dccDatePickerRange: \"%s\"", input4),
#      sprintf("Output of dccInput: \"%s\"", class(input5))
      sprintf("Output of dccRadioItems: \"%s\"", input6),
      sprintf("Output of dccDropdown: \"%s\"", input7),
      sprintf("Output of dccSlider: \"%s\"", input8),
      sprintf("Output of dccInput: \"%s\"", input9)
    )
  }
)

app %>% run_app()
