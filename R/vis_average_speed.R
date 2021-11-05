vis_average_speed <- function(df_time_splits) {
  df_time_splits |>
    ggplot(aes(x = km, y = km_h, color = rider)) +
      geom_point() +
      geom_line() +
      labs(
        y = "Average Speed", x = "Kilometer",
        title = "Development of Speeds by Hour Record Attempt",
        subtitle = "Different Riders are represented by color") +
      theme_light() +
      theme(legend.position = "bottom")
}
