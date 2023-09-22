library(dash)

df <- read.csv(url("https://gist.githubusercontent.com/chriddyp/c78bf172206ce24f77d6363a2d754b59/raw/c353e8ef842413cae56ae3920b8fd78468aa4cb2/usa-agricultural-exports-2011.csv"))

generate_table <- function(df, nrows = 10) {
  nrows <- min(nrows, nrow(df))
  rows <- lapply(
    seq(nrows),
    function(row) {
      html$tr(lapply(as.character(df[row, ]), html$td))
    }
  )
  header <- html$td(children = lapply(names(df), html$th))
  html$table(
    c(list(header), rows)
  )
}

app <- dash_app()

app %>% set_layout(
  div(
    h4('US Agriculture Exports (2011)'),
    generate_table(df),
    style= list("overflow-x" = "scroll")
  )
)

app %>% run_app()