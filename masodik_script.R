#ez lesz a második módosítás
#vizualizációk
library(nycflights13)
library(dplyr)
library(ggplot2)

flights%>%
  group_by(month)%>%
  summarise(avg_delay = mean(dep_delay, na.rm = TRUE)) %>%
  ggplot(aes(x = factor(month), y = avg_delay, fill = avg_delay)) +
  geom_col(show.legend = FALSE) +
  scale_fill_gradient(low = "#56B1F7", high = "#132B43") +
  labs(
    title= "Átlagos indulási késés hónapok szerint",
    x ="Hónap",
    y ="Átlagos késés (perc)"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    plot.title = element_text(face = "bold", hjust=0.5),
    axis.text = element_text(color = "gray20"),
    axis.title = element_text(face = "bold")
  )

#ugyanezt megcsináljuk az érkezési késésekkel

flights %>%
  group_by(month) %>%
  summarise(avg_delay = mean(arr_delay, na.rm = TRUE)) %>%
  ggplot(aes(x = factor(month), y = avg_delay, fill = avg_delay)) +
  geom_col(show.legend = FALSE) +
  scale_fill_gradient(low = "#56B1F7", high = "#132B43") +
  labs(
    title= "Átlagos érkezési késés hónapok szerint",
    x ="Hópan",
    y ="Átlagos késés (perc)"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    plot.title = element_text(face = "bold", hjust = 0.5),
    axis.text = element_text(color = "gray20"),
    axis.title = element_text(face = "bold")
  )