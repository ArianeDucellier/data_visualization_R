library(dash)

df <- read.csv(
  file="https://raw.githubusercontent.com/plotly/datasets/master/gapminderDataFiveYear.csv",
  stringsAsFactor=FALSE,
  check.names=FALSE
)

continents <- unique(df$continent)

data_gdp_life_exp_2007 <- lapply(
  continents,
  function(cont){
    list(
      x = df$gdpPercap[df$continent == cont],
      y = df$lifeExp[df$continent == cont],
      opacity=0.7,
      text=df$country[df$continent == cont],
      mode="markers",
      name=cont,
      marker=list(size=15, line=list(width=0.5, color="white"))
    )
  }
)

app <- dash_app()

app %>% set_layout(
  dccGraph(
    id="life-exp-vs-gdp",
    figure = list(
      data = data_gdp_life_exp_2007,
      layout = list(
        xaxis=list("type"="log", "title"="GDP Per Capita"),
        yaxis=list("title"="Life Expectancy"),
        margin=list("l"=40, "b"=40, "t"=10, "r"=10),
        legend=list("x"=0, "y=1"),
        hovermode="closest"
      )
    )
  )
)

app %>% run_app()
