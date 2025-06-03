# Carregar bibliotecas
library(GetBCBData)
library(tidyverse)
library(gganimate)
library(scales)
library(lubridate)

# Buscar série CDI do BCB
my.id <- c(tcpib = 3711)

df.bcb <- gbcbd_get_series(
  id = my.id,
  first.date = '1970-12-31',  # Você pode ajustar aqui a data inicial
  last.date = '2015-01-01',     # Até a data atual
  format.data = 'long',
  use.memoise = TRUE,
  cache.path = tempdir(),
  do.parallel = FALSE
)

# Conferir os dados
glimpse(df.bcb)

# Gráfico animado bonito e completo
p <- ggplot(df.bcb, aes(x = ref.date, y = value)) +
  geom_line(color = "#2E86C1", size = 1.2) +
  geom_point(color = "#117A65", size = 1.5) +
  scale_y_continuous(labels = label_percent(scale = 1)) +
  labs(
    title = 'Evolução da Taxa CDI no Brasil',
    subtitle = 'Data: 1970-2015',
    x = 'Ano',
    y = 'Taxa de Juros CDI (% a.d.)',
    caption = paste0('Período: ', format(min(df.bcb$ref.date), "%d/%m/%Y"), 
                     ' até ', format(max(df.bcb$ref.date), "%d/%m/%Y"))
  ) +
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(face = "bold", size = 18, hjust = 0.5),
    plot.subtitle = element_text(size = 14, hjust = 0.5),
    plot.caption = element_text(size = 10),
    axis.text = element_text(size = 12),
    axis.title = element_text(size = 14)
  ) +
  transition_reveal(ref.date)

# Gerar a animação com gifski_renderer
 animacao <- animate(
  p,
  renderer = gifski_renderer(),  # <- isso força o uso correto
  width = 1000,
  height = 500,
  fps = 25,
  duration = 12,
  end_pause = 10
)

# Salvar como GIF
 anim_save("grafico_animado_CDI.gif", animation = animacao)

 