source("libraries.R")

walk(dir_ls("R"), source)

list(
  tar_target(
    rel_urls, c(
      "http://www.wolfgang-menn.de/voigt.htm",
      "http://www.wolfgang-menn.de/braendle.htm",
      "http://www.wolfgang-menn.de/dennis.htm",
      "http://www.wolfgang-menn.de/dowsett.htm",
      "http://www.wolfgang-menn.de/wiggins.htm",
      "http://www.wolfgang-menn.de/campenaerts.htm",
      "http://www.wolfgang-menn.de/bigham.htm",
      "http://www.wolfgang-menn.de/ganna.htm")),

  tar_target(
    df_time_splits_raw, time_splits_raw(rel_urls), pattern = map(rel_urls)),
  tar_target(df_time_splits, time_splits(df_time_splits_raw)),
  tar_target(gg_average_speed, vis_average_speed(df_time_splits)),

  tar_render(hour_record, "hour_record.Rmd"),
  tar_render(
    hour_record_post, "hour_record.Rmd",
    output_format = distill::distill_article(),
    output_file = "hour_record_post.html")
)
