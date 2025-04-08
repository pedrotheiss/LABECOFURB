library(WDI)
library(ggplot2)
library(dplyr)

# Baixando os dados completos
dadosChargestheuseofintellectualproperty <- WDI(country = 'all', indicator = 'BX.GSR.ROYL.CD')

# Filtrando para o Brasil e para o ano de 2023
dadosChargestheuseofintellectualpropertybr <- filter(dadosChargestheuseofintellectualproperty, country == "Brazil")
dadosChargestheuseofintellectualproperty2023 <- filter(dadosChargestheuseofintellectualproperty, year == 2023)

# --------------------------
# 1. GRÁFICO EM PAINEL
# --------------------------
grafpainel <- ggplot(data = dadosChargestheuseofintellectualproperty,
                     mapping = aes(x = year, y = BX.GSR.ROYL.CD)) +
  # Pontos para todos os países
  geom_point(aes(color = country), alpha = 0.5, show.legend = FALSE) +
  # Destaque para o Brasil
  geom_point(data = dadosChargestheuseofintellectualpropertybr,
             aes(x = year, y = BX.GSR.ROYL.CD),
             color = "red", size = 2) +
  # Título e rótulos
  labs(title = "Painel: Uso de propriedade intelectual por país",
       x = "Ano",
       y = "Charges the use of intellectual property") +
  theme_minimal(base_family = "Helvetica") +
  theme(
    plot.title = element_text(size = 16, face = "bold"),
    axis.title = element_text(size = 12),
    axis.text = element_text(color = "gray30")
  )

print(grafpainel)

# --------------------------
# 2. GRÁFICO DE CORTE TRANSVERSAL (2023)
# --------------------------
grafcorte <- ggplot(data = dadosChargestheuseofintellectualproperty2023,
                    mapping = aes(x = year, y = BX.GSR.ROYL.CD)) +
  geom_point(color = "steelblue", alpha = 0.6) +
  labs(title = "Corte Transversal: Propriedade intelectual em 2023",
       x = "Ano",
       y = "Charges the use of intellectual property 2023") +
  theme_minimal(base_family = "Helvetica") +
  theme(
    plot.title = element_text(size = 16, face = "bold"),
    axis.title = element_text(size = 12),
    axis.text = element_text(color = "gray30")
  )

print(grafcorte)

# --------------------------
# 3. GRÁFICO DE SÉRIE TEMPORAL (BRASIL)
# --------------------------
grafserie <- ggplot(data = dadosChargestheuseofintellectualpropertybr,
                    mapping = aes(x = year, y = BX.GSR.ROYL.CD)) +
  geom_line(color = "red", size = 1.2) +
  geom_point(color = "red", size = 2) +
  labs(title = "Série Temporal: Propriedade intelectual - Brasil",
       x = "Ano",
       y = "Charges the use of intellectual property br") +
  theme_minimal(base_family = "Helvetica") +
  theme(
    plot.title = element_text(size = 16, face = "bold"),
    axis.title = element_text(size = 12),
    axis.text = element_text(color = "gray30")
  )

print(grafserie)
