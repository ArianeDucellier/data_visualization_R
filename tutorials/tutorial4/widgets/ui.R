fluidPage(

  titlePanel("STAT 451 - Visualizing Data - Autumn 2025 - Widget values and data types"),

  sidebarLayout(

    sidebarPanel(
      checkboxGroupInput(inputId="checkGroup",
                         label="checkboxGroupInput",
                         choices=list("Ice cream" = "IC",
                                      "Trifle" = "Trifle",
                                      "Pistachios" = "Pist")
      ),

      checkboxInput(inputId="boxInput",
                    label="checkboxInput"),

      dateInput(inputId="theDate",
                label="dateInput"),

      dateRangeInput(input="dateRange",
                     label="dateRangeInput"),

      numericInput(inputId="pickNumber",
                   label="numericInput",
                   min=1, max=10, value=1),

      radioButtons(inputId="pickRadio",
                   label="rdioButtons",
                   choices=list("Taxi" = "Taxi",
                                "take a walk" = "Walk")),

      selectInput(inputId="comboBox",
                  label="selectInput",
                  choices=list("News" = "News",
                               "Situation comedy" = "Sitcom",
                               "Film" = "Film")),

      sliderInput(inputId="slider",
                  label="sliderInput",
                  min=1, max=10, value=7, step=1),

      textInput(inputId="comment",
                label="textInput",
                value="")
    ),
  
    mainPanel(
      h3("Outputs"),
      textOutput("textDisplay_checkGroup"),
      textOutput("textDisplay_boxInput"),
      textOutput("textDisplay_theDate"),
      textOutput("textDisplay_dateRange"),
      textOutput("textDisplay_pickNumber"),
      textOutput("textDisplay_pickRadio"),
      textOutput("textDisplay_comboBox"),
      textOutput("textDisplay_slider"),
      textOutput("textDisplay_comment"),

      h3("Class of outputs"),
      textOutput("classDisplay_checkGroup"),
      textOutput("classDisplay_boxInput"),
      textOutput("classDisplay_theDate"),
      textOutput("classDisplay_dateRange"),
      textOutput("classDisplay_pickNumber"),
      textOutput("classDisplay_pickRadio"),
      textOutput("classDisplay_comboBox"),
      textOutput("classDisplay_slider"),
      textOutput("classDisplay_comment")
    )
  )
)
