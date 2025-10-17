# Widgets - Definition of the server part

function(input, output) {
  
  output$textDisplay_checkGroup = renderText({
    paste(input$checkGroup, collapse=",")
  })

  output$textDisplay_boxInput = renderText({
    input$boxInput
  })

  output$textDisplay_theDate = renderText({
    as.character(as.Date(input$theDate, origin="1970-01-01"))
  })

  output$textDisplay_dateRange = renderText({
    paste(as.character(as.Date(input$dateRange[[1]], origin="1970-01-01")),
          as.character(as.Date(input$dateRange[[2]], origin="1970-01-01")),
          collapse=",")
  })

  output$textDisplay_pickNumber = renderText({
    input$pickNumber
  })

  output$textDisplay_pickRadio = renderText({
    input$pickRadio
  })

  output$textDisplay_comboBox = renderText({
    input$comboBox
  })

  output$textDisplay_slider = renderText({
    input$slider
  })

  output$textDisplay_comment = renderText({
    input$comment
  })

  output$classDisplay_checkGroup = renderText({
    class(input$checkGroup)
  })

  output$classDisplay_boxInput = renderText({
    class(input$boxInput)
  })

  output$classDisplay_theDate = renderText({
    class(input$theDate)
  })

  output$classDisplay_dateRange = renderText({
    class(input$dateRange)
  })

  output$classDisplay_pickNumber = renderText({
    class(input$pickNumber)
  })

  output$classDisplay_pickRadio = renderText({
    class(input$pickRadio)
  })

  output$classDisplay_comboBox = renderText({
    class(input$comboBox)
  })

  output$classDisplay_slider = renderText({
    class(input$slider)
  })

  output$classDisplay_comment = renderText({
    class(input$comment)
  })
}
