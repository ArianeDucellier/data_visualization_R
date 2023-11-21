library(dash)

app <- dash_app()

app %>% set_layout(
  h1("Hello dash"),
  div("Dash: A web application framework for your data"),
  dccGraph(
    figure = list(
      data = list(
        list(
          x=list(1, 2, 3),
          y=list(4, 1, 2),
          type="bar",
          name="SF"
        ),
        list(
          x=list(1, 2, 3),
          y=list(2, 4, 5),
          type="bar",
          name="Montreal"
        )
      ),
      layout=list(title="Dash data visualization")
    )
  )
)

app %>% run_app()
