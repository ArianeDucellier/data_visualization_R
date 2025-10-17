# Minimal example - Definition of the server part

# The server part always contains a function with arguments input and output.
# input contains all the inputId defined in the user interface part.
# output contains all the variables referred to in the user interface.
function(input, output){

  # Here the output variable textDisplay is defined and can be referred
  # to in the user interface.
  output$textDisplay = renderText({
    paste0("You said '",
           # We use the inputId comment defined in the user interface
           # and get the value entered by the user.
           input$comment,
           "'. There are ",
           nchar(input$comment),
           " characters in this."
    )
  })
}
