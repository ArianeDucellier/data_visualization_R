library(dash)

app <- dash_app()

app %>% set_layout(
  div(
    html$label('Dropdown'),
    dccDropdown(
      options = list(list(label = "New York City", value = "NYC"),
                     list(label = "Montreal", value = "MTL"),
                     list(label = "San Francisco", value = "SF")),
      value = 'MTL'
    ),
    
    html$label('Multi-Select Dropdown'),
    dccDropdown(
      options = list(list(label = "New York City", value = "NYC"),
                     list(label = "Montreal", value = "MTL"),
                     list(label = "San Francisco", value = "SF")),
      value = list('MTL', 'SF'),
      multi = TRUE
    ),
    
    html$label('Radio Items'),
    dccRadioItems(
      options = list(list(label = "New York City", value = "NYC"),
                     list(label = "Montreal", value = "MTL"),
                     list(label = "San Francisco", value = "SF")),
      value = 'MTL'
    ),
    
    html$label('Checkboxes'),
    dccChecklist(
      options = list(list(label = "New York City", value = "NYC"),
                     list(label = "Montreal", value = "MTL"),
                     list(label = "San Francisco", value = "SF")),
      value = list('MTL', 'SF')
    ),
    
    html$label('Text Input'),
    dccInput(value = 'MTL', type = 'text'),
    
    html$label('Slider'),
    dccSlider(
      min = 0,
      max = 9,
      marks = c("", "Label 1", 2:5),
      value = 5
    ),
    style = list('columnCount' = 1)
  )
)

app %>% run_app()