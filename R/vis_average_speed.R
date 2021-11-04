vis_average_speed <- function(df_time_splits) {
  df_time_splits |>
    ggplot(aes(x = km, y = km_h, color = rider)) +
      geom_point() +
      geom_line() +
      labs(y = "Average Speed", x = "Kilometer") +
      theme_light() +
      theme(legend.position = "bottom")
}
