function(input, output){
  output$textDisplay = renderText({
    paste0("You said '",
           input$comment,
           "'. There are ",
           nchar(input$comment),
           " characters in this."
    )
  })
}