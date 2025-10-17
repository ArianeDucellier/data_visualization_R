# Minimal example - Definition of the user interface

# We will start by a fluid page. We will see later that other options are
# possible for the dashboard.
fluidPage(

  # We create a panel for the title
  titlePanel("STAT 451 - Visualizing Data - Autumn 2025 - Minimal example"),

  # We will use a sidebar layout (with a side bar on the left and the main
  # panel on the right). We will see later than other layouts are possible.
  sidebarLayout(

    # We create the side bar. It will be placed on the left.
    sidebarPanel(

      # Here, we can insert some widgets for the user to enter some input.
      # Let's use a box to enter some text.
      textInput(# inputId is used as a reference to later access the value
                #entered by the user.
                inputId = "comment",
                # The label is placed above the text box
                # We can here explain to the user what they should enter in
                # the box.
                label = "What would you like to say?",
                # This is the default value before the user enters something.
                value = ""
      )
    ),

    # We create the main panel. It will be placed on the right.
    mainPanel(

      # This is how to create a header
      h3("This is you saying it"),

      # This command indicates that we print a text.
      # The content of the text will be created in the server.R part
      # and saved in the variable output$textDisplay
      textOutput("textDisplay")
    )
  )
)
