fluidPage(

  titlePanel("Widget values and data types"),

  sidebarLayout(

    sidebarPanel(
#      checkboxGroupInput(inputId="checkGroup",
#                         label="checkboxGroupInput",
#                         choices=list("Ice cream" = "IC",
#                                      "Trifle" = "Trifle",
#                                      "Pistachios" = "Pist")
#      )
#      checkboxInput(inputId="boxInput",
#                    label="checkboxInput")
#      dateInput(inputId="theDate",
#                label="dateInput")
#      dateRangeInput(input="dateRange",
#                     label="dateRangeInput")
#      numericInput(inputId="pickNumber",
#                   label="numericInput",
#                   min=1, max=10, value=1)
#      radioButtons(inputId="pickRadio",
#                   label="rdioButtons",
#                   choices=list("Taxi" = "Taxi",
#                                "take a walk" = "Walk"))
#      selectInput(inputId="comboBox",
#                  label="selectInput",
#                  choices=list("News" = "News",
#                               "Situation comedy" = "Sitcom",
#                               "Film" = "Film"))
#      sliderInput(inputId="slider",
#                  label="sliderInput",
#                  min=1, max=10, value=7, step=1)
      textInput(inputId="comment",
                label="textInput",
                value="")
    ),
  
    mainPanel(
      h3("Output"),
      textOutput("textDisplay"),
      h3("Class of output"),
      textOutput("classDisplay")
    )
  )
)