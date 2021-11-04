time_splits_raw <- function(url) {
  resp <- request(url) |>
    req_perform()

  df_splits <- resp |>
    resp_body_html() |>
    html_elements(xpath = "/html/body/div/table") |>
    html_table() |>
    first() |>
    mutate(across(everything(), as.character))

  tibble(url = url, time_splits = list(df_splits))
}
