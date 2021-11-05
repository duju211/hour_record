time_splits <- function(df_time_splits_raw) {
  df_time_splits_raw |>
    mutate(time_splits = map(time_splits, ~ filter(.x, str_detect(X1, "^\\d+$")))) |>
    unnest(time_splits) |>
    select(where(~ !all(is.na(.x)))) |>
    transmute(
      rider = str_to_title(str_remove(
        map_chr(str_split(url, "/"), 4), "\\.htm")),
      km = parse_integer(X1),
      time = ms(str_remove(X4, "\\.\\d+$")), km_h = parse_number(X5)) |>
    filter(!is.na(km_h))
}
