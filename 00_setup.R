# ---------------------------------------------------------------------------
# 00_setup.R — pacotes, tema visual e paletas
# ---------------------------------------------------------------------------

pacotes_necessarios <- c(
  "readr", "dplyr", "tidyr", "tibble", "stringr", "forcats",
  "ggplot2", "plotly", "DT", "scales", "htmltools"
)

# Rode uma única vez, se necessário:  instalar_pacotes_faltantes()
instalar_pacotes_faltantes <- function(pkgs = pacotes_necessarios) {
  faltando <- pkgs[!vapply(pkgs, requireNamespace, logical(1), quietly = TRUE)]
  if (length(faltando)) {
    message("Instalando: ", paste(faltando, collapse = ", "))
    install.packages(faltando, repos = "https://cloud.r-project.org")
  }
  invisible(faltando)
}

suppressPackageStartupMessages({
  library(readr)
  library(dplyr)
  library(tidyr)
  library(tibble)
  library(stringr)
  library(forcats)
  library(ggplot2)
  library(plotly)
  library(DT)
  library(scales)
  library(htmltools)
})

# Obs.: não alteramos options(OutDec) — a formatação em português é aplicada
# explicitamente pelas funções pct_br()/num_br().
options(
  dplyr.summarise.inform = FALSE,
  scipen = 999
)

`%||%` <- function(x, y) if (is.null(x) || length(x) == 0) y else x

# ---------------------------------------------------------------------------
# Paleta institucional
# ---------------------------------------------------------------------------

# CORES$frio é a cor padrão das barras simples do painel; as escalas abaixo
# são usadas nos gráficos empilhados (graf_100) e de cruzamento.
CORES <- list(
  escuro    = "#1F2933",
  texto     = "#3E4C59",
  suave     = "#7B8794",
  grade     = "#E4E7EB",
  fundo     = "#FFFFFF",
  destaque  = "#0B6E4F",   # verde mineração
  alerta    = "#C0392B",   # vermelho
  atencao   = "#E8853A",   # laranja
  neutro    = "#F4D35E",   # amarelo
  frio      = "#1B6CA8",   # azul
  roxo      = "#6C4675",
  na        = "#C9CCD1"
)

# Escala divergente ruim -> bom (5 níveis)
CORES_RUIM_BOM <- c("#C0392B", "#E8853A", "#F4D35E", "#7CBF9A", "#0B6E4F")
# Escala nunca -> sempre para itens NEGATIVOS (sempre = ruim)
CORES_FREQ_NEG <- c("#0B6E4F", "#7CBF9A", "#F4D35E", "#E8853A", "#C0392B")
# Escala nunca -> sempre para itens POSITIVOS (sempre = bom)
CORES_FREQ_POS <- c("#C0392B", "#E8853A", "#F4D35E", "#7CBF9A", "#0B6E4F")
# Escala de divisão do trabalho de cuidado
CORES_CUIDADO <- c("#6C4675", "#A98BB0", "#1B6CA8", "#9FC6E0", "#C9CCD1")
# Escala categórica qualitativa
CORES_QUALI <- c("#0B6E4F", "#1B6CA8", "#E8853A", "#6C4675", "#C0392B",
                 "#7CBF9A", "#F4D35E", "#7B8794", "#3E4C59", "#9FC6E0",
                 "#B5651D", "#A3B18A", "#D4A5A5")

#' Monta uma paleta nomeada a partir dos níveis de um fator.
#' Níveis excedentes (tipicamente "Não sei", "Não recebo", "Não conheço")
#' recebem a cor cinza de ausência de informação.
paleta_escala <- function(niveis, cores_base = CORES_RUIM_BOM, cor_na = CORES$na) {
  n <- length(niveis)
  cores <- rep(cor_na, n)
  k <- min(length(cores_base), n)
  cores[seq_len(k)] <- cores_base[seq_len(k)]
  stats::setNames(cores, niveis)
}

# ---------------------------------------------------------------------------
# Tema ggplot
# ---------------------------------------------------------------------------

tema_tso <- function(base_size = 12) {
  theme_minimal(base_size = base_size) +
    theme(
      text             = element_text(colour = CORES$texto),
      plot.title       = element_text(face = "bold", colour = CORES$escuro,
                                      size = base_size * 1.05, hjust = 0),
      plot.subtitle    = element_text(colour = CORES$suave, size = base_size * 0.9),
      plot.caption     = element_text(colour = CORES$suave, size = base_size * 0.75,
                                      hjust = 0),
      axis.title       = element_text(size = base_size * 0.85),
      axis.text        = element_text(colour = CORES$texto, size = base_size * 0.85),
      panel.grid.minor = element_blank(),
      panel.grid.major = element_line(colour = CORES$grade, linewidth = 0.35),
      legend.position  = "bottom",
      legend.title     = element_blank(),
      legend.key.height = unit(10, "pt"),
      legend.text      = element_text(size = base_size * 0.78),
      strip.text       = element_text(face = "bold", colour = CORES$escuro),
      plot.margin      = margin(6, 10, 6, 6)
    )
}

theme_set(tema_tso())

# Formatação em português
pct_br <- function(x, acc = 0.1) {
  scales::percent(x, accuracy = acc, decimal.mark = ",", big.mark = ".")
}
num_br <- function(x, acc = 0.1) {
  scales::number(x, accuracy = acc, decimal.mark = ",", big.mark = ".")
}
