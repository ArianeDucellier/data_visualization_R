library(dash)

markdown_text <- "
### Dash and Markdown

Dash apps can be written in Markdown.
Dash uses the [CommonMark](http://commonmark.org/)
specification of Markdown.
Check out their [60 Second Markdown Tutorial](http://commonmark.org/help/)
if this is your first introduction to Markdown!
"

dash_app() %>%
  set_layout(dccMarkdown(markdown_text)) %>%
  run_app()