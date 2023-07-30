# Type register_google(key="my_key") in the console before sourcing the code
# to access Google Maps Platform (used by mutate_geocode)

library(gapminder)
library(ggmap)
library(tidyverse)

get_data <- function(){
  mapData = gapminder %>%
    mutate(country2 = as.character(country)) %>%
    group_by(country) %>%
    slice(1) %>%
    mutate_geocode(country2) %>%
    select(-country2)
  
  mapData = left_join(gapminder, mapData) %>%
    group_by(country) %>%
    fill(lon) %>%
    fill(lat)
  
  save(mapData, file = "geocodedData.Rdata")
}

get_data()
