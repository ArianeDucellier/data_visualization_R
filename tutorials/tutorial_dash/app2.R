library(dash)

app <- dash_app()

colors <- list(
  background = '#111111',
  text = '#7FDBFF'
)

app %>% set_layout(
  div(
    h1(
      'Hello Dash',
      style = list(
        textAlign = 'center',
        color = colors$text
      )
    ),
    div(
      'Dash for R: A web application framework for R.',
      style = list(
        textAlign = 'center',
        color = colors$text
      )
    ),
    dccGraph(
      id = 'example-graph-2',
      figure = list(
        data = list(
          list(
            x = list(1, 2, 3),
            y = list(4, 1, 2),
            type = 'bar',
            name = 'SF'
          ),
          list(
            x = list(1, 2, 3),
            y = list(2, 4, 5),
            type = 'bar',
            name = 'Montr\U{00E9}al'
          )
        ),
        layout = list(
          plot_bgcolor = colors$background,
          paper_bgcolor = colors$background,
          font = list(color = colors$text)
        )
      )
    ),
    style = list(backgroundColor = colors$background)
  )
)

app %>% run_app()