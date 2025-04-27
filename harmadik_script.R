# harmadik módosítás
# jelentős késések kiválogatása és vizualizálása
library(tidyverse)

# Szűrés, rendezés, top 10 kiválasztása
topkesok <- flights %>%
  filter(dep_delay > 120) %>%
  arrange(desc(dep_delay)) %>%
  slice(1:10)

# Vizualizáció: járatszám szerint tesszük
ggplot(topkesok, aes(x = reorder(paste(origin, dest, sep = " → "), 
                                   dep_delay), 
                       y = dep_delay, fill=dep_delay)) +
  geom_col(show.legend = FALSE) +
  coord_flip() +
  scale_fill_gradient(low = "orange", high = "blue") +
  labs(
    title = "10 legnagyobb indulási késés",
    x = "Útvonal (kiinduló → célállomás)",
    y = "Indulási késés"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    plot.title = element_text(face = "bold", hjust = 0.5),
    axis.text = element_text(color = "gray20"),
    axis.title = element_text(face = "bold")
  )