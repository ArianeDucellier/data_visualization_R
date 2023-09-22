library(dash)

app <- dash_app()

app %>% set_layout(
  dccInput(
    id = 'num-multi',
    type = 'number',
    value = 1
  ),
  html$table(
    html$tr(html$td('x', html$sup(2)), html$td(id='square')),
    html$tr(html$td('x', html$sup(3)), html$td(id='cube')),
    html$tr(html$td('2', html$sup('x')), html$td(id='twos')),
    html$tr(html$td('3', html$sup('x')), html$td(id='threes')),
    html$tr(html$td('x', html$sup('x')), html$td(id='xx'))
  )
)

app %>% add_callback(
  list(
    output('square', 'children'),
    output('cube', 'children'),
    output('twos', 'children'),
    output('threes', 'children'),
    output('xx', 'children')
  ),
  input('num-multi', 'value'),
  function(x) {
    list(x**2, x**3, 2**x, 3**x, x**x)
  }
)

app %>% run_app()